#!/usr/bin/env Rscript

# This is a helper script to run the pipeline.
# Choose how to execute the pipeline below.
# See https://books.ropensci.org/targets/hpc.html
# to learn about your options.
targets::tar_invalidate(results)
targets::tar_make()
gert::git_commit_all("automatic update")
gert::git_push()
