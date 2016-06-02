#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(calibrate)

# Create a linear model predicting MPG 
m <- lm(mpg ~ disp + wt, data=mtcars)

shinyServer(function(input, output) {
  
  # Generate a prediction given the values set by the user
  out <- reactive({
    prediction <- predict(m, newdata=data.frame(disp=input$disp, wt=input$weight/1000))
    a <- as.character(round(prediction, 1))
    paste(a, "MPG")
  })
  
  # Show the prediction via a plot
  output$plot <- renderPlot({
    margins <- par()$mar
    margins[3] = 2.0
    par(cex=1.1, mar=margins)
    
    plot(
      input$disp, input$weight, 
      ylim=c(0, 6000), xlim=c(0,550), 
      xlab="Displacement", ylab="Weight",
      pch=19, col="blue", cex=2.0
      )
         
    title(main="Predicted MPG", col.main="blue", cex.main = 1.8)
    textxy(input$disp, input$weight, out(), cex=1.2, offset = 0.8)
    segments(input$disp, 0, input$disp, input$weight, lty=3)
    segments(0, input$weight, input$disp, input$weight, lty=3)
  })
  
})
