navbarPage(
  title = 'Beauty of Nature!',
  tabPanel('Home', br(),
           tags$p(style = "font-family: 'Lobster', cursive; font-size: 24px; text-align: center; font-style: italic;",
                  tags$strong(
                    '"The scientist does not study nature because it is useful;',
                    'he studies it because he delights in it,',
                    'and he delights in it because it is beautiful." -(Henry Poincare)')),hr(),
           tags$p(style = "font-family: 'times', serif; font-size: 20px; text-align: center;",
                  tags$b('Around us, there are many very beautiful patterns (facts),
                  which can be described as mathematical function.',br(), 
                         'Examples: Shape of snowflakes, Sunflower seed, Romanesco brocoli etc.')),
           tags$h3(style = "font-family: 'Impact', serif; font-size: 30px; text-align: center; color: blue; font-style: bold", 'Natural Patterns'),
           tags$p(class = "text-center", tags$img(src = 'collage_natural_patterns.png')),hr(),
           tags$p(style = "font-family: 'arial', serif; font-size: 17px; text-align: center; color: red",
                  tags$b('In navbar pane, under nav there are three tabs viz. about, plot and data. 
                     In the sidebar pane there are sliders for different input options.',br(), 
                         'Play with it. Also you can download plot (png format) and data (CSV format).'))
  ),
  # 2nd tab panel                           
  tabPanel('Phyllotaxis',
           sidebarLayout(
             sidebarPanel(
               sliderInput("a", "Select a:", min = 0, max = 20, step = 1, value = 3, round = 0),
               sliderInput('b', 'Select b:', min = 0, max = 20, step = 1, value = 5),
               sliderInput('points', 'Select number of points:', min = 100, max = 10000, step = 100, value = 500),
               selectInput('pch_input', 'Select ploting character type:', choices = c('Circle' = 21,
                                                                                      'Square' = 22,
                                                                                      'Diamond' = 23,
                                                                                      'Triangle Up' = 24,
                                                                                      'Triangle Down' = 25), selected = 'Circle'),
               sliderInput('point_size', 'Select ploting character size:', min = 0, max = 3, step = 0.01, value = 1),
               colourInput('bgcolor', 'Select background colour of plot:', 'black'),
               colourInput('ptcolor', 'Select point colour of plot:', 'green'),
             ),
             mainPanel(
               tabsetPanel(selected = 'About',
                           tabPanel('About', tags$p(class = "text-center", tags$img(src = 'math_behind_it.png'))),
                           tabPanel('Plot', withSpinner(plotOutput('plot1', height = 600, width = 600),type = 4),
                                    downloadButton('dwn_plot_1', 'Download Plot')),
                           tabPanel('Data', withSpinner(dataTableOutput('table1')),
                                    downloadButton('dwn_data_1', 'Download Data'))
               )
             )
           )
  ),
  tabPanel('About Me', br(),
           tags$p(class = "text-center", tags$img(src = 'kkmaity.png')),
           tags$p(style = "font-family: 'Lobster', cursive; font-size: 24px; text-align: center; font-style: italic;",
                  tags$strong('Krishnakanta Maity')),hr(),
           tags$p(style = "font-family: 'Oswald', serif; font-size: 20px; text-align: left; color: red; font-style:normal", tags$b('Description')),
           tags$p(style = "font-family: 'Bookman Old Style', serif; font-size: 18px; text-align: left",
                  tags$b('Currently, I’m student. I pursuing my M.Sc. degree in Statistics from the Visva-Bharati University 
                         and completed my B.Sc. degree in statistics from Midnapore College (Autonomous).')),
           tags$p(style = "font-family: 'Oswald', serif; font-size: 20px; text-align: left; color: red", tags$b('Interest')),
           tags$ol(style = "font-family: 'Bookman Old Style', serif; font-size: 18px; text-align: left",
                  tags$b(tags$li('Data Visualization'),tags$li('Machine Learning'))),hr(),br(),
           tags$p(style = "font-family: 'Oswald', serif; font-size: 28px; text-align: center; color: red", tags$b('Contacts')),
           tags$p(tags$a(href="https://www.linkedin.com/in/iamkkmcmd/",tags$img(src = 'social-011-round_linkedin.png')),
                  tags$a(href="https://github.com/iamkkmcmd",tags$img(src = 'social-041-round_github.png')),
                  tags$a(href="https://twitter.com/iamkkmcmd",tags$img(src = 'social-003-round_twitter.png')), style = 'text-align:center')
    
  ),
  setBackgroundColor(color = rainbow(7, alpha = 0.5),
                     gradient = 'radial',
                     direction = c('bottom', 'left'))
)
