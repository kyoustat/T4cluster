#' Compute Pairwise Co-occurrence Matrix
#' 
#' Let \emph{clustering} be a label from data of \eqn{N} observations and suppose 
#' we are given \eqn{M} such labels. Co-occurrent matrix counts the number of events 
#' where two observations \eqn{X_i} and \eqn{X_j} belong to the same category/class. 
#' \emph{PCM} serves as a measure of uncertainty embedded in any algorithms with non-deterministic components.
#' 
#' @param partitions partitions can be provided in either (1) an \eqn{(M\times N)} matrix 
#' where each row is a clustering for \eqn{N} objects, or (2) a length-\eqn{M} list of 
#' length-\eqn{N} clustering labels. 
#' 
#' @return an \eqn{(N\times N)} matrix, whose elements \eqn{(i,j)} are counts for 
#' how many times observations \eqn{i} and \eqn{j} belong to the same cluster, ranging from \eqn{0} to \eqn{M}.
#' 
#' @examples
#' # -------------------------------------------------------------
#' #               PSM with 'iris' dataset + k-means++
#' # -------------------------------------------------------------
#' ## PREPARE WITH SUBSET OF DATA
#' data(iris)
#' X     = as.matrix(iris[,1:4])
#' lab   = as.integer(as.factor(iris[,5]))
#' 
#' ## EMBEDDING WITH PCA
#' X2d = Rdimtools::do.pca(X, ndim=2)$Y
#' 
#' ## RUN K-MEANS++ 100 TIMES
#' partitions = list()
#' for (i in 1:100){
#'   partitions[[i]] = kmeanspp(X)$cluster
#' }
#' 
#' ## COMPUTE PCM
#' iris.pcm = pcm(partitions)
#' 
#' ## VISUALIZATION
#' opar <- par(no.readonly=TRUE)
#' par(mfrow=c(1,2), pty="s")
#' plot(X2d, col=lab, pch=19, main="true label")
#' image(iris.pcm[,150:1], axes=FALSE, main="PCM")
#' par(opar)
#' 
#' @seealso \code{\link{psm}}
#' @concept soc
#' @export
pcm <- function(partitions){
  myfname = "pcm"
  clmat   = soc_preproc(partitions, myfname)
  return(src_pcm(clmat))
}