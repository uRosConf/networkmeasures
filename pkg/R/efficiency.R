#' @import igraph
{}


#' Efficiency of an undirected graph
#' 
#' The \code{efficiency}, according to Latora (2001), of an undirected network is calculated by summing the inverse distances
#' for all node-node pairs of the graph and divide by the same metric for a fully connected network.
#' @param g a graph of type \code{igraph}
#' @references Latora, V., & Marchiori, M. (2001). Efficient behavior of small-world networks. Physical review letters, 87(19), 198701.
#' @family efficiency measure
#' @export
efficiency <- function(g){
  # TODO test if g is undirected?
  n <- vcount(g)
  if (n==1) return(0)
  nd <- igraph::distance_table(g)$res
  d <- seq_along(nd)
  N <- n*(n-1)
  2*sum(nd/d)/N # times two because of directedness of the network
}

#' local efficiency of a graph
#' 
#' \code{local_efficiency} is a generalized form of the measure defined by Latora (2001).
#' For each node the efficiency of the egonetwork without the central node is calculated. 
#' The Latora definition uses order = 1 (default).
#' @param g a graph
#' @param order the order of the egonetwork. The default is taking only direct neighbors.
#' @references Latora, V., & Marchiori, M. (2001). Efficient behavior of small-world networks. Physical review letters, 87(19), 198701.
#' @family efficiency measure
#' @export
local_efficiency <- function(g, order = 1L){
  if (vcount(g) == 1){
    return(setNames(0, V(g)$name))
  }
  egos <- igraph::make_ego_graph(g, order = order, mindist = 1)
  names(egos) <- V(g)$name
  sapply(egos, efficiency)
}