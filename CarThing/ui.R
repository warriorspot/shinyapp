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
  theme="custom.css",
  titlePanel("Predict vehicle MPG by displacement and weight"),
  br(),
  HTML("<h4><b>Displacement:</b> Engine displacement in cubic inches</h4>"),
  HTML("<h4><b>Weight:</b> Vehicle weight in pounds</h4>"),
  br(),
  sidebarLayout (
    sidebarPanel(
      sliderInput("disp", "Displacement", 50, 500, value = 100, step = 5),
      sliderInput("weight", "Weight", 1000, 5000, value = 2000, step = 100)
    ),
    mainPanel(
      plotOutput("plot")
    )
  ))
)
