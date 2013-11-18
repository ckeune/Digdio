# library(shiny)
# 
# # Define UI for dataset viewer application
# shinyUI(pageWithSidebar(
#   
#   # Application title
#   headerPanel("Keune Test"),
#   
#   # Sidebar with controls to select a dataset and specify the number
#   # of observations to view
#   sidebarPanel(
#     selectInput("dataset", "Choose a dataset:", 
#                 choices = c("Social", "msft")),
#     selectInput("Station", "Call-Letters", 
#                 list("WHTZ_FM", "WHTZ-FM",
#                      "WQXR-FM", "WQXR-FM")),
#     
#     numericInput("obs", "Number of observations to view:", 10)
#   ),
#   
#   # Show a summary of the dataset and an HTML table with the requested
#   # number of observations
#   mainPanel(
#     verbatimTextOutput("summary"),
#     
#     tableOutput("view")
#   )
# ))

library(shiny)
library(ggplot2)  # for the diamonds dataset

shinyUI(pageWithSidebar(
  headerPanel('Testing - Shiny'),
  
  
  
  sidebarPanel(
    selectInput("Market", "Choose a Market:", 
                choices = unique(stationSocial$'market_name')),
    
    checkboxGroupInput('show_vars', 'Columns stations social :', names(stationSocial),
                       selected = names(stationSocial)),
    helpText('THE CAKE IS A LIE.')
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel('stationSocial',
               h3(textOutput('Station Dashboard')),
               p(textOutput('Select Market')), 
               #------------
#                tags$div(class = "row-fluid", 
#                         #tags$div(class = "span"),
#                         tags$div(class = "span9", htmlOutput("callout_v_time_area_fig")),
#                         tags$div(class = "span3")
#                ),
               HTML("<hr>"), dataTableOutput("mytable1")),
      
      tabPanel('msftstock',
               dataTableOutput("mytable2"))
#       tabPanel('iris',
#                dataTableOutput("mytable3"))
    )
  )
))