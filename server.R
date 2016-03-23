library(shiny)

# Load Data Processing file
source("data_processing.R")

# Initialize matrix object (required for barplot)
as.matrix(data2)

shinyServer(function(input, output) {

  # Slider with dynamic range depending on year and continent selected
  output$thrIn <- renderUI({
    
    keeps <- c(input$year)
    sliderInput("thrIn",
                "French Popuplation span:",
                min = min(data[data$CONT_NAME == input$contIn, names(data) %in% keeps]),
                max = max(data[data$CONT_NAME == input$contIn, names(data) %in% keeps]),
                value = c(5000,50000)
    )
  })
  
  output$contBarPlot <- renderPlot({

    # Render a barplot for Continents data
    barplot(data4, 
              main=input$year,
              ylab="Number of French People",
              xlab="Year")
  })

  # Static barplot displaying cumulated data per year and continent
  output$countBarPlot <- renderPlot({
    
    # Filter the data
    df <- data[data$CONT_NAME %in% input$contIn, ]
    
    # Generate the matrix required for barplot
    data2 <- as.matrix(df[,2:14])
    row.names(data2) <- df$NAME_EN
    data2 <- t(data2)
    data2 <- data2[row.names(data2)==input$year,]
    data2 <- data2[data2 >= input$thrIn[1] & data2 <= input$thrIn[2]]
    data2 <<- data2
    
    barplot(sort(data2, decreasing=TRUE), 
            main=input$year,
            ylab="Number of French People",
            xlab="Country")
    
  })
  
  
  output$contOut <- renderPrint({input$contIn})
  
  output$data2Out <- renderDataTable({data[data$CONT_NAME %in% input$contIn, ]})
  
  
  
  
})
