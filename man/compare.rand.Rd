% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/comparison_rand.R
\name{compare.rand}
\alias{compare.rand}
\title{(+) Rand Index}
\usage{
compare.rand(x, y)
}
\arguments{
\item{x}{1st cluster label vector of length-\eqn{n}.}

\item{y}{2nd cluster label vector of length-\eqn{n}.}
}
\value{
Rand Index value.
}
\description{
Compute Rand index between two clusterings. It has a value between 0 and 1 
where 0 indicates two clusterings do not agree and 1 exactly the same.
}
\examples{
\donttest{
# -------------------------------------------------------------
#         true label vs. clustering with 'iris' dataset 
# -------------------------------------------------------------
## PREPARE
data(iris)
X   = as.matrix(iris[,1:4])
lab = as.integer(as.factor(iris[,5]))

## CLUSTERING WITH DIFFERENT K VALUES
vec_k  = 2:7
vec_cl = list()
for (i in 1:length(vec_k)){
  vec_cl[[i]] = T4cluster::kmeans(X, k=round(vec_k[i]))$cluster
}

## COMPUTE COMPARISON INDICES
vec_comp = rep(0, length(vec_k))
for (i in 1:length(vec_k)){
  vec_comp[i] = compare.rand(vec_cl[[i]], lab)
}

## VISUALIZE
opar <- par(no.readonly=TRUE)
plot(vec_k, vec_comp, type="b", lty=2, xlab="number of clusters", 
     ylab="comparison index", main="Rand Index with true k=3")
abline(v=3, lwd=2, col="red")
par(opar)
}

}
\references{
\insertRef{rand_objective_1971}{T4cluster}
}
\concept{comparison}
