#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                     -----  Create a vector with 'c()' -----
#
# In R, data is held in vectors. One way to construct a vector is to use the
# function 'c()'. 'c()' is short for "combine": you can combine elements into a
# vector.

# Read the qelp docs on 'c()':
?qelp::c

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 1. Make the first element of this numeric vector '6'. Remember to always
# un-comment the line of code (Cmd-Shift-C), execute it (Cmd-Return), and then
# test this file to make sure you passed (Cmd-Shift-T).

#1

c(__, 4, 5, 2, 3)


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 2. Make the third element of this character vector 'economics'. --------------
# Note that quotes shouldn't be used with numbers, but should be used with
# character strings.

#2

c("apple", "banana", __)


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                      -----  Calculations on Vectors -----
#
# You can do all kinds of calculations on vectors. If you fill in the blank
# correctly, when you run these lines, R will print 'TRUE'.

# 3a. Add these two numeric vectors. -------------------------------------------

#3a

c(6, 3, 2) + c(3, 2, 1) == c(__, __, __)


# 3b. Find the minimum of this vector. -----------------------------------------
?qelp::min

#3b

min(c(6, 3, 2)) == __



# 3c. Find the sum of all elements of this vector. -----------------------------
?qelp::sum

#3c

sum(c(6, 3, 2)) == __


# 3d. Multiply a scalar and a vector. ------------------------------------------

#3d

100 * c(6, 3, 2) == c(__, __, __)

# 3e. Divide two vectors. ------------------------------------------------------

#3e

c(6, 3, 2) / c(2, 3, 1) == c(__, __, __)


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              -----  Length -----

# Vectors have a property called *length*, which is the number of elements in
# that vector. The length of the vector c("apple", "banana", "economics") is 3.

length(c("apple", "banana", "economics")) == 3
## [1] TRUE
# 4. Create a vector of length 5. It can be a character vector or --------------
# a numeric vector.

#4

length(___) == 5


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                    -----  More Ways to Create Vectors -----
#
# 5. If you want to create a vector of consecutive numbers like ----------------
#    'c(1, 2, 3)', the shorthand is '1:3'.

# c(1, 2, 3) == 1:3
## [1] TRUE TRUE TRUE
#5

c(2, 3, 4) == __:__


# To create a vector with elements that are repeated, use 'rep':
?qelp::rep

# This repeats 1 five times, 2 five times, and then 3 five times.

rep(1:3, each = 5)
##  [1] 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3
# To create a vector that does random sampling, use 'sample':
?qelp::sample

# This randomly draws 0's or 1's to create a random vector of length 10.
sample(c(0, 1), size = 10, replace = TRUE)
##  [1] 1 1 0 1 1 0 0 0 1 0
# 6. Create a random character vector that draws "heads" or "tails". -----------

#6

sample(__, size = 5, replace = TRUE)


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
                                PIPES 
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Run this code to get started:

library(tidyverse)

us_data <- tibble(
  year      = c(1957, 1977, 1997, 2017),
  gdpPercap = c(14847, 24073, 35767, 60062),
  lifeExp   = c(69.5, 73.4, 76.8, 78.5)
)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Piping: %>%

# The pipe is *the most frequently used* function in the tidyverse. It lets
# us clearly express a sequence of functions without cluttering our programs
# with parentheses from function composition.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                       ----- What does the pipe do? -----

# Suppose you have a tibble named 'x', and you'd like to apply a function
# 'f' on it. So you run:

# f(x)
# (this won't actually run because 'x' and 'f' don't exist yet)

# But an alternative way to do that is:

# x %>% f()
# (again, this won't actually run)

# The pipe simply takes the data that comes before it, and inserts it
# into the function that comes after.

# The way you should read the pipe is with the word *then*.
# Read the above code as "Take x, *then* apply f."

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- Examples -----

# You can apply a function directly, or you can pipe the data into a function.
# So two ways to do the same thing are:

names(us_data)
## [1] "year"      "gdpPercap" "lifeExp"
us_data %>% names()
## [1] "year"      "gdpPercap" "lifeExp"
# 1. Your turn: apply 'print' to us_data using a pipe. -------------------------

print(us_data)
## # A tibble: 4 × 3
##    year gdpPercap lifeExp
##   <dbl>     <dbl>   <dbl>
## 1  1957     14847    69.5
## 2  1977     24073    73.4
## 3  1997     35767    76.8
## 4  2017     60062    78.5
#1@

__ %>% __


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                  ----- Applying a sequence of functions -----
#
# You can start to see how the pipe comes in handy when you string 2 or
# more functions together.

# Suppose you have a tibble named 'x', and you'd like to apply a function
# 'f' on it. But you're not done: you want to take the data structure that's
# the result of 'f(x)' and apply another function 'g()' on that.

# So you run:

# g(f(x))

# An alternative way to do that is:

# x %>% f() %>% g()

# Or using multiple lines:

# x %>%
#   f() %>%
#   g()

# The code is evaluated from top to bottom, so that 'f(x)' is evaluated
# and then the result is piped into 'g()'. If you're using multiple lines,
# the pipe must go at the end of the line.

# With function composition, you have to read inside out: 'g(f(x))'.
# With pipes, you read left to right: 'x %>% f() %>% g()',
# or top to bottom when using multiple lines. Pipes oftentimes help us
# make our code more *clear and readable*, which is one of our biggest
# goals for writing good code.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Example: take 'us_data', get the variable names by applying the function
# 'names()' on it, AND THEN see those names in a new tab by applying the
# function 'view()' to the result of 'us_data %>% names()':

# us_data %>%
#   names() %>%
#   view()

# The alternative:

# view(names(us_data))

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# What would it look like to pipe a data structure into a sequence of 3,
# or even 4 functions?

# x %>%
#   f() %>%
#   g() %>%
#   h()

# x %>%
#   f() %>%
#   g() %>%
#   h() %>%
#   i()

# The alternative gets cluttered fast:

# h(g(f(x)))
#
# i(h(g(f(x))))

# You'll see plenty of examples of piping 2, 3, 4, or more functions in
# later sections, so keep an eye out for that!

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Finally, read the qelp docs on the pipe to find out even more:

?qelp::`%>%`

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: filter, select, and mutate.

