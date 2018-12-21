# renderR

A command line interface for ```R rmardown::render```. 

This cli allows for a quick and easy interface to render. It allows modification 
of the output file name, the directory the output is placed and the format of the output. 

## Usage

```
render.R [--] [--help] [--verbose] [--output_dir OUTPUT_DIR]
       [--output_file OUTPUT_FILE] [--format FORMAT] input_file

Render Rmd files from the command line easily

positional arguments:
  input_file         file to be rendered

flags:
  -h, --help         show this help message and exit
  -v, --verbose      toggle verbose output

optional arguments:
  -d, --output_dir   directory the output will be placed in
  -n, --output_file  name of output file
  -f, --format       output format
```

Note: the long argument names are the same as the render::rmarkdown arguments

##  Install and setup

Note: These instructions are mac only (Windows is hard...)

Download:

```
git clone https://github.com/Voltemand/renderR

cd renderR

chmod +x render.R # makes the script executable

cp ./render.R /usr/local/bin # makes it accesible from all directories
```
Finally, add the line `alias render="render.R"` to your `.bash_profile`. This 
allows you to run the command as `render` instead of `render.R` a nice cosmetic 
improvement

## Dependencies

This package depends heavily on `argparser` and uses `crayon` for cosmetics.

