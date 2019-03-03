#' params_mle
#'
#' Fit data to a Guassian distribution with Maximum Likelihood Estimation (MLE)
#'
#' @param data, DATAFRAME where data for each continous variable is in its respective column
#'
#' @return DATAFRAME where the first row contains the estimated means and the second row contains the estimated variance, and the columns present the original variables in the data
#' @export params_mle
#'
#' @examples
#' iris_data <- data.frame("length" = c(1,2,3,4), "width" = c(5,6,7,8))
#' params_mle(iris_data)
#'
params_mle <- function(data){

  ## Preprocessing
  ## =============

  if (is.array(data)){
    if (length(dim(data)) == 1){
      var_names <- c(1)
      data <- matrix(data, ncol = 1)
    }

    if (is.matrix(data)){
    var_names <- seq(ncol(data))
    }

  } else if (is.data.frame(data)){
    var_names <-  colnames(data)
    data <- as.matrix(data)

  } else if (is.list(data)){
    var_names <- names(data)
    if (is.null(var_names)){var_names <- seq(length(data))}
    data <- matrix(unlist(data), ncol = length(data))

  } else if (is.vector(data)){
    var_names <- c(1)
    data <- matrix(data, ncol = 1)

  }

  n_obs <- dim(data)[1]
  n_var <- dim(data)[2]

  ## Exception Handling
  ## ==================
  if (all(is.na(data))){
    stop("Empty data input", call. = FALSE)
  }

  if (typeof(data) != "double" & typeof(data) != "integer"){
    stop("Invalid data type, check if values are numeric", call. = FALSE)
  }


  ## Calculations
  ## ============

  # Calculate mu estimates
  mu <- colMeans(data, na.rm = TRUE)

  # Calculate sigma estimates
  if (n_var == 1){
    variance <- array(colSums((data-mu[1])**2, na.rm = TRUE)/n_obs)

  } else{
    variance <- array(rowSums(apply(data, 1, function(data){data-mu})**2, na.rm = TRUE)/n_obs,
                      dim = c(1, n_var))
  }

  ## Return results
  ## ==============
  mle_params <- data.frame(rbind(mu, variance), row.names = c("Mean", "Variance"))
  colnames(mle_params) <- as.character(var_names)
  return(mle_params)
}

