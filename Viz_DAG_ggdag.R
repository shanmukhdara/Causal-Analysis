# Packages required - tidyverse, dagitty, ggdag

#lets install required packages
#uncomment this if you are running it for the first time
# install.packages("tidyverse")
# install.packages("dagitty")
# install.packages("ggdag")


#lets include all the required packages
library(tidyverse)
library(dagitty)
library(ggdag)


#######################################
##### Visualizing DAGs with ggdag #####
#######################################
# For visualization, we will use the R package ggdag, which builds in dagitty
# More information: https://cran.r-project.org/web/packages/ggdag/vignettes/intro-to-ggdag.html

# Lets start with setting the coordinates for the nodes in our DAG
#Layout can be set in multiple ways

#Manual way

 coords <- data.frame(matrix(c("x",0,0,
                              "y",2,0,
                              "z1",1,1,
                              "z2",0,1,
                              "z3",0,2,
                              "z4",2,2,
                              "z5",2,1,
                              "z6",1,0), nrow=8, ncol=3, byrow=T))
colnames(coords) <- c("name","x","y")

#you can use the above for better customization 

# I am using a faster and a simple method here
#Automated method

theme_set(theme_dag())

#Now, lets Initialize DAG 
# A ~ B represents B is parent of A, also represented as A <- B

#If we have used manual method to set layout 
dag <- dagify(y ~ z5, y ~ z6, y ~ z1,
              z6 ~ x,
              z5 ~ z4,
              z2 ~ z3,
              z1 ~ z4, z1 ~ z3,
              x ~ z2, x ~ z1,
              exposure = "x",
              outcome = "y",
              coords=coords)

#if its automated method 
dag <- dagify(y ~ z5, y ~ z6, y ~ z1,
              z6 ~ x,
              z5 ~ z4,
              z2 ~ z3,
              z1 ~ z4, z1 ~ z3,
              x ~ z2, x ~ z1,
              exposure = "x",
              outcome = "y")


# Plot the DAG
ggdag(dag)

# TO find out all outcomes of a node
ggdag_parents(dag, "y")

# plot all open paths between treatment and outcome
ggdag_paths(dag)

#To label nodes

dag <- dagify(y ~ z5, y ~ z6, y ~ z1,
              z6 ~ x,
              z5 ~ z4,
              z2 ~ z3,
              z1 ~ z4, z1 ~ z3,
              x ~ z2, x ~ z1,
              labels = c("y" = "Node1", "z5" = "Node2",
                         "z4" = "Node3", "z3"= "Node4"),
              exposure = "x",
              outcome = "y")
ggdag(dag, text = FALSE, use_labels = "label")