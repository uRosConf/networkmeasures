suppressPackageStartupMessages({
  library(networkmeasures)
  library("igraph", quietly=TRUE)
})


## Global efficiency
g <- igraph::graph_from_literal(a-b,b-c,c-a)
expect_equal(efficiency(g), 1)

g <- igraph::graph_from_literal(a-b, b-c, c-d, d-e, d-f, b-f)

s <- 1 + 1/2 + 1/3 + 1/4 + 1/2 + # a-b .. a-f
     1 + 1/2 + 1/3 + 1   +       # b-c .. b-f
     1 + 1/2 + 1/2 +             # c-d .. c-f
     1 + 1   +                   # d-e, d-f
     1/2                         # e-f
e <- s/(15)
expect_equal(efficiency(g), e)

g <- igraph::graph_from_literal(a)
expect_equal(efficiency(g), 0)

## Local efficiency
g <- igraph::graph_from_literal(a-b,b-c,c-a)
expect_equal(local_efficiency(g), c(a=1, b=1,c=1))


g <- igraph::graph_from_literal(a-b, b-c, c-d, d-e, d-f, b-f)
expect_equivalent(local_efficiency(g), rep(0,6))

g <- graph_from_literal(a)
expect_equal(local_efficiency(g), c(a=0))

