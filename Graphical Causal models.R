
#To read more about Graphical Causal models - https://shanmukhdara.medium.com/controls-and-their-interpretation-723d19411794

#################################
##### Pipeline example #####
#################################
# X is the independent variable of interest, Y is the dependent output, Z is some observed variable
#  X -> Z -> Y

set.seed(5)
X <- rnorm(1000)
# Z is dependent on X, lets assume 
Z <- round(10 + 2*X)
#Y is dependent on Z, lets assume
Y <- 2*Z^(2)+rnorm(1000)

#When Z is not stratified, correlation between X and Y is 
cor(X,Y)
# X and Y are very strongly related, there is some mutual information shared between X and Y

#When Z is stratified, correlation between X and Y is 
cor(X[Z==Z[1]],Y[Z==Z[1]])
# This shows us that stratifying by Z is making X and Y independent
# there is no mutual information shared between X and Y if stratified by Z

#So we should never statify by Z in a pipeline, as it blocks the causal path from X to Y

#################################
##### Fork example #####
#################################

# X is the independent variable of interest, Y is the dependent output, Z is some observed variable
#  X <- Z -> Y

set.seed(5)
Z <- round(rnorm(1000))
# X is dependent on Z, lets assume 
X <- (10 + 2*Z)+rnorm(1000)
#Y is dependent on Z, lets assume
Y <- 150+Z+rnorm(1000)

#When Z is not stratified, correlation between X and Y is 
cor(X,Y)
# X and Y are very strongly related, there is some mutual information shared between X and Y

#For example in a case of X <- Z -> Y and X->Y
# X effects Y via two paths, first a causal direct path and secondly a non causal path through Z
#So to measure the true causal impact of X on Y, we should always statify Z, this blocks the backdoor non causal path


#################################
##### Collider example #####
#################################

# X is the independent variable of interest, Y is the dependent output, Z is some observed variable
#  X -> Z <- Y

set.seed(5)
X <- rnorm(1000)
Y <- rnorm(1000)

#Z is dependent on X and Y, lets assume a simple case
Z <- round(X + Y)

#When Z is not stratified, correlation between X and Y is 
cor(X,Y)
# X and Y are not related, there is not much mutual information shared between X and Y

#When Z is stratified, correlation between X and Y is 
cor(X[Z==Z[1]],Y[Z==Z[1]])
# This shows us that stratifying by Z is making X and Y dependent
# there is strong mutual information shared between X and Y if stratified by Z

#So in case of collider we don't need to stratify by Z, stratifying by Z opens the backdoor path 