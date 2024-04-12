ack <- function(m, n) {
  if(m == 0) {
    ans <- n + 1
  } else if(n == 0) {
    ans <- ack(m-1, 1)
  } else {
    ans <- ack(m-1, ack(m, n-1))
  }
  ans
}

library(shiny)

shinyApp(
  ui = fluidPage(
    textOutput("setup"),
    textOutput("result")
  ),
  server = function(input, output, session) {
    v <- reactiveValues(m = 1, n = 1)
    observe({
      query <- parseQueryString(session$clientData$url_search)
      print(query)
      if (!is.null(query[['m']]) && !is.null(query[['n']])) {
        v$m <- as.numeric(query[['m']])
        v$n <- as.numeric(query[['n']])
      }
    })
    output$setup <- renderText({
      sprintf('Ackermann(m = %s, n = %s)', v$m, v$n)
    })
    output$result <- renderText(ack(v$m, v$n))
  }
)
