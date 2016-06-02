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

m <- lm(mpg ~ disp + wt, data=mtcars)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  out <- reactive({
    a <- as.character(round(predict(m, newdata=data.frame(disp=input$disp, wt=input$weight/1000)), 1))
    paste(a, "MPG")
  })
  
  output$plot <- renderPlot({
    with(mtcars, plot(input$disp, input$weight, ylim=c(0, 6000), xlim=c(0,550), xlab="Displacement", ylab="Weight", main="Predicted MPG"))
    textxy(input$disp, input$weight, out(), cex=1.0, offset = 0.8)
  })
  
})
