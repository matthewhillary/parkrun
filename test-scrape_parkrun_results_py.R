
library(reticulate)

source_python("./python/scrape_parkrun_results_py.py")
athlete_number = 4127516
res_raw <- scrape_parkrun_results_py(as.integer(athlete_number))
