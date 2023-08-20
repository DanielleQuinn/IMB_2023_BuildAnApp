# Get tools from the library
library(dplyr)
library(shiny)
library(shinydashboard)
library(tidyr)
library(ggplot2)
library(leaflet)

# Import the iNaturalist data
d <- read.csv("application_data.csv")

# User Interface (UI)
ui <- dashboardPage(
  header = dashboardHeader(title = "iNaturalist"),
  
  sidebar = dashboardSidebar(uiOutput("select_invasives"),
                             infoBoxOutput("my_observations")),
  
  body = dashboardBody(plotOutput("my_plot"),
                       leafletOutput("my_map"))
)

# Server
server <- function(input, output) {
  
  # Set up the sidebar options
  output$select_invasives <- renderUI(
    checkboxGroupInput(inputId = "my_invasives", label = "Select Invasive Species",
                choices = unique(d$Invasive),
                selected = "Smallmouth Bass"))
  
  # Filter the data using the sidebar tools
  use_data <- reactive(d %>% filter(Invasive %in% input$my_invasives))
  
  # Render an information box of the number of observations
  output$my_observations <- renderInfoBox({
    infoBox(title = "Observations",
            value = nrow(use_data()))})
  
  # Render a plot of observations each year
  output$my_plot <- renderPlot({
    ggplot(use_data()) +
      geom_bar(aes(x = year, fill = Invasive),
               position = "dodge", col = "black") +
      labs(x = "Year", y = "Number of Observations") +
      theme_bw(17) +
      scale_fill_manual(values = c("red", "blue", "green"),
                        breaks = c("Chain Pickerel", "Smallmouth Bass", "Tunicate"))})
  
  # Render a map of observations
  output$my_map <- renderLeaflet({
    factpal <- colorFactor(c("red", "blue", "green"), d$Invasive)
    leaflet(use_data()) %>%
      addTiles() %>%
      addCircleMarkers(color = ~factpal(Invasive),
                       radius = 4,
                       stroke = FALSE,
                       opacity = 0.5)})

}

# Run the application 
shinyApp(ui, server)
