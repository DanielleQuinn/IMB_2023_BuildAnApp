# Make sure you copy and paste the entire piece of code exactly as it is shown!

# CODE OPTION 1 --------------------------------------------->
output$my_map <- renderLeaflet({
  factpal <- colorFactor(c("red", "blue", "green"), d$Invasive)
  leaflet(use_data()) %>%
    addTiles() %>%
    addCircleMarkers(color = ~factpal(Invasive),
                     radius = 4,
                     stroke = FALSE,
                     opacity = 0.5)})
# <-----------------------------------------------------------


# CODE OPTION 2 --------------------------------------------->
header = dashboardHeader(title = "iNaturalist"),
# <-----------------------------------------------------------


# CODE OPTION 3 --------------------------------------------->
output$my_plot <- renderPlot({
  ggplot(use_data()) +
    geom_bar(aes(x = year, fill = Invasive),
             position = "dodge", col = "black") +
    labs(x = "Year", y = "Number of Observations") +
    theme_bw(17) +
    scale_fill_manual(values = c("red", "blue", "green"),
                      breaks = c("Chain Pickerel", "Smallmouth Bass", "Tunicate"))})
# <-----------------------------------------------------------


# CODE OPTION 4 --------------------------------------------->
d <- read.csv("application_data.csv")
# <-----------------------------------------------------------


# CODE OPTION 5 --------------------------------------------->
shinyApp(ui, server)
# <-----------------------------------------------------------


# CODE OPTION 6 --------------------------------------------->
output$my_observations <- renderInfoBox({
  infoBox(title = "Observations",
          value = nrow(use_data()))})
# <-----------------------------------------------------------


# CODE OPTION 7 --------------------------------------------->
body = dashboardBody(plotOutput("my_plot"),
                     leafletOutput("my_map"))
# <-----------------------------------------------------------


# CODE OPTION 8 --------------------------------------------->
output$select_invasives <- renderUI(
  checkboxGroupInput(inputId = "my_invasives", label = "Select Invasive Species",
                     choices = unique(d$Invasive),
                     selected = "Smallmouth Bass"))
# <-----------------------------------------------------------


# CODE OPTION 9 --------------------------------------------->
use_data <- reactive(d %>% filter(Invasive %in% input$my_invasives))
# <-----------------------------------------------------------


# CODE OPTION 10 -------------------------------------------->
library(dplyr)
library(shiny)
library(shinydashboard)
library(tidyr)
library(ggplot2)
library(leaflet)
# <-----------------------------------------------------------


# CODE OPTION 11 -------------------------------------------->
sidebar = dashboardSidebar(uiOutput("select_invasives"),
                           infoBoxOutput("my_observations")),
# <-----------------------------------------------------------