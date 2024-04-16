ack <- function(m, n)
{
    if(m == 0) {
        n + 1
    } else if(n == 0) {
        ack(m-1, 1)
    } else {
        ack(m-1, ack(m, n-1))
    }
}

library(plumber)

#* @apiTitle Plumber Example API
#* @apiDescription Plumber example description.

#* Return the ackermann
#* @param m The first number to add
#* @param n The second number to add
#* @serializer unboxedJSON
#* @get /
function(req, m=0, n=0) ack(as.numeric(m),as.numeric(n))


# Programmatically alter your API
#* @plumber
function(pr) pr_set_serializer(pr, serializer_unboxed_json())
