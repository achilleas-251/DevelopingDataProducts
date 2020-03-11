library(shiny)
library (ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  
  output$distPlot <- renderPlot({
    
    set.seed(307)
    
    mns = NULL
    for (i in 1 : 1000) mns = c(mns, mean(rexp(input$n,input$lambda)))
    
    if (input$show_sampleMean) { 
      l1 <- geom_vline(aes(xintercept = mean(mns), color = 'sample mean'), size = 1, color = 'bisque3') 
    } else {
      l1 <- geom_line(aes(y = 0), size = 0)
    }
    
    if (input$show_theorMean) { 
      l2 <- geom_vline(aes(xintercept = 1/input$lambda, color = 'theoretical mean'), size = 1, linetype = 'dashed', color = 'bisque4') 
    } else {
      l2 <- geom_line(aes(y = 0), size = 0)
    }
    
    
    ggplot(data.frame(mns), aes(x = mns)) +
      geom_histogram(aes(y = ..density..), fill = 'lemonchiffon2',
                    color = 'lemonchiffon3', alpha = .8) +
      labs(x = 'sample averages')  + l1 + l2 +
      if (input$show_dnorm) { stat_function(fun = dnorm, args = list(mean=1/input$lambda, sd = (1/input$lambda)*sqrt(1/input$n)),
                    color = "bisque4", size = 1,  show.legend = FALSE) } 
  })
  
})
