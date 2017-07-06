#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
getNames <- function(data) {
  names <- data.frame(data$Name.)
  return(names)
}

library(shinydashboard)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
    output$dataset <- renderUI({
      inFile <- input$file1
      
      if (is.null(inFile))
        return(NULL)
      
      selectInput("dataset", NULL, read.csv(inFile$datapath, header=TRUE))
      # input$dataset <-read.csv(inFile$datapath, header=TRUE)
      
    })
    
    output$athlete <- renderUI({
      inFile <- input$file1
      
      if (is.null(inFile))
        return(NULL)
      
      data <- read.csv(inFile$datapath, header=TRUE)
      names <- data.frame(data$Name.)
      colnames(names) <- c("Athletes")
      selectInput("name", "Select an athlete", as.list(names))
      
    })
    
    
    output$content <- renderTable({
      if (is.null(input$name)) return("No athlete data to show.")
      
      athleteFocus = input$name
      inFile <- input$file1
      data <- read.csv(inFile$datapath, header=TRUE)
      
      athletes <- data.frame(data$Name.)
      rownames(data) <- athletes$data.Name.
      data[c(athleteFocus),]
      
    })
    
    output$plot3 <- renderPlot({
      # if (is.null(input$name)) return(NULL)

      x <- c(1,2,2,4,2,6,3,5,3,2,4,2,3,3,3,3,3,1,7,7,1,2,4,2,4,3,1,1,1,7,8,3,2)
      hist(x, xlab = "# Questions Passed", ylab = "# People", main = NULL)
    })
    
    output$spine <- renderInfoBox({
      if (is.null(input$name)) {
        box(
        taskItem(value = 0, color = "blue",
                 "Thoracic Spine")
        )
      }
      else if (input$name == "Mike Mcgoldrick") {
       tabBox(
         id = "tabset1", tabPanel("Tab1",
          taskItem(value = 15, color = "red",
                   "Thoracic Spine")),
         tabPanel("Tab2", "Failed this screen")
        )
      }
      else {
        infoBox(
          "Thoracic Spinc", "80%", icon = icon("thumbs-up", lib = "glyphicon"),
          color = "green"
        )
      }
    })
    
    output$wrist <- renderInfoBox({
      if (is.null(input$name)) {
        box(
          taskItem(value = 0, color = "blue",
                   "Wrist")
        )
      }
      else if (input$name == "Mike Mcgoldrick") {
        box(
          taskItem(value = 73, color = "yellow",
                   "Wrist")
        )
      }
      else{
        infoBox(
          "Wrist", "2 out 5", icon = icon("thumbs-down", lib = "glyphicon"),
          color = "red"
        )
      }
    })
    
    output$shoulders <- renderInfoBox({
      if (is.null(input$name)) {
        box(
          taskItem(value = 0, color = "blue",
                   "Shoulder")
        )
      }
      else if (input$name == "Mike Mcgoldrick"){
        box(
          taskItem(value = 95, color = "green",
                   "Shoulder")
        )
      }
      else{
        box(
          taskItem(value = 4, color = "red",
                   "Shoulder")
        )
      }
    })
})
