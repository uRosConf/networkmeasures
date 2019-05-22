#' @import igraph
{}


#' Efficiency of an undirected graph
#' 
#' The \code{efficiency}, according to Latora (2001), of an undirected network is calculated by summing the inverse distances
#' for all node-node pairs of the graph and divide by the same metric for a fully connected network.
#' @param g a graph of type \code{igraph}
#' @references Latora, V., & Marchiori, M. (2001). Efficient behavior of small-world networks. Physical review letters, 87(19), 198701.
#' @seealso \code{\link{local_efficiency}}
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
#' For each node te , according to Latora (2001)
#' @param g a graph
#' @param order the order of the neighborhood. 1 is are direct neighbors.
#' @seealso \code{\link{efficiency}}
#' @export
local_efficiency <- function(g, order = 1L){
  if (vcount(g) == 1){
    return(setNames(0, V(g)$name))
  }
  egos <- igraph::make_ego_graph(g, order = order, mindist = 1)
  names(egos) <- V(g)$name
  sapply(egos, efficiency)
}