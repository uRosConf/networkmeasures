#' @import igraph
{}


#' efficiency of an undirected graph, according to Latora (2001)
#' @param g a graph
#' @export
efficiency <- function(g){
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

#' Network vulnerability per node, according to Gol'dshtein (2004) and 
#' Latora et al (2005).
#' @param g a graph
#' @export
vulnerability <- function(g){
  e <- efficiency(g)
  nodes <- V(g)
  sapply(seq_along(nodes), function(i){
    h <- delete_edges(g, incident_edges(g,nodes[i])[[1]])
    1-efficiency(h)/e
  })
}
