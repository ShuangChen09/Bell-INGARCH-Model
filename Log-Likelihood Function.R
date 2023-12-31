#########log-likelihood function##########
GBELLloglike <- function(theta, data) {
  n <- length(data)
  lambda = rep(0, n)
  loglike <- rep(0, n)
  loglike[1] <- 0
  for (t in c(2:n)) {
    lambda[t] = theta[1] + theta[2] * data[t - 1] + theta[3] * lambda[t - 1]
    #theta[1] is a0,theta[2] is a1，theta[3] is b1
    loglike[t] = -dbell(0:data[t],lambda[t],log=TRUE)[data[t]+1]
  }
  sum(loglike)
}
