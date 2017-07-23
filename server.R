
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library('shiny')
library('ggplot2')
library('scales')

shinyServer(function(input, output) {

  df<-read.csv2(file = './TestData.csv',header = TRUE,na = "", sep = ';', dec = '.')
  df$Time <- as.POSIXct(df$sending_timestamp,format="%Y-%m-%dT%H:%M")
  ddf <- reactiveValues(data = data.frame())
  
  datasetInput <- reactive({
    
      dateFROM <- as.Date(input$DateRange_1[1])
      dateTO <- as.Date(input$DateRange_1[2])
      
      ddf$data <- df[as.Date(df$sending_timestamp) >= as.Date(input$DateRange_1[1]) & as.Date(df$sending_timestamp) <= as.Date(input$DateRange_1[2]),]
      return(ddf$data)
      })
      output$txtout1 <- renderText({
      paste("Selected date range", 
          difftime(input$DateRange_1[2], input$DateRange_1[1], units="days"),
          "days since ", as.character(input$DateRange_1[2]))
  }) 
  
  output$table1 <- renderTable({
    head(datasetInput(), n = 5)
  })
  
  output$txtout2 <- renderText({
    paste("Last 5 records out of ",nrow(ddf$data),". Total limit set to 15000")
  })
  
  output$txtout3 <- renderText({
    unRPi <- unique(ddf$data$lokatorsID)
    lastStatus <- ddf$data[nrow(ddf$data),]$sending_timestamp
    paste("Devices selected: ", length(unRPi))
  })
  
  output$table2 <- renderTable({
    unRPi <- unique(ddf$data$lokatorsID)
    d <- data.frame(id = character(), timestamp = character())
    for(i in 1 : length(unRPi)){
      timed <- ddf$data[ddf$data$lokatorsID == unRPi[i],]$sending_timestamp
      time <- as.character(timed[1])
      d <- rbind(d,c(unRPi[i],time))
    }
    colnames(d) <- c('Device ID', 'Last update')
    return(d)
  })
  
  output$plot1 <- renderPlot({
    ddf$data$temp <- as.numeric(ddf$data$temp)
    g <- ggplot(data = ddf$data, aes(ddf$data$temp)) +
      geom_histogram(col = "blue",fill = "green",alpha = .5,bins = input$slider1) +
      labs(title="Temperature distribution for the selected period") +
      labs(x="Temp in Co", y="Count")
    return(g)
  })
  
  output$plot2 <- renderPlot({
    ddf$data$CPU_load_1 <- as.numeric(ddf$data$CPU_load_1)
    g <- ggplot(ddf$data, aes(ddf$data$Time, ddf$data$CPU_load_1)) +
          geom_line() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
          scale_x_datetime(labels = date_format("%Y-%m-%d  %H:%M:%S")) + 
          geom_smooth(method='lm',formula=y~x)+
          labs(title="CPU load - Core one") +
          labs(x="Date and time", y="CPU load value 0 - 1.0")
    return(g)
  })
  
  output$plot3 <- renderPlot({
    g <- ggplot(ddf$data, aes(ddf$data$Time, ddf$data$temp)) +
      geom_line() +
      theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
      scale_x_datetime(labels = date_format("%Y-%m-%d  %H:%M:%S")) + 
      geom_smooth(method='lm',formula=y~x)+
      labs(title="Temperature values over the period") +
      labs(x="Date and time", y="Temp in Co")
    return(g)
  })
  
  
  })
