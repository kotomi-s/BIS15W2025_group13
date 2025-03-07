
library(tidyverse)
library(shiny)

#next thing to do is figure out shiny dashboard

totals <- read.csv("data/totals_states_conditions.csv")

ui <- fluidPage(
  radioButtons("y",
              "Select Condition Group",
              choices = c("Respiratory diseases", "Circulatory diseases"),
              selected = "Respiratory diseases"),
  
  radioButtons("x",
               "Select X Variable",
               choices = c("state", "age_group"),
               selected = "state"),
  
  plotOutput("plot")
  
) #close the fluid page


server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    
    totals %>% 
      filter(condition_group==input$y) %>% 
      group_by(input$x, condition, state, age_group) %>% 
      summarise(deaths=sum(covid_19_deaths, na.rm = T),
                .groups = 'drop') %>% 
      ggplot(aes(x=factor(.data[[input$x]]), y=deaths, fill=condition))+ #x=factor(.data[[input$x]]) fixed issue of x axis output only having one bar
      geom_col(position = position_fill())+
      scale_y_continuous(labels = scales::percent)+
      scale_fill_brewer(palette = "Paired", labels = function(x) str_wrap(x, width = 40))+ #applies text in the legend wrapping at ~40 characters?
      theme_minimal()+
      labs(title = "% Breakdown of Conditions Associated with COVID-19 Deaths",
           x= input$x,
           y=NULL,
           fill="Condition")
    
    
  })
}

shinyApp(ui, server)