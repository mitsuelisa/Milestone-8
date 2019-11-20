#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(markdown)
library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- navbarPage("Who is causing water stress in Mexico City?",
                 tabPanel("Interactive Map",
                          sidebarLayout(
                              sidebarPanel(
                                  radioButtons("plotType", "Circle Size",
                                               c("Total Consumed Cubic Meters in 2019"="p")
                                  )
                              ),
                              mainPanel(
                                  read_rds("superzip.rds")
                              )
                          )
                 ),
                 tabPanel("About",
                          fluidRow(
                              column(6,
                                     includeMarkdown("about.Rmd")
                              ),
                              column(3,
                                     img(class="img-polaroid",
                                         src= "https://lh3.googleusercontent.com/QbpmcKaQ68U8Kxq2cMqWFiEc8iN5kLTrO5vcp7PQ1gJNQ3DZ5hxyPxxc9jWr_N_6GQ"
                                     )
                              )
                          )
                 )
)

    
    
    
    

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    output$plot <- renderPlot({
        plot(cars, type=input$plotType)
    })
    
    output$about <- renderPrint({
        summary(cars)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
