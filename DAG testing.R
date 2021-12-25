#When constructing a new DAG, to test if causal relations in our DAG are matching the data observed
#we can do the below analysis

# packages needed "pcalg", "RBGL" and "graph"
#but packages "RBGL" and "graph" cant be installed using install.packages

install.packages("BiocManager")
BiocManager::install("RBGL")
BiocManager::install("graph")

#now that we have all the other required packages
install.packages("pcalg")

library(pcalg)
library(dagitty)
library(ggdag)


#Now first of all lets find out all the tests that we can do to make sure our DAG is proper

#for example lets take a DAG
dag_test <- dagify(y ~ x, y ~ U2, y ~ U3,
             U3 ~ U1,x ~ U1, x ~ U2,exposure = "x", outcome = "y")

theme_set(theme_dag())
ggdag(dag_test)


#Manually looking into the DAG we can clearly see U3 and U2 dont share any information,
#as x and y act as a collider un each side
#so these variables U2 and U3 are called D separated variable

#lets check all the D separations
impliedConditionalIndependencies(dag_test)

# this for example
#U1 _||_ y | U2, U3, x
#represents that U1 and Y are independent or D separated for given U2, U3 and X