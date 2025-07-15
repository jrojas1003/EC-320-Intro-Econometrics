#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# The tidyverse ecosystem has 2 great ways to draw plots: they are qplot() and
# ggplot(). You've already had some practice drawing qplots in project 1.
# qplot() was designed to be a simplified version of ggplot(), so you already
# have a head start with learning ggplot()!

# What's with the name?
# The double g's in 'ggplot' stand for the "grammar of graphics". The idea is
# that you shouldn't have to memorize tons of details about how a plotting tool
# works in order to create the right visualization for your data. Instead, your
# plotting tool should work like a language in itself. Once you understand how
# to speak the language, you can start building your own visualizations to
# communicate your unique ideas very fast.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Run this code to get started and to take a look at the data:

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
us_data <- filter(gapminder, country == "United States")
# view(us_data)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# You've practiced building scatterplots with qplot() like this:

qplot(data = us_data, x = gdpPercap, y = lifeExp)


# 1. Replicate that scatterplot using ggplot() with a points layer: ------------

#1

ggplot(data = __, aes(x = __, y = __)) +
  geom_point()


# Notice ggplot() wraps x and y in 'aes'.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# You've also practiced adding main titles and axis labels to your qplot:

qplot(
  data = us_data,
  x = gdpPercap,
  y = lifeExp,
  main = "As GDP per capita increases, so does life expectancy",
  xlab = "GDP per capita",
  ylab = "Life expectancy"
)


# 2. Add a main title and axis labels (labs) to your ggplot: -------------------

#2

ggplot(data = __, aes(x = __, y = __)) +
  geom_point() +
  labs(x = __, y = __, title = __)


# Notice that with 'ggplot()', functions are added '+' to the main ggplot call.
# These are called layers. So a layer is added to draw the points of the
# scatterplot, and another layer is added to draw axis labels and a title.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# You've also practiced using multiple geoms with a qplot:

qplot(
  data = us_data,
  x = gdpPercap,
  y = lifeExp,
  geom = c("point", "line", "smooth")
)
## `geom_smooth()` using method = 'loess' and formula 'y ~ x'


# 3. Use multiple geom's in a ggplot (if there's no blank '__', you don't ------
#    need to write anything!):

#3

ggplot(data = __, aes(x = __, y = __)) +
  geom_point() +
  geom_line() +
  geom_smooth()


# Notice that with 'ggplot()', to add multiple geoms, you add '+' layers.

#   Aesthetic mappings do just one simple thing: they take variables (columns)
#   in your data and map them to visual elements in your plot.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

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

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                            ----- x and y axis -----

# When you declare which variable should be represented on which axis, you're
# using an *aesthetic mapping* (taking variables in your data and mapping them
# to visual elements in your plot). That's why 'x = ' and 'y = ' are wrapped in
# 'aes()' in a ggplot.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()


# Each point in the scatterplot above represents an observation (row): a certain
# country in a certain year. We can easily create different plots for each
# 'continent' using facet_wrap(). The tilde '~' can be read as "by". So by
# adding a facet layer, we "facet *by* continent". Make sure to take a look at
# the plot.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  facet_wrap(~ continent)


# 1. Change the plot above to facet by 'year' instead of faceting by -----------
# 'continent'.

#1


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                               ----- color -----

# An alternative to faceting is to use color as the plot aesthetic to
# differentiate between continents. So all the points in Africa will be red,
# Europe will be blue, etc. This is an 'aes'thetic mapping because we're taking
# a variable 'continent' and mapping it to the visual element 'color'.

# 2. Draw a scatterplot comparing gdpPercap and lifeExp, where different -------
# continents are drawn with different colors.

#2

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = __)) +
  geom_point()


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                                ----- fill -----
#
# 'color' is an aesthetic mapping which changes the color of the *outline* of
# the geometry. If instead you want to change the color of the *fill* of the
# geometry, use 'fill' instead of 'color'.

# To see both the 'color' and the 'fill' of a point, I'll use 'shape = 21':
# points with outlines.

# 3. Use 'color' to represent 'continent', and use 'fill' to represent ---------
# 'year'.

#3

ggplot(
  data = gapminder,
  aes(x = gdpPercap, y = lifeExp, color = __, fill = __)
  ) +
  geom_point(shape = 21)


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                               ----- shape -----
#
# A third aesthetic mapping is 'shape'. We actually just used 'shape' in
# the previous question, outside of the 'aes' call in 'geom_point'. That
# set the shape of the points to a fixed value (shape = 21: points with
# outlines).

# 4. Try mapping 'shape' to 'continent' *inside* of an aes() call. -------------

#4

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(shape = __))


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In question 4, we specified an 'aes' in the 'ggplot()' call *and* in the
# 'geom_point()' call. Something that's important to understand is that layers
# like 'geom_point' which are added on to a ggplot call will inherit the data
# and the aesthetic mappings from that initial ggplot call by default. That's
# why all of these plots do the same thing:

# You can put all information in the ggplot() call:

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, shape = continent)) +
  geom_point()


# You can put some information in the ggplot() call and some in the geom_point()
# call:

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(shape = continent))


# You can put all information in the geom_point() call:

ggplot() +
  geom_point(
    data = gapminder,
    aes(x = gdpPercap, y = lifeExp, shape = continent)
    )


# But warning: if you have multiple geom's and put all information in one of
# them, the other geom won't inherit that information.
# In this example, the geom_smooth() layer isn't drawn because it doesn't
# inherit any of the information it needs from ggplot().

ggplot() +
  geom_point(
    data = gapminder,
    aes(x = gdpPercap, y = lifeExp, shape = continent)
    ) +
  geom_smooth()


# Instead, give geom_smooth() the information it needs either directly, or by
# putting the information in the ggplot() call. These two draw the same plot,
# but the second is better because it avoids unnecessary repetition in code,
# which makes it less clear and readable.

ggplot() +
  geom_point(
    data = gapminder,
    aes(x = gdpPercap, y = lifeExp, shape = continent)
    ) +
  geom_smooth(
    data = gapminder,
    aes(x = gdpPercap, y = lifeExp)
    )
## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'


ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(shape = continent)) +
  geom_smooth()
## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                                ----- size -----
#
# 5. So far we have 3 aesthetic mappings other than x and y axis: --------------
# They are 'color', 'fill', and 'shape'. The last 'aes' we'll talk about is
# 'size', which adjusts point size. Add 2 'aes' to this plot: map 'continent' to
# 'color', and map 'pop' to 'size'. How many legends are there now?

#5

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(__)


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# You'll practice using some of the most commonly used 'geom's,
# one by one. Keep in mind that you can use multiple 'geoms' at a time by
# layering them on top of each other.

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

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# My favorite 'geom's for looking at the distribution of one variable:

#  'geom_histogram()',
#  'geom_freqpoly()',
#  'geom_area()',
#  'geom_density()'

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                           ----- geom_histogram -----

# 1. Draw a histogram to visualize lifeExp using geom_histogram(). -------------

#01

ggplot(
  data = gapminder,
  aes(x = lifeExp, color = continent, fill = continent)
  ) +
  __


# 2. Experiment with different binwidths for your histogram. -------------------

#02

ggplot(
  data = gapminder,
  aes(x = lifeExp, color = continent, fill = continent)
  ) +
  __(binwidth = __)


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                           ----- geom_freqpoly -----
#
# 3. geom_freqpoly() is just like a histogram, but it uses lines instead -------
# of bars to communicate the number of observations in each bin. Again,
# experiment with binwidth.

#03

ggplot(
  data = gapminder, aes(x = lifeExp, color = continent)
  ) +
  __(binwidth = __)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                             ----- geom_area -----
#
# 4. Make a filled frequency polygon using an area plot: geom_area(). In -------
# the blank, experiment with setting 'color' versus 'fill' as 'continent'.

#04

ggplot(data = gapminder, aes(x = lifeExp, __ = continent)) +
  geom_area(stat = "bin")


# 5. Notice that the continents are stacked up on top of each other in ---------
# the previous plot. To change that behavior, set position = "dodge".

#05

ggplot(data = gapminder, aes(x = lifeExp, fill = continent)) +
  geom_area(stat = "bin", position = __)



# 6. The issue now is that there's overplotting. Data for the Americas ---------
# is totally hidden behind the other continents! One way to fix this is
# to adjust the transparency of points through 'alpha'. Setting 'alpha = .5'
# reduces the 'geom' transparency to 50%. Experiment with different alphas.

#06

ggplot(data = gapminder, aes(x = lifeExp, fill = continent)) +
  geom_area(stat = "bin", position = "dodge", alpha = __)


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                            ----- geom_density -----
#
# An alternative to bin visualizations is density visualizations. They smooth
# out the distributions and account for factors like the fact that there aren't
# very many observations from Oceania. The downside is what's measured on the
# y-axis is less intuitive than the 'count' we've seen in the other geoms.

# 7. Experiment with setting 'color' and 'fill' to 'continent'. ----------------

#07

ggplot(data = gapminder, aes(x = lifeExp, __)) +
  __()


# 8 With geom_density and fill, experiment with different alpha's. -------------

#08

ggplot(data = gapminder, aes(x = lifeExp, __)) +
  __(alpha = __)


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                    ----- Graphical primitives to know -----
#
# geom_vline() adds a vertical line
# geom_hline() adds a horizontal line
# geom_segment() adds a line segment
# geom_rect() adds a rectangle
# annotate() adds annotations inside the plot

# 9. Add a vertical line to this plot. -----------------------------------------
#     Hint: for a vertical line, you'll need to specify an x-intercept
#     (and for a horizontal line, you'd need to specify a y-intercept).
#     Do this with 'xintercept = 70'.

#09

ggplot(
  data = gapminder,
  aes(x = lifeExp, color = continent, fill = continent)
  ) +
  geom_density(alpha = .3) +
  __



# 10. Include the vertical line you did above, and also note how the -----------
# annotation ('annotate()') labels the line.

#10

ggplot(
  data = gapminder,
  aes(x = lifeExp, color = continent, fill = continent)
  ) +
  geom_density(alpha = .3) +
  __ +
  annotate(
    "text", x = 70, y = .075, label = "70 years", angle = 90
    )


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                       ----- Variables on both axis -----
#
# My favorite 'geom's for plots comparing a variable on the x-axis to a
# variable on the y-axis:

# geom_point()
# geom_smooth()
# geom_line()
# geom_hex()
# geom_boxplot()
# geom_violin()

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 11. We've already talked about basic scatterplots. Try to recall how to ------
# draw a ggplot that plots 'gdpPercap' on the x-axis and 'lifeExp' on the
# y-axis.

#11



# 12. Add a smoothed line layer to the plot you did above using ----------------
# geom_smooth().

#12




# 13. Remove the standard error ribbon using geom_smooth(se = FALSE). ----------

#13




# 14. Visualize the OLS fit by using geom_smooth(method = "lm"). ---------------
#    "lm" stands for "linear model".

#14



#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# The visualization we made in 14) needs some work. The first issue is that a
# linear specification does not seem to fit very well. Let's try applying a log
# transformation to gdpPercap.

# 15. Instead of plotting 'gdpPercap' on the x-axis, plot the log of -----------
# 'gdpPercap' using log(). You should find that a linear model seems to fit this
# transformation much better.

#15

ggplot(data = gapminder, aes(x = __, y = lifeExp)) +
  geom_point() +
  geom_smooth(method = "lm")



# Notice that the units on the x-axis of the previous plot are in log terms,
# which is hard to interpret. I prefer this method: Do a log transformation of
# the x-axis using 'scale_x_log10()', and use 'labels = scales::comma' to
# suppress scientific notation on the labels for the x-axis.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  scale_x_log10(labels = scales::comma) +
  geom_point() +
  geom_smooth(method = "lm")
## `geom_smooth()` using formula 'y ~ x'


# 16. The second issue is that there's over-plotting near the center. I'd ------
# like a way to visualize how dense the points are getting. For this, we can
# replace 'geom_point()' with 'geom_hex()'.

#16

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  scale_x_log10(labels = scales::comma) +
  __ +
  geom_smooth(method = "lm")



#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 17. Draw a line plot using 'geom_line'. Compare US 'gdpPercap' over time -----
# to two other countries of your choice.

#17

gapminder %>%
  filter(country %in% c("United States", __, __)) %>%
  ggplot(aes(x = year, y = gdpPercap, color = country)) +
  geom_line()



#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 18. Draw a boxplot with geom_boxplot() that compares the gdpPercap (on -------
# the y-axis) of different continents (on the x-axis, also using color).
# Experiment with applying a log transformation to gdpPercap (now on the y
# axis).

#18

ggplot(
  data = gapminder,
  aes(x = continent, y = gdpPercap, color = continent)
  ) +
  __


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# 19. Change the plot from the previous question to be a violin plot -----------
# using 'geom_violin'. Also include 'fill'. Make sure you use 'scale_y_log10()'
# to transform the y-axis into log terms.

#19

ggplot(
  data = gapminder,
  aes(x = __, y = __, color = __, fill = __)
  ) +
  scale__ +
  __



#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Finally, check out how simple it is to change your 'facet_wrap' to a slick
# animation with 'gganimate'! The 'facet_wrap' version:

ggplot(
  data = gapminder,
  aes(x = log(gdpPercap), y = lifeExp)
) +
  geom_point(aes(color = continent)) +
  geom_density2d(color = "grey", alpha = .5) +
  facet_wrap(~ year)


# The animated version (this may take a second to render, also some of you may
# have trouble installing gganimate. If that's you, don't stress over this,
# leave the code below commented out.)

# ggplot(
#   data = gapminder,
#   aes(x = log(gdpPercap), y = lifeExp)
#   ) +
#   geom_point(aes(color = continent)) +
#   geom_density2d(color = "grey", alpha = .5) +
#   gganimate::transition_time(year) +
#   labs(title = "Year: {frame_time}")

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# To keep learning about ggplot (a great skill for your resume!), this is an
# excellent manual: https://ggplot2-book.org/introduction.html