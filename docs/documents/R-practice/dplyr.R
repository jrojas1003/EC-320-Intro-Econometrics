#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# You'll learn the first three dplyr verbs: 'filter', 'select',
# and 'mutate'.

# dplyr is a package for data manipulation (the name is supposed to evoke
# "data pliers"). It's included in the tidyverse, so you automatically have
# access to all the dplyr functions whenever you attach the tidyverse with
# 'library(tidyverse)'.

# dplyr is a SQL implementation. What is SQL? It stands for "Structured Query
# Language": it's a programming language for answering questions ("queries")
# about a dataset. With SQL (and with dplyr), you can transform your data into a
# neat table of results to answer just about any question you have about your
# data!

# As we'll see in this exercise and the next, you can use dplyr on a
# basic demographic dataset to answer questions like...
# - What were the 5 richest countries in the 1950s?
# - Which continent has the highest life expectancy on average?
# - What year did Mexico have the highest population growth?

# SQL is wonderful because in order to answer all these questions, you only need
# to learn 7 functions! dplyr is the same way, except dplyr is EVEN MORE
# wonderful because, where SQL is very *structured*, dplyr is not. You can use
# the 7 dplyr functions in whichever order feels straightforward and logical.
# This helps with readability and clarity (two of our biggest goals with writing
# good code).

# In this exercise, we'll learn the first 3 dplyr functions: 'filter()',
# 'select()', and 'mutate()'.

# In the next exercise, we'll learn two more: 'summarize()' and 'group_by()'.

# Finally, we'll finish up by learning the last two: 'arrange()' and 'slice()'.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Run this code to get started and to view the dataset:

library(tidyverse)
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
## ✔ readr   2.1.2     ✔ forcats 0.5.1
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
# install a new package 'gapminder'
install.packages("gapminder")
library(gapminder)
view(gapminder)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- filter() -----

# The first dplyr function we'll learn is 'filter()'. It lets us filter
# our tibble by some logical condition, like "continent is equal to Europe".
# This gives us all the rows (observations) that have Europe as the continent.

gapminder %>%
  filter(continent == "Europe")
## # A tibble: 360 × 6
##    country continent  year lifeExp     pop gdpPercap
##    <fct>   <fct>     <int>   <dbl>   <int>     <dbl>
##  1 Albania Europe     1952    55.2 1282697     1601.
##  2 Albania Europe     1957    59.3 1476505     1942.
##  3 Albania Europe     1962    64.8 1728137     2313.
##  4 Albania Europe     1967    66.2 1984060     2760.
##  5 Albania Europe     1972    67.7 2263554     3313.
##  6 Albania Europe     1977    68.9 2509048     3533.
##  7 Albania Europe     1982    70.4 2780097     3631.
##  8 Albania Europe     1987    72   3075321     3739.
##  9 Albania Europe     1992    71.6 3326498     2497.
## 10 Albania Europe     1997    73.0 3428038     3193.
## # … with 350 more rows
# You can filter on more than one logical condition at a time. This will
# return a tibble with all the gapminder observations from Asia in the year
# 1952. Recall that character strings ("Asia") need quotes, but variable names
# and numbers don't (continent, year, 1952).

gapminder %>%
  filter(continent == "Asia", year == 1952)
## # A tibble: 33 × 6
##    country          continent  year lifeExp       pop gdpPercap
##    <fct>            <fct>     <int>   <dbl>     <int>     <dbl>
##  1 Afghanistan      Asia       1952    28.8   8425333      779.
##  2 Bahrain          Asia       1952    50.9    120447     9867.
##  3 Bangladesh       Asia       1952    37.5  46886859      684.
##  4 Cambodia         Asia       1952    39.4   4693836      368.
##  5 China            Asia       1952    44   556263527      400.
##  6 Hong Kong, China Asia       1952    61.0   2125900     3054.
##  7 India            Asia       1952    37.4 372000000      547.
##  8 Indonesia        Asia       1952    37.5  82052000      750.
##  9 Iran             Asia       1952    44.9  17272000     3035.
## 10 Iraq             Asia       1952    45.3   5441766     4130.
## # … with 23 more rows
# Read the qelp docs on 'filter()':

?qelp::filter

# 1. Filter gapminder for all the observations from Europe in 2007. ------------

#1


# 2. Filter gapminder for all the observations where lifeExp was exactly -------
# equal to 68 years old.

#2


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                          ----- Logical Operators -----

# The operator '==' reads "is equal to".
# But that's not the only logical operator you can use with 'filter()'.

# '!=': "not equal to"
# '>', '>=', '<', '<=': "greater than", "greater than or equal to", etc.
# '%in%': for "in"

# 3. Filter gapminder for a short list of the richest countries in Asia. -------

#3

gapminder %>%
  filter(continent == __, gdpPercap __ 30000)


# 4. Filter gapminder for observations *IN* the United States, Germany, --------
# and Brazil.

#4

gapminder %>%
  filter(country __ c("United States", "Germany", "Brazil"))


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- select() -----
#
# The function 'select()' lets you select columns (variables) of a tibble
# by name. No quotes are necessary because they're variable names.

gapminder %>%
  select(country, continent, year)
## # A tibble: 1,704 × 3
##    country     continent  year
##    <fct>       <fct>     <int>
##  1 Afghanistan Asia       1952
##  2 Afghanistan Asia       1957
##  3 Afghanistan Asia       1962
##  4 Afghanistan Asia       1967
##  5 Afghanistan Asia       1972
##  6 Afghanistan Asia       1977
##  7 Afghanistan Asia       1982
##  8 Afghanistan Asia       1987
##  9 Afghanistan Asia       1992
## 10 Afghanistan Asia       1997
## # … with 1,694 more rows
# 5: Select the last 3 variables of 'gapminder' by name: -----------------------

#5

gapminder %>%
  select(__, __, __)


# You can also use 'select()' to rename variables. For example, to create
# a tibble where the variable 'lifeExp' is changed to the name
# 'life_expectancy', you can do this:

gapminder %>%
  select(life_expectancy = lifeExp)
## # A tibble: 1,704 × 1
##    life_expectancy
##              <dbl>
##  1            28.8
##  2            30.3
##  3            32.0
##  4            34.0
##  5            36.1
##  6            38.4
##  7            39.9
##  8            40.8
##  9            41.7
## 10            41.8
## # … with 1,694 more rows
# Make sure to read the qelp docs on 'select()':

?qelp::select

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- mutate() -----

# Use 'mutate()' to add new variables to your tibble. Those new variables
# can even be transformations of other existing variables. For example,
# we can create a variable called 'total_gdp' that is the product of
# 'pop' and 'gdpPercap'. I've piped it into 'view()' so you can verify that
# it worked.

# gapminder %>%
#   mutate(total_gdp = pop*gdpPercap) %>%
#   view()

# 6. Use 'mutate()' to create a new variable 'pop_in_thousands'. ---------------
# So if the observation has 'pop' = 97,462, then 'pop_in_thousands' will be
# 97.462.

#6

gapminder %>%
  mutate(__)

# Read the qelp docs on 'mutate()':

?qelp::mutate

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# You'll learn the next two dplyr verbs:
# summarize() and group_by().

# Run this code to get started.

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

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                            ----- summarize() -----

# 'summarize()' reduces a tibble down to a customized summary.

# For example, when you want to know the minimum value of a variable,
# or the maximum, or the mean, or the median, you can use 'summarize()'.

gapminder %>%
  summarize(lifeExp_min = min(lifeExp), lifeExp_max = max(lifeExp))
## # A tibble: 1 × 2
##   lifeExp_min lifeExp_max
##         <dbl>       <dbl>
## 1        23.6        82.6
# The output is a tibble with columns as summary statistics. Make
# sure to give columns names (lifeExp_min and lifeExp_max).

# 1. Take 'gapminder', filter for only observations in Africa, -----------------
# and summarize to find the:
#    median life expectancy,
#    median population, and
#    median GDP per capita.

#1

gapminder %>%
__


# 2. Take 'gapminder', add a new column (mutate) for the total gdp, ------------
# and summarize to find the mean and median total gdp. Try to recall how to use
# mutate before looking at the last koan.

#2

gapminder %>%
__


# Read the qelp docs on 'summarize()':

?qelp::summarize

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                             ----- group_by() -----

# The fifth dplyr function we'll learn is 'group_by()'. It sorts your data into
# buckets (groups) by the variable you specify.

# For example, this code sorts gapminder into buckets by year:

gapminder %>%
  group_by(year)
## # A tibble: 1,704 × 6
## # Groups:   year [12]
##    country     continent  year lifeExp      pop gdpPercap
##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan Asia       1952    28.8  8425333      779.
##  2 Afghanistan Asia       1957    30.3  9240934      821.
##  3 Afghanistan Asia       1962    32.0 10267083      853.
##  4 Afghanistan Asia       1967    34.0 11537966      836.
##  5 Afghanistan Asia       1972    36.1 13079460      740.
##  6 Afghanistan Asia       1977    38.4 14880372      786.
##  7 Afghanistan Asia       1982    39.9 12881816      978.
##  8 Afghanistan Asia       1987    40.8 13867957      852.
##  9 Afghanistan Asia       1992    41.7 16317921      649.
## 10 Afghanistan Asia       1997    41.8 22227415      635.
## # … with 1,694 more rows
# There's no obvious difference between a grouped tibble and an ungrouped tibble
# except that a grouped tibble has a special attribute called Groups:

#  A tibble: 1,704 x 6
#  Groups:   year [12] <---- here's the attribute!
#    country     continent  year lifeExp      pop gdpPercap
#    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
#  1 Afghanistan Asia       1952    28.8  8425333      779.
#  2 Afghanistan Asia       1957    30.3  9240934      821.
#  3 Afghanistan Asia       1962    32.0 10267083      853.

# 'group_by()' isn't very useful on its own. To see how powerful it is, pair it
# with 'summarize()':

gapminder %>%
  group_by(year) %>%
  summarize(lifeExp_median = median(lifeExp))
## # A tibble: 12 × 2
##     year lifeExp_median
##    <int>          <dbl>
##  1  1952           45.1
##  2  1957           48.4
##  3  1962           50.9
##  4  1967           53.8
##  5  1972           56.5
##  6  1977           59.7
##  7  1982           62.4
##  8  1987           65.8
##  9  1992           67.7
## 10  1997           69.4
## 11  2002           70.8
## 12  2007           71.9
# On its own, 'summarize()' outputs a tibble with *one row*. But in conjunction
# with 'group_by()', 'summarize()' outputs a tibble with the same number of rows
# as there are buckets (groups).

# The code above outputs a summary that tells us what the median life expectancy
# is in our data *for each year*. It's as if R sorted our observations (rows)
# into buckets by the grouping variable and visited each bucket individually to
# calculate the summary statistic before reporting the results.

# Grouped summaries are profoundly useful. Working with data, you'll use them
# all the time.

# 3. Take 'gapminder', filter for only observations in Africa, -----------------
# and summarize to find the median life expectancy, population, and
# GDP per capita *for each country*.

#3

gapminder %>%
__


# 4. Summarize 'gapminder' to find the mean GDP per capita for each ------------
# continent, for each year (use 2 variables inside 'group_by').

#4

gapminder %>%
__


# Read the qelp docs on 'group_by()':
?qelp::group_by

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- count() -----
#
# Oftentimes you'll need to answer questions like, "How many observations
# do I have in each continent?"

# You /could/ 'filter' for each continent and then use 'nrow':

gapminder %>%
  filter(continent == "Africa") %>%
  nrow()
## [1] 624
gapminder %>%
  filter(continent == "Americas") %>%
  nrow()
## [1] 300
gapminder %>%
  filter(continent == "Asia") %>%
  nrow()
## [1] 396
# But this is not the best way: it's repetitive. If 'continent'
# took on 100 values, you'd have to copy-paste the code above 100 times!

# Instead, 'group_by' continent and 'summarize()' with the function 'n()',
#  which counts the number of observations in the grouping context:

gapminder %>%
  group_by(continent) %>%
  summarize(n_observations = n())
## # A tibble: 5 × 2
##   continent n_observations
##   <fct>              <int>
## 1 Africa               624
## 2 Americas             300
## 3 Asia                 396
## 4 Europe               360
## 5 Oceania               24
# Grouping by a variable and counting 'n()' is such a common task,
# there's an even simpler way to do it: 'count()' is equivalent
# to group_by + summarize + n:

gapminder %>%
  count(continent)
## # A tibble: 5 × 2
##   continent     n
##   <fct>     <int>
## 1 Africa      624
## 2 Americas    300
## 3 Asia        396
## 4 Europe      360
## 5 Oceania      24
# 5. How many observations are there from each country? ------------------------

#5

gapminder %>%
__


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In this koan, you'll learn the final two dplyr verbs: arrange() and slice().

# Run this code to get started.

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

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                             ----- arrange() -----

# arrange() rearranges the rows of your tibble by the variable you specify.

gapminder %>%
  arrange(pop)
## # A tibble: 1,704 × 6
##    country               continent  year lifeExp   pop gdpPercap
##    <fct>                 <fct>     <int>   <dbl> <int>     <dbl>
##  1 Sao Tome and Principe Africa     1952    46.5 60011      880.
##  2 Sao Tome and Principe Africa     1957    48.9 61325      861.
##  3 Djibouti              Africa     1952    34.8 63149     2670.
##  4 Sao Tome and Principe Africa     1962    51.9 65345     1072.
##  5 Sao Tome and Principe Africa     1967    54.4 70787     1385.
##  6 Djibouti              Africa     1957    37.3 71851     2865.
##  7 Sao Tome and Principe Africa     1972    56.5 76595     1533.
##  8 Sao Tome and Principe Africa     1977    58.6 86796     1738.
##  9 Djibouti              Africa     1962    39.7 89898     3021.
## 10 Sao Tome and Principe Africa     1982    60.4 98593     1890.
## # … with 1,694 more rows
# The code above rearranges 'gapminder' to put the observations with the
# lowest population first, so that the variable 'pop' is ascending.

# If instead you wanted 'pop' to be descending (the observations with the
# largest populations first), you can use 'desc()':

gapminder %>%
  arrange(desc(pop))
## # A tibble: 1,704 × 6
##    country continent  year lifeExp        pop gdpPercap
##    <fct>   <fct>     <int>   <dbl>      <int>     <dbl>
##  1 China   Asia       2007    73.0 1318683096     4959.
##  2 China   Asia       2002    72.0 1280400000     3119.
##  3 China   Asia       1997    70.4 1230075000     2289.
##  4 China   Asia       1992    68.7 1164970000     1656.
##  5 India   Asia       2007    64.7 1110396331     2452.
##  6 China   Asia       1987    67.3 1084035000     1379.
##  7 India   Asia       2002    62.9 1034172547     1747.
##  8 China   Asia       1982    65.5 1000281000      962.
##  9 India   Asia       1997    61.8  959000000     1459.
## 10 China   Asia       1977    64.0  943455000      741.
## # … with 1,694 more rows


# 1. Take all the observations in Asia and sort them from the lowest -----------
# life expectancies to the highest.

#1



# 2. Take all the observations in Asia and sort them from the highest ----------
# life expectancies to the lowest.

#2



# Read the qelp docs on arrange():

?qelp::arrange

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- slice() -----

# slice() lets you select rows by their integer locations. So if you
# want to select the second row of 'gapminder':

gapminder %>%
  slice(2)
## # A tibble: 1 × 6
##   country     continent  year lifeExp     pop gdpPercap
##   <fct>       <fct>     <int>   <dbl>   <int>     <dbl>
## 1 Afghanistan Asia       1957    30.3 9240934      821.
# If you want to select the second, third, and fourth rows:

gapminder %>%
  slice(c(2, 3, 4))
## # A tibble: 3 × 6
##   country     continent  year lifeExp      pop gdpPercap
##   <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Afghanistan Asia       1957    30.3  9240934      821.
## 2 Afghanistan Asia       1962    32.0 10267083      853.
## 3 Afghanistan Asia       1967    34.0 11537966      836.
# Or equivalently:

gapminder %>%
  slice(2:4)
## # A tibble: 3 × 6
##   country     continent  year lifeExp      pop gdpPercap
##   <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Afghanistan Asia       1957    30.3  9240934      821.
## 2 Afghanistan Asia       1962    32.0 10267083      853.
## 3 Afghanistan Asia       1967    34.0 11537966      836.

# 3. Select row 853 to row 864. ------------------------------------------------

#3



# Two related functions are slice_head() and slice_tail().

# slice_head() takes the first 'n' rows of a tibble:

gapminder %>%
  slice_head(n = 2)
## # A tibble: 2 × 6
##   country     continent  year lifeExp     pop gdpPercap
##   <fct>       <fct>     <int>   <dbl>   <int>     <dbl>
## 1 Afghanistan Asia       1952    28.8 8425333      779.
## 2 Afghanistan Asia       1957    30.3 9240934      821.
# slice_tail() takes the last 'n' rows of a tibble:

gapminder %>%
  slice_tail(n = 2)
## # A tibble: 2 × 6
##   country  continent  year lifeExp      pop gdpPercap
##   <fct>    <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Zimbabwe Africa     2002    40.0 11926563      672.
## 2 Zimbabwe Africa     2007    43.5 12311143      470.
# 4. Take all the observations in Asia and return the five with the ------------
# highest life expectancies (hint: use arrange()).

#4


# 5. Which (one) country has the highest life expectancy in each continent?-----
# (hint: use arrange() and also group_by()).

#5


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::