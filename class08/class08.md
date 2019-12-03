class08
================
Yutong Wu
10/24/2019

# K-means clustering

``` r
# Generate some example data for clustering
tmp <- c(rnorm(30,-3), rnorm(30,3))
rnorm(30,-3)
```

    ##  [1] -2.159481 -2.328029 -4.801776 -5.606652 -3.196416 -3.422655 -4.948243
    ##  [8] -4.621469 -2.353392 -3.065631 -3.812871 -4.354908 -3.732850 -2.925884
    ## [15] -3.333640 -2.680488 -2.598523 -2.125141 -1.307046 -3.961876 -3.147365
    ## [22] -2.705772 -1.889951 -1.841963 -2.991633 -3.627492 -4.350288 -2.135497
    ## [29] -3.340903 -0.809040

``` r
tmp
```

    ##  [1] -4.2462972 -2.4105038 -2.9902800 -3.0231107 -3.1068673 -4.0954116
    ##  [7] -2.4447831 -4.6229358 -5.1361023 -3.6948777 -3.2331774 -1.2349716
    ## [13]  0.1495534 -2.4230433 -1.7601986 -3.3081708 -4.5530571 -2.6318788
    ## [19] -1.4045602 -4.1983295 -4.0612964 -1.8662716 -2.2864415 -2.4553599
    ## [25] -3.2343524 -1.5951330 -1.9855145 -2.5081052 -3.4623528 -3.2961954
    ## [31]  2.1223210  2.8042240  3.8950526  3.1619853  3.6990839  2.9428037
    ## [37]  3.8254919  3.9424557  2.3215436  3.8428710  4.6888025  3.1649123
    ## [43]  2.3598892  2.8867705  3.5057267  5.9913618  4.3915298  2.1389745
    ## [49]  2.1610917  2.5793329  3.6739489  3.7002842  2.7286242  1.9215670
    ## [55]  3.0254401  2.6986678  3.1750857  4.3688619  2.7396931  2.1403095

``` r
# rnorm(30,-3) -->30 points with mean of -3 
x <- cbind(x=tmp, y=rev(tmp))
x
```

    ##                x          y
    ##  [1,] -4.2462972  2.1403095
    ##  [2,] -2.4105038  2.7396931
    ##  [3,] -2.9902800  4.3688619
    ##  [4,] -3.0231107  3.1750857
    ##  [5,] -3.1068673  2.6986678
    ##  [6,] -4.0954116  3.0254401
    ##  [7,] -2.4447831  1.9215670
    ##  [8,] -4.6229358  2.7286242
    ##  [9,] -5.1361023  3.7002842
    ## [10,] -3.6948777  3.6739489
    ## [11,] -3.2331774  2.5793329
    ## [12,] -1.2349716  2.1610917
    ## [13,]  0.1495534  2.1389745
    ## [14,] -2.4230433  4.3915298
    ## [15,] -1.7601986  5.9913618
    ## [16,] -3.3081708  3.5057267
    ## [17,] -4.5530571  2.8867705
    ## [18,] -2.6318788  2.3598892
    ## [19,] -1.4045602  3.1649123
    ## [20,] -4.1983295  4.6888025
    ## [21,] -4.0612964  3.8428710
    ## [22,] -1.8662716  2.3215436
    ## [23,] -2.2864415  3.9424557
    ## [24,] -2.4553599  3.8254919
    ## [25,] -3.2343524  2.9428037
    ## [26,] -1.5951330  3.6990839
    ## [27,] -1.9855145  3.1619853
    ## [28,] -2.5081052  3.8950526
    ## [29,] -3.4623528  2.8042240
    ## [30,] -3.2961954  2.1223210
    ## [31,]  2.1223210 -3.2961954
    ## [32,]  2.8042240 -3.4623528
    ## [33,]  3.8950526 -2.5081052
    ## [34,]  3.1619853 -1.9855145
    ## [35,]  3.6990839 -1.5951330
    ## [36,]  2.9428037 -3.2343524
    ## [37,]  3.8254919 -2.4553599
    ## [38,]  3.9424557 -2.2864415
    ## [39,]  2.3215436 -1.8662716
    ## [40,]  3.8428710 -4.0612964
    ## [41,]  4.6888025 -4.1983295
    ## [42,]  3.1649123 -1.4045602
    ## [43,]  2.3598892 -2.6318788
    ## [44,]  2.8867705 -4.5530571
    ## [45,]  3.5057267 -3.3081708
    ## [46,]  5.9913618 -1.7601986
    ## [47,]  4.3915298 -2.4230433
    ## [48,]  2.1389745  0.1495534
    ## [49,]  2.1610917 -1.2349716
    ## [50,]  2.5793329 -3.2331774
    ## [51,]  3.6739489 -3.6948777
    ## [52,]  3.7002842 -5.1361023
    ## [53,]  2.7286242 -4.6229358
    ## [54,]  1.9215670 -2.4447831
    ## [55,]  3.0254401 -4.0954116
    ## [56,]  2.6986678 -3.1068673
    ## [57,]  3.1750857 -3.0231107
    ## [58,]  4.3688619 -2.9902800
    ## [59,]  2.7396931 -2.4105038
    ## [60,]  2.1403095 -4.2462972

``` r
plot(x)
```

![](class08_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

Use the Kmeans() function setting k to 2 and nstart=20

``` r
k <- kmeans(x, centers = 2, nstart =20)
```

Inspet/print the results

``` r
k
```

    ## K-means clustering with 2 clusters of sizes 30, 30
    ## 
    ## Cluster means:
    ##           x         y
    ## 1  3.219957 -2.904001
    ## 2 -2.904001  3.219957
    ## 
    ## Clustering vector:
    ##  [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1
    ## [39] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    ## 
    ## Within cluster sum of squares by cluster:
    ## [1] 63.69141 63.69141
    ##  (between_SS / total_SS =  89.8 %)
    ## 
    ## Available components:
    ## 
    ## [1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss"
    ## [6] "betweenss"    "size"         "iter"         "ifault"

Q. How many points are in each cluster? 30 Q. What ‘component’ of your
result object details - cluster size? - cluster assignment/membership? -
cluster
    center?

``` r
k$size
```

    ## [1] 30 30

``` r
k$cluster
```

    ##  [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1
    ## [39] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

``` r
k$centers
```

    ##           x         y
    ## 1  3.219957 -2.904001
    ## 2 -2.904001  3.219957

Plot x colored by the kmeans cluster assignment and add cluster centers
as blue points

``` r
plot(x, col=k$cluster)
#1 is black, 2 is red 
points(k$centers, col="blue", pch=15)
```

![](class08_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

## Hierarchical clustering in R

The `hclust()` function requires a distance matrix as input. You can get
this from the `dist()` function

``` r
# First we need to calculate point (dis)similarity
# as the Euclidean distance between observations
dist_matrix <- dist(x)
#class(dist_matrix)

# The hclust() function returns a hierarchical
# clustering model
hc <- hclust(d = dist_matrix)

# the print method is not so useful here
hc
```

    ## 
    ## Call:
    ## hclust(d = dist_matrix)
    ## 
    ## Cluster method   : complete 
    ## Distance         : euclidean 
    ## Number of objects: 60

``` r
# Our input is a distance matrix from the dist()
# function. Lets make sure we understand it first
dist_matrix <- dist(x) #dist() computes and returns the distance matrix 
dim(dist_matrix)
```

    ## NULL

``` r
#NULL
View( as.matrix(dist_matrix) )
dim(x)
```

    ## [1] 60  2

``` r
#[1] 60 2
dim( as.matrix(dist_matrix) )
```

    ## [1] 60 60

``` r
#[1] 60 60
# Note. symmetrical pairwise distance matrix
```

``` r
# Create hierarchical cluster model: hc
plot(hc)
abline(h=6,col="red")
```

![](class08_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->

``` r
grps <- cutree(hc,h=6)
#the fist 30 points are in the first big branch, the second 30 points are in the second branch 
```

``` r
cutree(hc, k=2)
```

    ##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2
    ## [39] 2 2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 2 2 2 2 2

A more like real example

``` r
# Step 1. Generate some example data for clustering
x <- rbind(
matrix(rnorm(100, mean=0, sd = 0.3), ncol = 2), # c1
matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2), # c2
matrix(c(rnorm(50, mean = 1, sd = 0.3), # c3
rnorm(50, mean = 0, sd = 0.3)), ncol = 2))
colnames(x) <- c("x", "y") #column names
# Step 2. Plot the data without clustering
plot(x)
```

![](class08_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

``` r
# Step 3. Generate colors for known clusters
# (just so we can compare to hclust results)
col <- as.factor( rep(c("c1","c2","c3"), each=50) )
#rep(c("c1","c2","c3"),each=50)
plot(x, col=col)
```

![](class08_files/figure-gfm/unnamed-chunk-12-2.png)<!-- -->

``` r
#create kmeans model and hierarchical model using R
kmeans(x,centers=3,nstart=20)
```

    ## K-means clustering with 3 clusters of sizes 53, 50, 47
    ## 
    ## Cluster means:
    ##            x           y
    ## 1  0.9904363  0.03740874
    ## 2  0.9105589  1.05003109
    ## 3 -0.1065315 -0.01311408
    ## 
    ## Clustering vector:
    ##   [1] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3
    ##  [38] 3 3 3 3 1 3 3 3 3 3 3 3 3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 2 2 2
    ##  [75] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 2 2 1 2 1 1 1 1 1 1 1 1 1
    ## [112] 1 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    ## [149] 1 3
    ## 
    ## Within cluster sum of squares by cluster:
    ## [1] 6.981100 9.581570 7.413132
    ##  (between_SS / total_SS =  75.1 %)
    ## 
    ## Available components:
    ## 
    ## [1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss"
    ## [6] "betweenss"    "size"         "iter"         "ifault"

``` r
hclust(dist(x))
```

    ## 
    ## Call:
    ## hclust(d = dist(x))
    ## 
    ## Cluster method   : complete 
    ## Distance         : euclidean 
    ## Number of objects: 150

Q. Use the dist(), hclust(), plot() and cutree() functions to return 2
and 3 clusters Q. How does this compare to your known ‘col’ groups?

``` r
# clustering
hc <- hclust(dist(x))

# draw tree
plot (hc)
abline(h=2, col = "red")
```

![](class08_files/figure-gfm/unnamed-chunk-14-1.png)<!-- -->

``` r
# Cut the tree into clusters/groups
grps <- cutree(hc,h=2.5)
grps
```

    ##   [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    ##  [38] 1 1 1 1 2 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 1 2 2 1 2 2 2
    ##  [75] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 2 1 2 2 2 2 2 2 2 1 2 1 2 1 1 1 1 1 1 1 1 2
    ## [112] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    ## [149] 1 1

``` r
table(grps)
```

    ## grps
    ##   1   2 
    ## 103  47

Plot the

``` r
table(grps)
```

    ## grps
    ##   1   2 
    ## 103  47

Cross-tablulate i.e. compare out clustering result with the known answer

``` r
table(grps, col)
```

    ##     col
    ## grps c1 c2 c3
    ##    1 49  6 48
    ##    2  1 44  2

\#Principal Component Analysis (PCA)

``` r
## You can also download this file from the class website!
mydata <- read.csv("https://tinyurl.com/expression-CSV",
row.names=1)
head(mydata)
```

    ##        wt1 wt2  wt3  wt4 wt5 ko1 ko2 ko3 ko4 ko5
    ## gene1  439 458  408  429 420  90  88  86  90  93
    ## gene2  219 200  204  210 187 427 423 434 433 426
    ## gene3 1006 989 1030 1017 973 252 237 238 226 210
    ## gene4  783 792  829  856 760 849 856 835 885 894
    ## gene5  181 249  204  244 225 277 305 272 270 279
    ## gene6  460 502  491  491 493 612 594 577 618 638

``` r
dim(mydata)
```

    ## [1] 100  10

``` r
nrow(mydata)
```

    ## [1] 100

``` r
## lets do PCA
pca <- prcomp(t(mydata), scale=TRUE)
## See what is returned by the prcomp() function
attributes(pca)
```

    ## $names
    ## [1] "sdev"     "rotation" "center"   "scale"    "x"       
    ## 
    ## $class
    ## [1] "prcomp"

``` r
## A basic PC1 vs PC2 2-D plot
```

``` r
plot(pca$x[,1], pca$x[,2])
```

![](class08_files/figure-gfm/unnamed-chunk-20-1.png)<!-- -->

``` r
## Variance captured per PC
pca.var <- pca$sdev^2
## Precent variance is often more informative to look at
pca.var <- pca$sdev^2
pca.var.per <- round(pca.var/sum(pca.var)*100, 1)
pca.var.per
```

    ##  [1] 92.6  2.3  1.1  1.1  0.8  0.7  0.6  0.4  0.4  0.0

``` r
pca.var <- pca$sdev^2
pca.var.per <- round(pca.var/sum(pca.var)*100, 1)
barplot(pca.var.per, main="Scree Plot",
xlab="Principal Component", ylab="Percent Variation")
```

![](class08_files/figure-gfm/unnamed-chunk-21-1.png)<!-- -->

``` r
plot(pca$x[,1], pca$x[,2],
     col = c("red", "red", "red", "red", "red","blue", "blue", "blue", "blue", "blue"))
```

![](class08_files/figure-gfm/unnamed-chunk-22-1.png)<!-- -->

\#Hands-on Worksheet

``` r
x <- read.csv("UK_foods.csv", row.names = 1)
x
```

    ##                     England Wales Scotland N.Ireland
    ## Cheese                  105   103      103        66
    ## Carcass_meat            245   227      242       267
    ## Other_meat              685   803      750       586
    ## Fish                    147   160      122        93
    ## Fats_and_oils           193   235      184       209
    ## Sugars                  156   175      147       139
    ## Fresh_potatoes          720   874      566      1033
    ## Fresh_Veg               253   265      171       143
    ## Other_Veg               488   570      418       355
    ## Processed_potatoes      198   203      220       187
    ## Processed_Veg           360   365      337       334
    ## Fresh_fruit            1102  1137      957       674
    ## Cereals                1472  1582     1462      1494
    ## Beverages                57    73       53        47
    ## Soft_drinks            1374  1256     1572      1506
    ## Alcoholic_drinks        375   475      458       135
    ## Confectionery            54    64       62        41

``` r
dim(x)
```

    ## [1] 17  4

``` r
View(x)
```

``` r
barplot(as.matrix(x), beside=F, col=rainbow(nrow(x)))
```

![](class08_files/figure-gfm/unnamed-chunk-25-1.png)<!-- -->

``` r
pairs(x, col=rainbow(10), pch=16)
```

![](class08_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->

``` r
pca <- prcomp( t(x) )
summary(pca)
```

    ## Importance of components:
    ##                             PC1      PC2      PC3       PC4
    ## Standard deviation     324.1502 212.7478 73.87622 4.189e-14
    ## Proportion of Variance   0.6744   0.2905  0.03503 0.000e+00
    ## Cumulative Proportion    0.6744   0.9650  1.00000 1.000e+00

``` r
plot(pca$x[,1], pca$x[,2])
```

![](class08_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->
