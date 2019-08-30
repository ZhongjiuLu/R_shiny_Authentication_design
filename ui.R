ui <- dashboardPage(
  
  dashboardHeader(title = "Login Authentication"),
  
  
  dashboardSidebar(),
  
  
  dashboardBody(
    fluidPage(
    div(class = "login",
        uiOutput(outputId = "uiLogin"),
        textOutput(outputId = "pass"),
        tags$head(tags$style("#pass{color: red;"))
    )
    
    ,fluidRow(div(class = "logininfo",
                 uiOutput("userPanel"))
    )
    )
)

)

