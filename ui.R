library(shiny)

shinyUI(fluidPage(
  titlePanel("MTCARS MPG Explorer"),
  sidebarLayout(
    sidebarPanel(
      helpText("Explore how vehicle weight and horsepower relate to fuel economy."),
      sliderInput(
        "hp",
        "Horsepower range",
        min = min(mtcars$hp),
        max = max(mtcars$hp),
        value = c(min(mtcars$hp), max(mtcars$hp))
      ),
      checkboxGroupInput(
        "am",
        "Transmission",
        choices = c("Automatic" = 0, "Manual" = 1),
        selected = c(0, 1)
      ),
      checkboxGroupInput(
        "gear",
        "Gears",
        choices = sort(unique(mtcars$gear)),
        selected = sort(unique(mtcars$gear))
      )
    ),
    mainPanel(
      h4("Fuel economy vs. vehicle weight"),
      plotOutput("scatterPlot"),
      h4("Filtered cars"),
      tableOutput("summaryTable"),
      h4("Filtered summary"),
      verbatimTextOutput("summaryText")
    )
  )
))
