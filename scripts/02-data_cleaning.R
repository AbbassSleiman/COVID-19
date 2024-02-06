#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(data.table)

#### Clean data ####
raw_region_data <- read_csv("inputs/data/region_data.csv")
country_region_data <- read_csv("inputs/data/country_region.csv")

cleaned_region_data <-
  raw_region_data |>
  janitor::clean_names() |>
  rename(
    covid_score = c1m_school_closing 
  ) |>
  mutate(date = ymd(date)) |>
  filter(year(date) != 2022) |>
  select(
    country_name,
    region_name,
    date,
    covid_score
  ) |>
  mutate(
    country_name = gsub("Faeroe Islands", "Faroe Islands", country_name)
  )

cleaned_region_data <- as.data.table(cleaned_region_data)
country_region_data <- as.data.table(country_region_data)

setkey(cleaned_region_data, country_name)
setkey(country_region_data, country_name)

cleaned_region_data <- country_region_data[cleaned_region_data, .(country_name, region_name, date, covid_score), on = "country_name", nomatch = 0]

cleaned_region_data <- as.data.frame(cleaned_region_data)

#### Save data ####
fwrite(cleaned_region_data, "outputs/data/cleaned_region_data.csv", row.names = FALSE)
