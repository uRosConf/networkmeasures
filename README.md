
Overview
========

The**networkmeasures** package is implementing efficiency and vulnerability as metrics for assessing network complexity, e.g. traffic, family or business network. These metrics were first described by Latora et al (2001; 2005) and Goldshtein et al (2004).

Background
----------

This package was developed during uRos the 2019 Unconf. We implemented:

1.  The unweighted global efficieny measure for an igraph network (reference)

-   naive implementation, using the average inverse shortest path between all the nodes

1.  The unweighted local efficiency measure.

Installation
============

You can install the development version from github, using the `remotes` package:

``` r
remotes::install_github('uRosConf/networkmeasures/pkg', build_vignettes = TRUE)
```

Usage
=====

The vignette [introduction](pkg/doc/introduction.html) provides an intro to the functions and the theory behind them.

``` r
vignette("introduction", package = "networkmeasures")
```

References
==========

Gol’dshtein, Vladimir, GA Koganov, and Gregory I Surdutovich. 2004. “Vulnerability and Hierarchy of Complex Networks.” *arXiv Preprint Cond-Mat/0409298*.

Latora, Vito, and Massimo Marchiori. 2001. “Efficient Behavior of Small-World Networks.” *Physical Review Letters* 87 (19). APS: 198701.

———. 2005. “Vulnerability and Protection of Infrastructure Networks.” *Physical Review E* 71 (1). APS: 015103.
