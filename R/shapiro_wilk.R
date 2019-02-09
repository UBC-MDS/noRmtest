#' shapiro_wilk
#'
#' Conduct the Shapiro-Wilk test for every continuous variable in the data to test against normality
#'
#' @param data, DATAFRAME where data for each continous variable is in its respective column
#'
#' @return LISTS where the first list contains the test statistics and the second list contains the p-values in the order of the continuous variables in the dataframe
#' @export
#'
#' @examples
#' iris_data <- data.frame("length" = c(1,2,3,4), "width" = c(5,6,7,8))
#' shapiro_wilk(iris_data)
#'
shapiro_wilk <- function(data){
  print("shapiro_wilk - empty function")
}
