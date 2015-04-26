library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
   
   # Application title
   headerPanel("Select Car Specifications"),
   
   # Sidebar with controls to select a dataset and specify the number
   # of observations to view
   sidebarPanel(
      selectInput("Mode", "Choose a Mode:", 
                  choices = c("Auto", "Manual")),
      numericInput("cyl", "Number of Cylinders:", 6),
      numericInput("disp", "Displacement(cu.in.):", 160),
      numericInput("hp", "Horsepower:", 110),
      numericInput("wt", "Weight(lb/1000):", 2.6),
      sliderInput("gear", 
                  "Number of Gears:", 
                  min = 1,
                  max = 5, 
                  value = 4)
      
   ),
   
   # Show a summary of the dataset and an HTML table with the requested
   # number of observations
   mainPanel(
      h3('Predicted Miles/(US) gallon:'),
      verbatimTextOutput("mpg"),
      h3('Description:'),
      h5('This Application tries to predict the mileage given by cars based on some of their key Specifications like Number of Cylinders, Number of Gears, Horsepower,Weight,Displacement and their Transmission mode being automatic or manual. User has the option to change all of these specifications in the App through Drop downs, sliders and Input Text Boxes.
         The Prediction algorthm is based on "GLM" model and the model is trained on the mtcars data set available in R package.'),
      h5('More Analysis of this project is available in Rpubs link: http://rpubs.com/avranilghosh/76293'),
      h5('Documentation and Code for this App and related Presentation is available in Github link: https://github.com/avranilghosh/Shiny---R-Presentation')
      )
))