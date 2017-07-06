#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "Movement Screen Analysis"),
  dashboardSidebar(fileInput('file1', 'Select a spreadsheet',
                             accept=c('text/csv',
                                      'text/comma-separated-values,text/plain',
                                      '.csv')),
                   uiOutput('athlete'),
                   
                   sidebarMenu(
                     menuItem("Overall", tabName = "overall"),
                     menuItem("Wrist", tabName = "wrist"),
                     menuItem("Shoulders", icon = icon("th"), tabName = "shoulders",
                              badgeLabel = "new", badgeColor = "green")
                   )
                  ),
  dashboardBody(
    tabItems(
      tabItem( tabName = "overall", fluidRow(
        infoBoxOutput("wrist"),
        infoBoxOutput("shoulders"),
        infoBoxOutput("spine"),
        box(
          title = "Distribution of Shoulder Questions Passed", status = "primary", solidHeader = TRUE,
          collapsible = TRUE,
          plotOutput("plot3", height = 250)
          )
        )),
        tabItem(tabName = "wrist",
                h2("Failed Wrist Screens")
        ),
        
        tabItem(tabName = "shoulders",
                h2("Failed Shoulder Screens")
        )
    )
    )
  )

