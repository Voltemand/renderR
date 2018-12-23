#!/usr/bin/env Rscript --vanilla

# Script for running a command line interface to the rmarkdown::render function

library(argparser, quietly = TRUE)
library(crayon)

p <- arg_parser("Render Rmd files from the command line easily", hide.opts = TRUE)

# Add command line arguments
p <- add_argument(p, "input_file", help = "file to be rendered")

p <- add_argument(p, "--output_dir", help = "directory the output will be placed in", short = "-d")

p <- add_argument(p, "--output_file", help = "name of output file", short = "-n")

p <- add_argument(p, "--verbose", help = "toggle verbose output", flag = TRUE)

p <- add_argument(p, "--format", help = "output format")

# Parse the command line arguments
argv <- parse_args(p)

# Allow partial matching on format
if (!is.na(argv$format)) {
  # TODO Overwrite error
  argv$format <- match.arg(argv$format, choices = c("pdf_document", "html_document"))
} else {
  argv$format <- NULL
}

# If no output_file name is specified make NULL to use render behaviour
if(is.na(argv$output_file)){
  argv$output_file <- NULL
}

if (is.na(argv$output_dir)) {
  # TODO Parse the file name and check whether it's possible
  argv$output_dir <- dirname(argv$input_file)
}

if (!is.null(argv$output_file)){
  if (strsplit(basename(argv$output_file), "\\.")[[1]][2] !=
      strsplit(argv$format, "\\_")[[1]][1]){
    stop("File extension and knitting format do not match!")
  }
}

if (argv$verbose == TRUE){
  rmarkdown::render(input = argv$input_file,
                    output_dir = argv$output_dir,
                    output_format = argv$format,
                    output_file = argv$output_file,
                    quiet = FALSE)
} else {
  cat("Rendering file:", basename(argv$input_file), "... "))

  rmarkdown::render(input = argv$input_file,
                    output_dir = argv$output_dir,
                    output_format = argv$format,
                    output_file = argv$output_file,
                    quiet = TRUE)

  cat(cli::symbol$tick, "\n")

  cat("File", bold(argv$output_file), "- created in directory -", bold(argv$output_dir), "\n")
}
