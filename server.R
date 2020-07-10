
function(input, output){
  df_1 <- reactive({
    construct_df1(a = input$a,
                  b = input$b,
                  n = input$points)
  })
  pch_type <- reactive({
    as.integer(input$pch_input)
  })
  color_1 <- reactive({
    input$bgcolor
  })
  color_2 <- reactive({
    input$ptcolor
  })
  p_size_1 <- reactive({
    input$point_size
  })
  output$plot1 <- renderPlot({
    Sys.sleep(1)
    ggp_f(DF = df_1(), pch = pch_type(), p_size = p_size_1(), c1 = color_1(), c2 = color_2())
  })
  
  output$dwn_plot_1 <- downloadHandler(
    filename = function(){
      paste('phyllotaxis_plot', 'png', sep = '.')
    },
    content = function(file){
      ggsave(filename = file,
             plot = ggp_f(DF = df_1(), pch = pch_type(), p_size = p_size_1(), c1 = color_1(), c2 = color_2()), 
             device = 'png')
    }
  )
  
  output$table1 <- renderDataTable({
    Sys.sleep(1)
    datatable(df_1())
  })
  
  output$dwn_data_1 <- downloadHandler(
    filename = function(){
      paste('phyllotaxis_data', 'csv', sep = '.')
    },
    content = function(file){
      write.csv(df_1(), file)
    }
  )
  
}