
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Locator Admin data page"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      dateRangeInput("DateRange_1", "Date range of interest:",
                     start  = Sys.Date() - 1,
                     end    = Sys.Date(),
                     min    = "2017-01-01",
                     max    = "2017-12-01",
                     format = "dd.mm.yyyy",
                     separator = "."),
      helpText("Note: input data interval in days to select data from Cloudant"),
      sliderInput("slider1",min = 3, max = 20,animate = FALSE, value = 3, label = "Number of bars in distribution"),
      submitButton("Calculate statistics")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4("Basic statistics of RoBox devices in fleet"),
      textOutput("txtout1"),
      verbatimTextOutput("txtout3"),
      tableOutput("table2"),
      verbatimTextOutput("txtout2"),
      tableOutput("table1"),
      plotOutput("plot1"),
      
        fluidRow(
          column(width = 6,
                 plotOutput("plot2")),
          column(width = 6,
                 plotOutput("plot3"))
        )
    )
  )
))
