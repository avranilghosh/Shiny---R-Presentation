library(shiny)
library(datasets)

# Generate model and Prediction




pred<-function(cyl,disp,hp,wt,am,gear){
   test<-data.frame(cyl=cyl,disp=disp,hp=hp,wt=wt,am=am,gear=gear)
   
   library(caret)
   data(mtcars)
   
   mtcars1<-mtcars[,c(1,2,3,4,6,9,10)]
   
   
   model1<-train(mpg~.,data=mtcars1,method = "glm")
   
   predict(model1,test)
}

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
   
   # Return the requested dataset
   datasetInput <- reactive({
      switch(input$Mode,
             "Auto" = 0,
             "Manual" = 1)
   })
   
   
   
   # Generate a summary of the dataset
   output$mpg <- renderPrint({
      am<-datasetInput()
      pred(input$cyl,input$disp,input$hp,input$wt,am,input$gear)
   })
   
   
})