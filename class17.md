Class 17: Network Analysis - Metagenomics co-occurrence networks
================

## Metagenomics co-occurrence networks

Here examine data from the Tara OCean project on bacteria in ocean water
samples from around the world.

We will use the **igraph** package from CRAN and the \*RCy3\*\* package
from bioconductor to build and visualize networks if this data.

``` r
# igraph is from CRAN, RCy3 is from Bioconductor
# To install packages from CRAN: install.packages("igraph")
# To install pacages from Bioconductor: BiocManager::install("RCy3")
```

``` r
# Load the packages 
library(RCy3)
library(igraph)
```

    ## 
    ## Attaching package: 'igraph'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     decompose, spectrum

    ## The following object is masked from 'package:base':
    ## 
    ##     union

``` r
# Test the connection to Cytoscape. 
cytoscapePing()
```

    ## [1] "You are connected to Cytoscape!"

``` r
g <- makeSimpleIgraph()
createNetworkFromIgraph(g,"myGraph")
```

    ## Loading data...
    ## Applying default style...
    ## Applying preferred layout...

    ## networkSUID 
    ##        4870

``` r
plot(g)
```

![](class17_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

Tell cytoscape to export an image (screenshot)

``` r
fig <- exportImage(filename="demo", type="png", height=350)
```

    ## Warning: This file already exists. A Cytoscape popup 
    ##                 will be generated to confirm overwrite.

Insert this image into this Rmd report

``` r
knitr::include_graphics("./demo.png")
```

![](./demo.png)<!-- -->

Change the cytoscape display style

``` r
setVisualStyle("Marquee")
```

    ##                 message 
    ## "Visual Style applied."

save and include image here in this report

``` r
fig <- exportImage(filename="demo_marquee", type="png", height=350)
```

    ## Warning: This file already exists. A Cytoscape popup 
    ##                 will be generated to confirm overwrite.

``` r
knitr::include_graphics("./demo_marquee.png")
```

![](./demo_marquee.png)<!-- -->

## Read our metagenomics data set

``` r
prok_vir_cor <- read.delim("~/downloads/virus_prok_cor_abundant.tsv", stringsAsFactors = FALSE)
head(prok_vir_cor)
```

    ##       Var1          Var2    weight
    ## 1  ph_1061 AACY020068177 0.8555342
    ## 2  ph_1258 AACY020207233 0.8055750
    ## 3  ph_3164 AACY020207233 0.8122517
    ## 4  ph_1033 AACY020255495 0.8487498
    ## 5 ph_10996 AACY020255495 0.8734617
    ## 6 ph_11038 AACY020255495 0.8740782

Create an undirected network from this agecency data.frame

``` r
g <- graph.data.frame(prok_vir_cor, directed = FALSE)
plot(g)
```

![](class17_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

This is a whole mess\! lets change the labels and note size for the
figure

``` r
plot(g, vertex.size=3, vertex.label=NA)
```

![](class17_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

To send this network to Cytocape we can use the command

``` r
createNetworkFromIgraph(g,"myIgraph")
```

    ## Loading data...
    ## Applying default style...
    ## Applying preferred layout...

    ## networkSUID 
    ##        4898
