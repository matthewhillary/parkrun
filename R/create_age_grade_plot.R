#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param res
create_age_grade_plot <- function(res = selected_results()) {

  res %>%
    plot_ly(x = ~run_date, color = ~athlete_name) %>%
    add_trace(y = ~age_grade, type = "scatter", mode = "lines+markers")

}
