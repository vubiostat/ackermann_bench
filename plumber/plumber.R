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

library(plumber)

#* @apiTitle Plumber Example API
#* @apiDescription Plumber example description.

#* Return the ackermann
#* @param m The first number to add
#* @param n The second number to add
#* @post /ackermann
function(m, n) {
    ack(as.numeric(m),as.numeric(n))
}

# Programmatically alter your API
#* @plumber
function(pr) {
    pr %>%
        # Overwrite the default serializer to return unboxed JSON
        pr_set_serializer(serializer_unboxed_json())
}
