# --------------------------------------------------------------------- #
# STEP ONE: Get tools from the library -------------------------------- #
# --------------------------------------------------------------------- #

##### ---> FIND CODE: This piece of code collects all of the
##### different library tools that this app will use

##### END CODE <---


# --------------------------------------------------------------------- #
# STEP TWO: Import the iNaturalist data ------------------------------- #
# --------------------------------------------------------------------- #

##### ---> FIND CODE: This piece of code reads a data set
##### called application_data.csv

##### END CODE <---

# --------------------------------------------------------------------- #
# STEP THREE: Create the User Interface (UI) -------------------------- #
# --------------------------------------------------------------------- #
# The User Interface (UI) code tells the app what it should look like!
# The UI is a dashboard made up of three pieces:
  # (1) the header
  # (2) the sidebar
  # (3) the body

ui <- dashboardPage(
  #### ----> FIND CODE: Create the dashboard header; it will provide the 
  #### title of the application
  
  ##### END CODE <---
  

  #### ----> FIND CODE: Create the dashboard sidebar; it will specify that the
  #### sidebar should have a piece of output where users can
  #### select one or more invasive species, and a piece of
  #### output that will display the number of observations in
  #### an info box

  ##### END CODE <---
  
  #### ----> FIND CODE: Create the dashboard body; it will specify that the
  #### body should have a piece of output that is a plot (graph) and
  #### a piece of output that is a map (created by "leaflet")

  ##### END CODE <---
)

# --------------------------------------------------------------------- #
# STEP THREE: Create the Server --------------------------------------- #
# --------------------------------------------------------------------- #
# The server code tells the app what it should do!

server <- function(input, output) {
  
  #### ----> FIND CODE: Create the output that prints ("renders") the
  #### checkboxes that users will use to select invasive species

  ##### END CODE <---
  
  
  #### ----> FIND CODE: Filter the data to only look at observations where
  #### the invasive species that the user has chosen
  
  ##### END CODE <---


  #### ----> FIND CODE: Create the output that prints ("renders") the
  #### info box with the title "Observations" that displays the number
  #### of observations in the data set
  
  ##### END CODE <---
  

  #### ----> FIND CODE: Create the output that prints ("renders") the
  #### plot using the "ggplot" tool, which will display the number of
  #### of observations each year.
  #### UPDATE this code to change the colours used for each species
  
  ##### END CODE <---
  

  #### ----> FIND CODE: Create the output that prints ("renders") the
  #### map using the "leaflet" tool, which will display each observation
  #### on a map of Nova Scotia
  #### UPDATE this code to change the colours used for each species
  
  ##### END CODE <---
}


#### ----> FIND CODE: This code will run the app!

##### END CODE <---
