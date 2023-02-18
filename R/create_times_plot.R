#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param res
create_times_plot <- function(res = selected_results()) {

  res %>%
    plot_ly(x = ~run_date, color = ~athlete_name) %>%
    add_trace(y = ~time_mins, type = "scatter", mode = "lines+markers")

}
