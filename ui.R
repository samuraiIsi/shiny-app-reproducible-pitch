library(shiny)

shinyUI(fluidPage(
  titlePanel("MTCARS MPG Explorer"),
  sidebarLayout(
    sidebarPanel(
      h4("How to use this app"),
      helpText("Use the controls below to filter the cars shown in the plot and table."),
      tags$ol(
        tags$li("Choose a horsepower range with the slider."),
        tags$li("Select one or both transmission types."),
        tags$li("Pick the gear counts you want to include."),
        tags$li("Read the plot, table, and summary to compare fuel economy.")
      ),
      helpText("Tip: if your filters are too narrow, the plot may ask you to include more cars."),
      hr(),
      h4("Filters"),
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
