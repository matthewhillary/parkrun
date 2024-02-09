#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param athletes
get_parkrun_results <- function(athletes) {

  athletes %>%
    tibble::enframe(value = "athlete_id", name = "athlete_name") %>%
    mutate(dat = map(athlete_id, scrape_parkrun_results_live)) %>%
    unnest(dat)

}
