#' @import igraph
{}


#' Efficiency of an undirected graph
#' 
#' The \code{efficiency}, according to Latora (2001), of an undirected network is calculated by summing the inverse distances
#' for all node-node pairs of the graph and divide by the same metric for a fully connected network.
#' @param g a graph of type \code{igraph}
#' @references Latora, V., & Marchiori, M. (2001). Efficient behavior of small-world networks. Physical review letters, 87(19), 198701.
#' @export
efficiency <- function(g){
  # TODO test if g is undirected?
  n <- vcount(g)
  if (n==1) return(0)
  nd <- igraph::distance_table(g)$res
  d <- seq_along(nd)
  N <- n*(n-1)
  2*sum(nd/d)/N
}

#' local efficiency of a graph, according to Latora (2001)
#' @param g a graph
#' @export
local_efficiency <- function(g){
  sapply(V(g),function(node){
    h <- induced_subgraph(g, c(neighbors(g,node)))
    efficiency(h)
  })
}
