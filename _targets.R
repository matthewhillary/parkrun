# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
library(tarchetypes) # Load other packages as needed. # nolint

# Set target options:
tar_option_set(
  packages = c("tibble", "purrr", "reticulate", "stringr", "lubridate", "dplyr", "tidyr"), # packages that your targets need to run
  format = "rds", # default storage format
  workspace_on_error = TRUE
  # Set other options as needed.
)

# tar_make_clustermq() configuration (okay to leave alone):
#options(clustermq.scheduler = "multiprocess")

# tar_make_future() configuration (okay to leave alone):
# Install packages {{future}}, {{future.callr}}, and {{future.batchtools}} to allow use_targets() to configure tar_make_future() options.

# Run the R scripts in the R/ folder with your custom functions:
tar_source()
reticulate::use_virtualenv(here::here("myenv"))
reticulate::source_python("./python/scrape_parkrun_results_py.py")

# Replace the target list below with your own:
list(
  tar_target(athletes, c(Matt = 2865,
                         Zach = 4127516,
                         Lucia = 5377749,
                         Bella = 3914972,
                         Kat = 6869)),
  tarchetypes::tar_age(
    results,
    get_parkrun_results(athletes),
    age = as.difftime(1, units = "days")),

   tar_target(report, rmarkdown::render("docs/parkrun_results.qmd", output_file = "index.html"), cue = tar_cue("always"))
)
