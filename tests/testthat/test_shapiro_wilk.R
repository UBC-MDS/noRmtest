#' Date: February 9, 2018
#' Authors: Constantin Shuster, Richie Zitomer, Sylvia Lee
#'
#' This script tests the function from shapiro_wilk.R
#'
#' Parameters
#' ----------
#' None
#'
#'
#' Returns
#' -------
#' Throws errors if tests fail

context("Evaluate normality using Shapiro-Wilk test")

# Sample data
data <-  data.frame('a'= c(1,2,3,5,6,8),
                    'b'= c(4,5,6,7,11,15))
data_bad <-  data.frame('a'= c("ab", "cd", "ef"),
                        'b'= c("TRUE", "FALSE", "TRUE"))
data_vector <- c(1,2,3,6,7,8)
data_matrix <- matrix(c(1,2,3,99,9,8,7,3,2,11,12,13), nrow = 4, ncol = 3, byrow = TRUE,
                      dimnames = list(c("r1", "r2","r3","r4"),
                                      c("C.1", "C.2", "C.3")))

#' Check that function returnes a list with different inputs
test_that("Test that output is a list", {
  expect_true(typeof(shapiro_wilk(data)) == "list")
  expect_true(typeof(shapiro_wilk(data_vector)) == "list")
  expect_true(typeof(shapiro_wilk(data_matrix)) == "list")
})

#' Check that length of list output is 2 (1 for  statistic values, other for p-values).
test_that("Test that output list is length 2", {
  stats <- shapiro_wilk(data)
  expect_true(length(stats) == 2)
})


#' check that the length of the first vector is as <= amount of columns in data
test_that("Test that length of first vector in output list is <= number of variables in dataframe", {
  stats_1 <- shapiro_wilk(data)[1]
  expect_true(length(stats_1) <= dim(data)[2])
})

#' check that the length of the first vector is equal to the output of the second vector
test_that("Test that both vectors in output list have the same lengths", {
  stats <- shapiro_wilk(data)
  expect_true(length(stats[1]) == length(stats[2]))
})

#' check that error is thrown with expression "no continuous variables to test" if dataframe doesn't have any
test_that("Test that error is thrown if input has no continuous variables", {
  expect_error(shapiro_wilk(data_bad), "Not all values in data are numeric")
})

#' check that the shapiro-wilk test statistic is correctly calculated because p-value should be > 0.05 for this test
test_that("Test that the S-W stat is properly calculated", {
  norm_values <- rnorm(100, 5, 2)
  expect_true(shapiro_wilk(norm_values)[2] > 0.05)
})
