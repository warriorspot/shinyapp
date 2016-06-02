#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  verticalLayout(
    titlePanel("Predict MPG by displacement and weight"),
    mainPanel(
      align="center",
      plotOutput("plot")
    ),
    sidebarPanel(
      width=200,
      sliderInput("disp", "Displacement", 50, 500, value = 100, step = 5),
      sliderInput("weight", "Weight", 1000, 5000, value = 2000, step = 100)
    ))
))
