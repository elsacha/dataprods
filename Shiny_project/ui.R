#library(shiny)
# ui.R

shinyUI(fluidPage(
    titlePanel("Estimated fuel consumption"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Estimate fuel consumption of your car"),
      
      sliderInput("wt", "Car weight:", 
                  value = 3000, min = 1500, max = 6000, step = 5),
      
      selectInput("cyl", 
                  label = "Number of cylinders:",
                  choices = c("4", "6", "8"),
                  selected = "6"),
      
      sliderInput("hp", "Horse power:", 
                  value = 100, min = 50, max = 300, step = 1)

    ),
    
    mainPanel(
      h5("Results:"),
      textOutput("wt"),
      textOutput("cyl"),
      textOutput("hp"),
      textOutput("mpg"),
      textOutput("lp100km"),
      p("_______________________________________________"),
      h5("Documentation:"),
      h6("Description: "),
      p("This application computes the estimated fuel consumption of a car
        based on its number of cylinders (4,6 or 8), weight (in pounds) and horse power."),
      p("The application uses linear regression and builds a model on the basis
        of the 'mtcars' data set. Then, this model is used to predict fuel consumption
        based on the parameters entered by the user. The estimated fuel consumption is displayed
        in miles per gallon (mpg - format used in North America, for example) 
        and litres per 100 kilometers (this is a usual form for Europe, for example)"),
      h6("Instructions:"),
      p("Enter the required parameters in the left column and the result will be
        displayed in the right column. The results are automatically updated if
        you change the parameters.")
    )
  )
))