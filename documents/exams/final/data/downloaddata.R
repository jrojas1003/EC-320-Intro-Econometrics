# NOTE: to be able to download data via the IPUMS API,
# use `set_ipums_api_key()` with API key from https://account.ipums.org/api_keys
# to be able to use the functions below to query ipums
#
# Read more with:
# vignette("ipums-api")
#------------------------------------------------------------------------------#
#
# use ipums package to get data via API
library(ipumsr)
library(tidyverse)
# select ipums samples by name
# ACS_samples <- get_sample_info("usa") %>%
#   filter(str_detect( name, 'us20[0-9]{2}a' ) ) %>%
#   select( name ) %>% pull()
# select variables
variables <- list(
  "YEAR" , "PERWT" , "STATEFIP" , "AGE" , "EDUC", "DEGFIELD", "DEGFIELD2", "OCC2010", "INCTOT"
)

# ipumsr pipeline to submit data request and download after waiting
ACS_data_extract <-
  define_extract_usa(description = "2022 ACS microdata on education, degree, and occupation",
                     samples = "us2022a",
                     variables = variables) %>%
  submit_extract()
# wait until extract is processed to download data
if(is_extract_ready(ACS_data_extract)) {
  filepath <- download_extract(ACS_data_extract)
}

# download the file once processed
ACS2022_data <- read_ipums_micro(filepath) %>%
  # use labels as values
  mutate_at(c("DEGFIELD", "DEGFIELDD", "OCC2010", "STATEFIP"), haven::as_factor) %>%
  filter(!INCTOT %in% c(9999998, 9999999), # remove rows with missing income values
         AGE %in% 18:65) %>% # only include people between 18 and 65 years old
  mutate(
    school = case_when( # convert educational attainment to years of school
      EDUC == 0 ~ 0,
      EDUC == 1 ~ sample(c(1,2,3,4), size = 1, replace = T),
      EDUC == 2 ~ sample(c(5,6,7,8), size = 1, replace = T),
      EDUC == 3 ~ 9,
      EDUC == 4 ~ 10,
      EDUC == 5 ~ 11,
      EDUC == 6 ~ 12,
      EDUC == 7 ~ 13,
      EDUC == 8 ~ 14,
      EDUC == 9 ~ 15,
      EDUC == 10 ~ 16,
      EDUC == 11 ~ 17
      ),
    # crete indicator variables from underlying variables
    i_unemployed  = ifelse(str_detect(OCC2010, "Unemployed"), 1, 0),
    i_business    = ifelse(str_detect(DEGFIELD, "Business"),  1, 0),
    i_education   = ifelse(str_detect(DEGFIELD, "Education"), 1, 0),
    i_engineering = ifelse(str_detect(DEGFIELD, "Engineering"), 1, 0),
    i_medicine    = ifelse(str_detect(DEGFIELD, "Medical"),   1, 0),
    i_socialsci   = ifelse(str_detect(DEGFIELD, "Social Sciences"), 1, 0),
    i_economics  = ifelse(str_detect(DEGFIELDD, "Economics"), 1, 0),
    i_hsdiploma   = ifelse(EDUCD==63, 1, 0),
    i_ged         = ifelse(EDUCD==64, 1, 0),
    i_associates  = ifelse(EDUCD==81, 1, 0),
    i_bachelors   = ifelse(EDUCD==101, 1, 0),
    i_masters     = ifelse(EDUCD==114, 1, 0),
    i_doctorate   = ifelse(EDUCD==116, 1, 0),
  ) %>%
  select(STATEFIP, AGE, INCTOT, school, starts_with("i_")) %>%
  slice_sample(n=100000)

write_csv(ACS2022_data, file = "./data/ipums_2022.csv")
