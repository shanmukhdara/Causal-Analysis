# Causal-Analysis

1. **Graphical Causal Models using DAGs** : <br>
   DAGs represent our understanding of causal relationships and are essentially a representation of how we think the world works. We acquire this knowledge by reading literature or talking to practitioners. <br>
   To understand more on what DAGs are and how are they useful in causal inference - https://shanmukhdara.medium.com/controls-and-their-interpretation-723d19411794 <br>
   R code in the file "Graphical Causal Models.R" explains Pipeline, Collider and Fork using examples

2. **Visualizing DAGs with ggdag** : <br>
   More information - https://cran.r-project.org/web/packages/ggdag/vignettes/intro-to-ggdag.html <br>
   R code in file "Viz_DAG_ggdag.R" shows ways to Vizualize DAGs in R using ggdag package
   
3. **DAGs testing** : <br>
   But what if you're creating a DAG for the first time? How will you know if it's correct? <br>
   DAG are always constructed based on theory, we use data just to make sure if the DAG is compatable with observed data or not <br>
   R code in file "DAG testing.R" helps you in validating this
   
