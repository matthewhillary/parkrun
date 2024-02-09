scrape_parkrun_results_live <- function(athlete_number = 2865){
  url <- glue::glue("https://www.parkrun.org.uk/parkrunner/{athlete_number}/all/")

  sess <- rvest::read_html_live(url)

  tables <- sess %>% rvest::html_elements("tbody") %>%
    rvest::html_text2()

  all_results <- tables[3]

  results <- all_results %>%
    stringr::str_split_1("\n") %>%
    tibble::as_tibble() %>%
    tidyr::separate(value, into = c("event", "run_date", "run_number", "position", "time", "age_grade", "pb"), sep = "\t") %>%
    dplyr::mutate(run_date = lubridate::dmy(run_date),
                  age_grade = stringr::str_sub(age_grade, 1, 5) %>% as.numeric(),
                  time_mins = stringr::str_sub(time, 1, 2) %>% as.numeric() + (stringr::str_sub(time, 4, 5) %>% as.numeric() %>% `/`(60)))

  return(results)
}
