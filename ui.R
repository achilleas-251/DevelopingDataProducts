library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Central Limit Theorem"),
  
  sidebarLayout(
    sidebarPanel(
       sliderInput('lambda',
                   'Value of λ:',
                   min = 0.1,
                   max = 1,
                   value = 0.1),
         sliderInput('n',
                     'Size of sample:',
                     min = 1,
                     max = 1000,
                     value = 10),
       checkboxInput('show_sampleMean', 'Show sample mean', value = FALSE),
       checkboxInput('show_theorMean', 'Show theoretical mean', value = FALSE),
       checkboxInput('show_dnorm', 'Show normal distribution', value = FALSE)
    ),
      
    mainPanel(
       tabsetPanel(
         tabPanel('Plot', plotOutput('distPlot')),
         tabPanel('Documentation', h5('This app simulates the distribution of averages of random samples of exponential 
          distributions, and outputs the corresponding histogram.'), 
                                   h5('The user can set the value of the rate parameter λ of the exponential distribution,
                                                                       as well as the sample size by adjusting the corresponding sliders.'), 
                                   h5("Ticking the 'Show sample mean' box draws a line at the position of the mean of the distribution 
                                       of sample averages."),
                                   h5('According to the central limit theorem as the sample size, n, increases, the distribution of sample averages
                                      approaches the normal distribution N(μ, s) where μ is the mean of the exponential distribution, 1/λ, and
                                      the standard deviation σ = 1/λ*sqrt(1/n).'),
                                   h5("Ticking the 'Show theoretical mean' box draws a line at the position of μ, and ticking  
                                       the 'Show normal distribution' box draws the probability density of the normal distribution N(μ, s)
                                      over the histogram."),
                                   h5('References: '),
                                   tags$a(href='https://en.wikipedia.org/wiki/Exponential_distribution', 'exponential distribution, '),
                                   tags$a(href='https://en.wikipedia.org/wiki/Central_limit_theorem', 'central limit theorem')
                  
                  )
         )
      
    )
  )
))
