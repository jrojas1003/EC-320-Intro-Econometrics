#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Tibbles:

# In the previous koan, we learned how to hold data in vectors. But data
# usually comes to us in a table format (like a spreadsheet). When you're
# working with a tibble, you want to think of it as just a bunch of column
# vectors.

# Load the tidyverse to get started:

library(tidyverse)
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
## ✔ readr   2.1.2     ✔ forcats 0.5.1
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                         ----- Building a tibble -----
#
# To show you what a tibble is, I'll build one. Suppose I have some data on US
# GDP per capita and life expectancy since 1957. Here's the data in written
# form:
#
# In 1957, US GDP per capita was $14,847 and life expectancy was 69.5 years.
# In 1977, US GDP per capita was $24,073 and life expectancy was 73.4 years.
# In 1997, US GDP per capita was $35,767 and life expectancy was 76.8 years.

# Here's how to put that data into a tibble in R. Read this carefully and run
# the code (highlight the code you want to run or put your cursor at the end
# of an expression and hit Cmd-Return):

us_data <- tibble(
  year = c(1957, 1977, 1997),
  gdpPercap = c(14847, 24073, 35767),
  lifeExp = c(69.5, 73.4, 76.8)
)

us_data
## # A tibble: 3 × 3
##    year gdpPercap lifeExp
##   <dbl>     <dbl>   <dbl>
## 1  1957     14847    69.5
## 2  1977     24073    73.4
## 3  1997     35767    76.8
# Notice that in order to build a tibble, you define vectors with 'c' that
# become the columns of the table. The columns have names.

# Now take some data for Canada:
# In 1957, GDP per capita in Canada was $12,490 and life expectancy was 70.0 years.
# In 1977, GDP per capita in Canada was $22,091 and life expectancy was 74.2 years.
# In 1997, GDP per capita in Canada was $28,955 and life expectancy was 78.0 years.

# 1. Create a tibble that holds the canada_data: -------------------------------

#1

canada_data <- tibble(
  year      = __,
  gdpPercap = __,
  lifeExp   = __
)

canada_data


# Tibbles are pretty strict. They have 2 rules you must follow:
#  1. Each column must be named ('year', 'gdpPercap', and 'lifeExp' are the
#     names here). If you try to define a column without giving it a name,
#     'tibble' will come up with the name for you.
#  2. Each column must have the same number of rows (each column vector has 3
#     elements, so each column vector has 3 rows, and the tibble has 3 rows). If
#     you try to define a column that's shorter than the others, 'tibble' will
#     either recycle the values of that column to make it long enough, or it
#     will give you an error.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                       ----- Inspecting your tibble -----

# There are a few ways to see the data held in the tibble. The first way is
# to print the tibble to your console either by using the function 'print',
# or calling the dataset's name:

print(us_data)
## # A tibble: 3 × 3
##    year gdpPercap lifeExp
##   <dbl>     <dbl>   <dbl>
## 1  1957     14847    69.5
## 2  1977     24073    73.4
## 3  1997     35767    76.8
us_data
## # A tibble: 3 × 3
##    year gdpPercap lifeExp
##   <dbl>     <dbl>   <dbl>
## 1  1957     14847    69.5
## 2  1977     24073    73.4
## 3  1997     35767    76.8
# A tibble: 4 x 3
#    year  gdpPercap lifeExp
#    <dbl>    <dbl>    <dbl>
# 1  1957     14847    69.5
# 2  1977     24073    73.4
# 3  1997     35767    76.8
# 4  2017     60062    78.5

# Another way is to use 'view()' to look at the data in a separate tab.

# view(us_data)

# Un-comment this line of code with Ctrl/Cmd Shift C. Then after running it,
# re-comment it using the same hotkeys. Why did I comment out view()?
# It doesn't play nicely with my koan tests (it opens a view tab each test,
# which will be slow and painful for you). It's best to always comment out
# view() calls in the koans.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                         ----- Tibble Dimensions -----

# You can use the functions 'nrow()' and 'ncol' to find the dimensions of the
# tibble. For instance, this tells us that us_data has 3 rows:

nrow(us_data)
## [1] 3
# 2. How many columns does us_data have? ---------------------------------------

#2

ncol(us_data) == __

?qelp::nrow
?qelp::ncol

# In a tibble, columns are called *variables*. Rows are called *observations*.
# This is very important to understand. In our tibble, the *variables* (columns)
# are 'year','gdpPercap', and 'lifeExp': they're the things that were measured
# for each *observation* (row): for 1957, 1977, and 1997.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                         ----- Variable Names -----

# You can get the variable (column) names of a tibble using 'names()':

# 3. What does names() return when you apply it to us_data? --------------------


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                         ----- Adding Rows -----

# Suppose you want to append a row (or several) to your dataset. You can do that
# using the function 'add_row()'. It takes the tibble as the first argument and
# then variable names and values to construct the new row. Suppose we got a new
# observation (row) about Canada: In 2007, GDP per capita in Canada was $36,319
# and life expectancy was 80.7 years.


#4

add_row(
  canada_data,
  year = __,
  gdpPercap = __,
  lifeExp = __
)


# Make sure to read the qelp docs for 'tibble':
?qelp::tibble

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In this koan, you'll learn how to use lm() to estimate models with:

#   * log transformations,
#   * a squared term,
#   * no intercept,
#   * categorical variables (called "factors"),
#   * and interactions between variables.

# Run this code to get started:
library(tidyverse)
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
## ✔ readr   2.1.2     ✔ forcats 0.5.1
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
library(gapminder)

# Read the qelp docs on lm():
?qelp::lm

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#             ----- Estimates, Standard Errors, and R-Squared -----

# 1. Simple Regression: How much can a $1 increase to a country's GDP per ------
# capita be expected to boost that country's life expectancy?
# Recall the lm() syntax is: lm(y ~ x, data = gapminder)

#01



# A $1 increase to a country's GDP per capita can be associated with a __ year
# increase in life expectancy.



# lm() prints very limited information. Usually we'd at least want to know the
# standard errors along with the coefficients. Practice piping the lm() call
# into `broom::tidy(conf.int = TRUE)` to get a tidied results table that shows
# you standard errors, test statistics, p-values, and even 95% confidence
# intervals.

# 2. Pipe the simple regression from question 1 into ---------------------------
# `broom::tidy(conf.int = TRUE)`. Is the coefficient on `gdpPercap` greater
# than 0 at the 1% level?

#02

lm(__) %>%
  broom::tidy(conf.int = TRUE)

# The coefficient on `gdpPercap` __ greater than 0 at the 1% level.
# (In the blank above, write "is" or "is not".)


# 3. To see the regression's r-squared, pipe the lm() call into ----------------
# `broom::glance()`.

#03

lm(__) %>%
  broom::glance()

# This model explains __% of the variation in lifeExp.



#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                    ----- Fitted Values and Residuals -----
#
# In this class, we'll sometimes need to access fitted values and residuals from
# an lm() call. You should use the functions fitted.values() and residuals() to
# do that.

# 4. Pipe the simple regression into fitted.values() to get a vector of --------
# length 1704 (the same length as the number of rows of gapminder).

#04

lm(__) %>%
  __



# 5. Pipe the simple regression into residuals() to get another vector ---------
# of length 1704. Recall that the fitted values plus the residuals will be equal
# to the observed values for lifeExp.

#05

lm(__) %>%
  __

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                      ----- Transforming Variables ------
#
# 6. Take the simple regression we've been working on and apply a log ----------
# transformation to both the dependent variable and the explanatory variable by
# wrapping the variable names in the function log():
# lm(log(y) ~ log(x), data = gapminder).

#06

lm(__) %>%
  broom::tidy(conf.int = TRUE)

# When GDP per capita increases by 1%, life expectancy will increase by __%.


# 7. Instead of applying log() to both the dependent and explanatory -----------
# variable, apply it only to the explanatory variable. Does the R-squared
# improve?

#07

lm(__) %>%
  broom::glance()



# 8. Instead of doing a log transformation, try taking the square --------------
# of gdpPercap. You'll need to wrap the transformation in I(), which "inhibits
# the interpretation" of arithmetic operators like "+", "-", "*", and "^" in
# formulas. So the formula will look like: lm(y ~ I(x^2), data = gapminder).
# What's the R-squared now? Does a log transformation, square transformation,
# or no transformation at all of gdpPercap seem to be the best fit?

#08

lm(__) %>%
  broom::glance()

# This model explains __% of the variation in lifeExp.


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 9. If you wanted to omit the intercept term, you can do that like this: ------
#    lm(y ~ 0 + x, data = gapminder). Take the simple regression and omit
#    the intercept.

#09

lm(__) %>%
  broom::tidy(conf.int = TRUE)



# 10. Take the simple regression we've been working on and add a second --------
# explanatory variable: 'year'.

#10

lm(__ ~ __ + __, data = __) %>%
  broom::tidy(conf.int = TRUE)

# Every year, a country's life expectancy is expected to increase by __ years.



# 11. Take out 'year' from the model and add 'continent'. This variable --------
# is different from the numerical variables we've been working with (lifeExp,
# gdpPercap, and year are all numeric). 'continent' is a "factor" variable,
# which means the data is categorical rather than numeric. When you add
# 'continent', lm() lets different continents have different intercepts.

#11

lm(__ ~ __ + __, data = __) %>%
  broom::tidy(conf.int = TRUE)

# What happened to Africa? One level has to be omitted to avoid the dummy
# variable trap. So the intercept is the OLS prediction for the intercept for
# Africa. It's saying that if a country in Africa has a GDP per capita of $0
# (which is nonsense), the life expectancy of the people in that country is
# expected to be 47.9 years. The intercept for a country in the Americas is
# 47.9 + 13.6 = 61.5 years.

# Our model predicts that a country in Asia with $0 GDP per capita will have a
# life expectancy of __ years.


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In the previous question, we learned that you can allow different continents
# to have different *intercepts* by including 'continent' as an explanatory
# variable.

# You can also allow different continents to have different *slopes* by
# including an interaction between 'continent' and another variable like
# 'gdpPercap'.

# 12. Estimate a model of lifeExp where the explanatory variable is ------------
# the interaction between 'gdpPercap' and 'continent'. Hint: an interaction
# between x and z is done like this: lm(y ~ x:z, data = gapminder)

#12

lm(__) %>%
  broom::tidy(conf.int = TRUE)

# According to our model, a $1 larger GDP per capita can be associated with a
# __ year higher life expectancy in Europe.


# Note: When you include interactions between variables, you usually also
# include the variables by themselves: y ~ x + z + x:z. That way, you're letting
# both the slope and the intercept vary by the variables. A shorthand for that
# specification is this: y ~ x*z.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::