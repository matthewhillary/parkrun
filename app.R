library(targets)
library(shiny)
library(plotly)
library(dplyr)



results <- tar_read(results) %>%
  filter(!(athlete_name == 'Matt' & time_mins > 25))

all_athletes <- unique(results$athlete_name) %>% sort()

# Define the UI
ui <- fluidPage(
  titlePanel("Parkrun Times and Age Gradings"),
  sidebarLayout(
    sidebarPanel(
      checkboxInput("show_age_plot", "Show Age Grade Plot", value = FALSE),
      checkboxGroupInput("athletes", "Select athletes to display:", choices = all_athletes, selected = all_athletes),
      hr(),
      helpText("Select the athletes you want to display in the plots."),
      dateInput("start_date", "Start Date", value = Sys.Date() - 365),
    ),
    mainPanel(
      plotlyOutput("times_plot"),
      conditionalPanel(
        condition = "input.show_age_plot",
        plotlyOutput("age_plot")
      )
    )
  )
)

# Define the server
server <- function(input, output) {
  # Create a reactive subset of the results dataframe based on the selected athletes
  selected_results <- reactive({
    results %>%
      filter(athlete_name %in% input$athletes,
             run_date >= input$start_date)
  })

  # Create a plotly chart of time_mins vs date for the selected athletes
  output$times_plot <- renderPlotly({
    create_times_plot(res = selected_results())

  })

  # Create a plotly chart of age_grade vs date for the selected athletes
  output$age_plot <- renderPlotly({
    create_age_grade_plot(res = selected_results())

  })
}

# Run the app
shinyApp(ui, server)
