# parkrun

<!-- badges: start -->

<!-- badges: end -->

The goal of parkrun is to scrape the family parkrun results.

# Installation

I couldn't scrape the results with {rvest} so this project uses python (selenium). There is a dependency on **chromedriver** (`C:\Users\family\chromedriver\chromedriver.exe`) which I downloaded from [here](https://chromedriver.chromium.org/downloads). Note that the version of **chromedriver** needs to match the version of the chrome browser. You can download the correct version of chromedriver from \`[https://sites.google.com/chromium.org/driver/?pli=1\`](https://sites.google.com/chromium.org/driver/?pli=1`). Just delete the old version and replace with the new one you've downloaded.

# To run

`r source("run.R")` will fetch new data and refresh the targets pipeline. Then you can run `app.R` to launch the shiny app to see the data.
