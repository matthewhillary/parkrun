
# This file is no longer needed

scrape_parkrun_results_r <- function(athlete_number = 4127516){

  # note this is a call to a python function which is defined in `./python/scrape_parkrun_results_py.py`
  res_raw <- scrape_parkrun_results_py(as.integer(athlete_number))

  res_raw %>%
    mutate(run_date = lubridate::dmy(run_date),
           age_grade = str_sub(age_grade, 1, 5) %>% as.numeric(),
           time_mins = str_sub(time, 1, 2) %>% as.numeric() + (str_sub(time, 4, 5) %>% as.numeric() %>% `/`(60)))

}
