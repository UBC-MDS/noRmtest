# This script tests the make_qqplot function

context("Test make_qqplot")

# Sample data
data <-  data.frame('a'=c(1,2,3),'b'=c(4,5,6))

#' Check that function returns a list
test_that("Test that output is a list", {

  plots <- make_qqplot(data)

  expect_true(typeof(plots)=="list")
})

#'Check that length of list <= # of continuous vars in a dataframe.
test_that("Test that output is <= number of continuous variables", {

  plots <- make_qqplot(data)

  expect_true(length(plots)<=dim(data)[2])
})


#'Check that each element is a plot
test_that("Test that each element is a plot", {

  plots <- make_qqplot(data)

  for (plt in plots) {
   expect_is(plt,"ggplot")
  }
})

#'Check that the element names of the list are the name of the columns
test_that("Test that list names are the names of the columns", {

  plots <- make_qqplot(data)

  for (column_name in names(plots)){
    expect_true(column_name %in% colnames(data))
  }
})

