library(shiny)
library(tidyverse)
library(shinydashboard)
library(shinyjs)
library(plotly)  

totals <- read.csv("conditions_states.csv")

totals <- totals %>% filter(age_group != "Not states")

ui <- dashboardPage(
  dashboardHeader(title = "COVID-19 Death Analysis"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("chart-bar")),
      radioButtons("y",
                   "Select Condition Group",
                   choices = c("Respiratory diseases", "Circulatory diseases"),
                   selected = "Respiratory diseases",
                   inline = TRUE),
      radioButtons("x",
                   "Select X Variable",
                   choices = c("state"),
                   selected = "state",
                   inline = TRUE),
      selectInput("age_type",
                  "Select Age Type",
                  choices = unique(totals$age_group),
                  selected = unique(totals$age_group)[1])
    )
  ),
  
  dashboardBody(
    useShinyjs(),
    
    tags$head(
      tags$style(HTML("
        .box {
          background-color: #f4f6f9;
          border-radius: 10px;
        }
        .box-header {
          background-color: #17a2b8;
          color: white;
        }
        .box-title {
          font-size: 1.5em;
          font-weight: bold;
        }
        .shiny-output-error-validation {
          color: red;
        }
      "))
    ),
    
    fluidRow(
      box(
        title = "COVID-19 Deaths Breakdown",
        status = "primary", solidHeader = TRUE, width = 12,
        plotlyOutput("plot", height = 500)  # Use plotlyOutput here
      )
    ),
    fluidRow(
      box(
        title = "Data Summary",
        status = "info", solidHeader = TRUE, width = 12,
        textOutput("summary")
      )
    )
  )
)

server <- function(input, output, session) {
  
  output$plot <- renderPlotly({
    plot_data <- totals %>% 
      filter(condition_group == input$y, age_group == input$age_type) %>% 
      group_by(.data[[input$x]], condition) %>% 
      summarise(deaths = sum(covid_19_deaths, na.rm = TRUE), .groups = 'drop')
    
    plot <- ggplot(plot_data, aes(x = factor(.data[[input$x]]), y = deaths, fill = condition, text = paste("Deaths:", deaths))) +
      geom_col(position = position_fill()) +
      scale_y_continuous(labels = scales::percent_format(scale = 1)) +
      scale_fill_brewer(palette = "Set2", labels = function(x) str_wrap(x, width = 40)) +
      theme_minimal() +
      labs(title = "% Breakdown of Conditions Associated with COVID-19 Deaths",
           x = input$x,
           y = NULL,
           fill = "Condition") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    ggplotly(plot, tooltip = "text")  
  })
  
  output$summary <- renderText({
    filtered_data <- totals %>%
      filter(condition_group == input$y, age_group == input$age_type) %>%
      group_by(.data[[input$x]], condition) %>%
      summarise(deaths = sum(covid_19_deaths, na.rm = TRUE), .groups = 'drop')
    
    total_deaths <- sum(filtered_data$deaths)
    paste("Total deaths in selected group and category:", format(total_deaths, big.mark = ","), "\n",
          "Number of unique states or age groups:", length(unique(filtered_data[[input$x]])), "\n",
          "Data includes", nrow(filtered_data), "records.")
  })
}

shinyApp(ui, server)
