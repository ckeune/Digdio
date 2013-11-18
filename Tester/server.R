# library(shiny)
# library(datasets)
# 
# # Define server logic required to summarize and view the selected dataset
# shinyServer(function(input, output) {
#   
#   # Return the requested dataset
#   datasetInput <- 
#     reactive({ 
#     switch(input$dataset,
#            "Social" = stationSocial,
#            "msft" = msftstock)
#   })
#   
#   # Generate a summary of the dataset
#   output$summary <- renderPrint({
#     dataset <- datasetInput()
#     summary(dataset)
#   })
#   
#   # Show the first "n" observations
#   output$view <- renderTable({
#     head(datasetInput(), n = input$obs)
#   })
# })

library(shiny)

load(file = "C:/R/Tester/testdata.RData")

shinyServer(function(input, output) {
  
  
  
  
  
  #   #Reactive values
  #   #---------------
  #output$selected_market <- renderText({input$market})
  market_sub <- reactive({subset(stationSocial, market_name = input$market_name)})
  output$market <- renderText({unique(stationSocial$'market_name')})
  
  #   output$selected_track   <- renderText({input$track})
  #   output$selected_artist  <- renderText({with(cmm_log_st_c, artist_name[match(input$track, track_title)])})
  #cmm_log_st_sub          <- reactive({arrange(subset(stationSocial, market_name == input$market), reaction)})
  cmm_log_st_sub          <- reactive({subset(stationSocial, market_name == input$market)})
  #  cmm_log_st_c_sub        <- reactive({subset(cmm_log_st_c, track_title == input$track)})
  #   #output$track_list     <- renderText({unique(cmm_log_tbl$'Track Title')})
  
  # a large table, reative to input$show_vars
  
 # output$callout_v_time_area_fig <- renderGvis({
    cmm_log_st_c_sub2 <- cmm_log_st_sub()
 # cmm_log_st_c_sub2['UNF'] <- cmm_log_st_c_sub2['UNF'] + (100 - rowSums(cmm_log_st_c_sub2[c('DDL', 'FAV', 'LIK', 'NEG', 'NOP', 'UNF')]))
    #cmm_log_st_c_sub2$date <- as.Date(cmm_log_st_c_sub2$date)
#     
#     callout_v_time_area_fig <- gvisLineChart(data = cmm_log_st_c_sub2,
#                                              xvar = 'date',
#                                              yvar = c('fb_likes','FB_PTAT' ),
#                                              options = list(isStacked = T, 
#                                                             title = 'Stations Likes vs PTAT',
#                                                             titleTextStyle = '{fontSize:18}',
#                                                             focusTarget = 'category',
#                                                             width = '100%',
#                                                             #hAxis = "{format:'MMM d y'}", 
#                                                             vAxis = "{title:'Percent (%)'}",
#                                                             reverseCategories = T
#                                              ))
#   }) 
  
  datasetInput <- reactive({
    switch(input$dataset,
  
  
  
  
  output$mytable1 = renderDataTable({
    library(ggplot2)
    stationSocial[, input$show_vars, drop = FALSE]
  })
  
  # sorted columns are colored now because CSS are attached to them
  output$mytable2 = renderDataTable({
    msftstock
  }, options = list(aLengthMenu = c(5, 30, 50), iDisplayLength = 5))

  #customize the length drop-down menu; display 5 rows per page by default
  output$mytable3 = renderDataTable({
    iris
  }, options = list(aLengthMenu = c(5, 30, 50), iDisplayLength = 5))
  
})