# server.R
library(shiny)
shinyServer(
    function(input, output) {
        wt <- reactive({as.numeric(input$wt)/1000}) #converted to thousands
        cyl <- reactive({as.numeric(input$cyl)})
        hp <- reactive({as.numeric(input$hp)})
        pred <- reactive({as.numeric(input$cyl) + as.numeric(input$hp)})
        fit <- reactive({lm(mpg ~ wt + cyl +  hp, data = mtcars)})
        df <- reactive({data.frame(cyl = as.numeric(input$cyl), 
                                        wt = as.numeric(input$wt/1000), #convert to thousands of pounds
                                        hp = as.numeric(input$hp))})
        mpg <- reactive({predict({fit()}, newdata = {df()})})
        
        #compute litres per 100 km
        
        gpm <- reactive({1/mpg()}) # gallons per mile
        lpm <- reactive({3.78/mpg()}) # litres per mile
        lpkm <- reactive({lpm()/1.609}) # litres per km
        lp100km <- reactive({lpkm() * 100}) # litres per 100 km
         
        output$cyl <- renderText({ 
            paste("Number of cylinders: ", {cyl()})
        })
        
        output$wt <- renderText({ 
            paste("Weight: ", {wt()*1000}, "pounds, or ", {wt()*1000*0.4536}, "kg")
        })
        
        output$hp <- renderText({ 
            paste("Horse Power: ", {hp()})
        })
        
        output$mpg <- renderText({
            paste("Estimated mpg: ", round({mpg()}, 2))})
        
        output$lp100km <- renderText({
            paste("Estimated litres per 100 km: ", round({lp100km()}, 2))})                
        
    }
)