server <- (function(input, output, session) {
  
  USER <- reactiveValues(Logged = FALSE , session = session$user) 
  
  ### ui login server
  output$uiLogin <- renderUI({
    if (USER$Logged == FALSE) {
      wellPanel(
        textInput("userName", "Username:"),
        passwordInput("passwd", "Password:"),
        # place a break gap
        br(),
        actionButton("Login", "Log in")
      )
    }
  })
  
  output$pass <- renderText({  
    if (USER$Logged == FALSE) {
      USER$pass
    }  
  })
  
  # Login session reactive
  output$userPanel <- renderUI({
    if (USER$Logged == TRUE) {
      fluidRow(
        column(2,
               "User: ", USER$name
        ),
        column(1, actionLink("logout", "Logout"))
      )
    }  
  })
  
  # control login server
  observeEvent(input$Login , {
    # avoid matching before clicking button by isolate function
    Username <- isolate(input$userName)
    Password <- isolate(input$passwd)
    # ensure the password and username are from the same row/observation
    Id.username <- which(df$username == Username)
    Id.password <- which(df$password == Password)
    # prevent empty entry
    if (length(Id.username) > 0 & length(Id.password) > 0) {
      # if username and password are valid, enter the page and rewrite the username
      if (Id.username == Id.password) {
        USER$Logged <- TRUE
        USER$name <- Username      
      }
    } else {
      # otherwise, it prevents to enter the main page
      USER$pass <- "User name or password failed!"
    }
  })
  
  # control logout reactive
  observeEvent(input$logout, {
    # if the logout button is clicked, the log in status de-activated to FALSE
    USER$Logged <- FALSE
    USER$pass <- ""
  })
  
  
})
