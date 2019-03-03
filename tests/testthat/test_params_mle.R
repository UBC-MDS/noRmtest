# This script tests the params_mle function

context("Estimate mean and variance using MLE")

# Create dummy data for tests
dummy <-  data.frame("var1" = c(0,1,1,-1), "var2" =  c(-1, -1, 0, 1))
list_2d_type <-  list("var1" = dummy$var1, "var2" = dummy$"var2")
matrix_type <-  matrix(c(0,1,1,-1,-1,-1,0,1), ncol = 2)

# Expected output from Dummy
expected_results <-  data.frame("var1" = c(1/4, 11/16), "var2" = c(-1/4, 11/16),
                                row.names = c("Mean", "Variance"))

# Unit Tests
test_that("Parameter estimation is correct", {
  expect_equal(params_mle(dummy), expected_results)
  expect_equivalent(params_mle(matrix_type), expected_results)
  expect_equal(params_mle(list_2d_type), expected_results)
})

test_that("Type of returned variable is correct",{
  expect_true(is.data.frame(params_mle(dummy)))
  expect_true(is.data.frame(params_mle(matrix_type)))
  expect_true(is.data.frame(params_mle(list_2d_type)))
})

test_that("Empty inputs will throw error",{
  expect_error(params_mle(data.frame("var1"= c(), "var2" = c())))
  expect_error(params_mle(list("var1" = c(), "var2" = c())))
  expect_error(params_mle(matrix(nrow = 4, ncol = 2)))
})

test_that("Invalid input types will throw error",{
  expect_error(params_mle("hi"))
  expect_error(params_mle(factor(c("female", "male", "female"))))
  expect_error(params_mle(data.frame("var1" = c(1,2,"3", "4"))))
  expect_error(params_mle(matrix(c(TRUE, TRUE, FALSE, FALSE), ncol = 2, nrow = 2)))
})
