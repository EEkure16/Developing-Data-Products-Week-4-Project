#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

library(markdown)

shinyUI(navbarPage("Choose your specifications and we'll give you the best options for vehicles",
        tabPanel("Table",
                            
        # Sidebar
        sidebarLayout(
        sidebarPanel(
            helpText("Please provide the specifications for your vehicle"),
            numericInput('dis', 'Distance (in miles):', 30, min = 1, max = 2000),
            numericInput('cost', 'Gasoline Price (per gallon):', 2.8, min = 1.90, max = 4.5, step=0.01),
            numericInput('gas', 'Maximum expenditure on gasoline:', 50, min=1, max=1000),
            checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
            sliderInput('disp', 'Displacement', min=60, max=500, value=c(60,500), step=10),
            sliderInput('hp', 'Gross horsepower', min=40, max=350, value=c(50,340), step=10),
                                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
        ),
                              
                              
        mainPanel(
          dataTableOutput('table')
          )
        )
),
       
 tabPanel("How to use the App",
          mainPanel(
            includeMarkdown("mycar.md")
            )
      )
      )
)   