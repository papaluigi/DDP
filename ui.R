library(shiny)
library(BH)
library(rCharts)
require(markdown)
require(data.table)
library(plyr)
library(dplyr)
library(DT)
library(stringi)
library(stringr)

shinyUI(fluidPage(

  # Application title
  titlePanel("French Citizens living abroad"),

  # Sidebar with a dropdwon list and 2 sliders input for yers and population threshold
  sidebarLayout(
    sidebarPanel(
      sliderInput("year",
                  "Select Year :",
                  min = 2001,
                  max = 2013,
                  value = 2002
      ),
      selectInput("contIn",label="Select Continent :",
                  choices=list("AFRICA"="AF",
                               "NORTH AMERICA"="NA",
                               "SOUTH AMERICA"="SA",
                               "EUROPE"="EU",
                               "ASIA"="AS",
                               "OCEANIA"="OC"),
                  selected="AF"
      ),
      uiOutput("thrIn")
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Visualization",
          plotOutput("countBarPlot")
        ),#End of TabPanel Visualize
      
        tabPanel("Dataset",
          #verbatimTextOutput("contOut"),
          h4("Select continent of the left handside to filter data"),
          dataTableOutput("data2Out")
        ),#End of TabPanel Dataset
        tabPanel("Static Plot",
          h4("This one is just a static plot"),       
          plotOutput("contBarPlot")
        )#End of TabPanel Dataset
        )
    )# End of mainpanel 
  )
))
