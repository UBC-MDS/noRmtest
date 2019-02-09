#' params_mle
#'
#' Fit data to a Guassian distribution with Maximum Likelihood Estimation (MLE)
#'
#' @param data, DATAFRAME where data for each continous variable is in its respective column
#'
#' @return DATAFRAME where the first row contains the estimated means and the second row contains the estimated variance, and the columns present the original variables in the data
#' @export
#'
#' @examples
#' iris_data <- data.frame("length" = c(1,2,3,4), "width" = c(5,6,7,8))
#' params_mle(iris_data)
#'
params_mle <- function(data){
  print("params_mle - empty function")
}
