#' Topological information content
#' @param g a graph
#' 
#' @details
#' The topological information content is defined as
#' the logarithm of the size of the automorphism group to the base of 2.
#' @export 
information_content <- function(g){
  log2(as.numeric(igraph::automorphisms(g)$group_size))
}
