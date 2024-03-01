# parkrun

<!-- badges: start -->

<!-- badges: end -->

The goal of parkrun is to scrape the family parkrun results and display the results on github pages [here](https://matthewhillary.github.io/parkrun/).

# Installation

This is using{rvest} and can use the new read_html_live() function. This requires a chromedriver.

# To run

`r source("run.R")` will fetch new data and refresh the targets pipeline. Then you can run `app.R` to launch the shiny app to see the data. Push to github then view [here](https://matthewhillary.github.io/parkrun/).

# Notes
Check for new data [here](https://www.parkrun.org.uk/parkrunner/2865/all/)
