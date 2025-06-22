# EMANOVA

## Overview
EMANOVA provides tools for testing the association between microbiome and biological factors.

## Key features
E-MANOVA (Ensemble multivariate analysis of variance using distance matrices) method addressing the limitations of Traditional PERMANOVA. Traditional PERMANOVA is not robust to distances and association signals, which can lead to power reduction in certain scenarios. Using the idea of ensemble learning, we take similarity matrix to the $r$-th power to construct base test and then combine multiple tests to construct ensemble test. Our test statistic demonstrates high power and robustness compared to other existing methods. We also use direct moment approximation and Pearson type III distribution to approximate the permutation null distribution, completely avoiding the computationally intensive permutation procedure. Finally, we utilize the Cauchy combination method to aggregate p-values from multiple distances, eliminating the need to pre-specify distance measure before analysis. 

## Installation
```r
remotes::install_github("amss-stat/EMANOVA")


