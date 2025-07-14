# Load commonly used libraries
library(tibble)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(readr)
library(tidyr)
library(stringr)
library(purrr)
library(forcats)

# Set global chunk options (optional, for cleaner output)
knitr::opts_chunk$set(
  echo = FALSE,
  warning = FALSE,
  message = FALSE,
  fig.align = "center"
)

# Optional: Set a consistent theme for ggplot2
theme_set(theme_minimal())

# Optional: Create a custom color palette or reusable function
# my_colors <- c("#3366CC", "#DC3912", "#FF9900")
