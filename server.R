library(shiny)

car_data <- transform(
  mtcars,
  model = rownames(mtcars),
  transmission = ifelse(am == 1, "Manual", "Automatic")
)

shinyServer(function(input, output) {
  filtered_data <- reactive({
    subset(
      car_data,
      hp >= input$hp[1] &
        hp <= input$hp[2] &
        am %in% as.numeric(input$am) &
        gear %in% as.numeric(input$gear)
    )
  })

  output$scatterPlot <- renderPlot({
    data <- filtered_data()

    validate(
      need(nrow(data) > 1, "Choose filters that leave at least two cars.")
    )

    plot(
      data$wt,
      data$mpg,
      pch = 19,
      col = ifelse(data$transmission == "Manual", "#2C7FB8", "#D95F0E"),
      xlab = "Weight (1000 lbs)",
      ylab = "Miles per gallon",
      main = "MPG decreases as car weight increases"
    )
    abline(lm(mpg ~ wt, data = data), col = "#333333", lwd = 2)
    legend(
      "topright",
      legend = c("Automatic", "Manual"),
      col = c("#D95F0E", "#2C7FB8"),
      pch = 19,
      bty = "n"
    )
  })

  output$summaryTable <- renderTable({
    data <- filtered_data()
    data[, c("model", "mpg", "hp", "wt", "gear", "transmission")]
  }, digits = 2)

  output$summaryText <- renderPrint({
    data <- filtered_data()

    if (nrow(data) == 0) {
      cat("No cars match the current filters.\n")
    } else {
      cat("Cars shown:", nrow(data), "\n")
      cat("Average MPG:", round(mean(data$mpg), 2), "\n")
      cat("Average horsepower:", round(mean(data$hp), 2), "\n")
      cat("Average weight:", round(mean(data$wt), 2), "\n")
    }
  })
})
