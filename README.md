# Shiny Application and Reproducible Pitch

This repository contains a submission-ready project for the Coursera `Developing Data Products` course project.

## Live application

https://img-mgt.shinyapps.io/mtcars-mpg-explorer/

## RPubs presentation

https://rpubs.com/Isi/mtcars-mpg-explorer-presentation

## Project contents

- `ui.R` and `server.R`: the Shiny application
- `pitch.Rmd`: the reproducible pitch presentation

## Application summary

The app uses the built-in `mtcars` dataset to let users explore how:

- vehicle weight relates to fuel economy (`mpg`)
- horsepower filters change the visible sample
- transmission type and number of gears affect the comparison

The app includes:

- interactive filters for horsepower, transmission, and gears
- a scatter plot of weight versus fuel economy
- a filtered results table
- a short text summary of the selected subset

## Running locally

Open R in this project folder and run:

```r
library(shiny)
runApp()
```
