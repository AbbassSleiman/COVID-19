#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: Download scores_lm_demographics.dta from 
# https://www.openicpsr.org/openicpsr/project/193523/version/V1/view
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(haven)
library(tidyverse)
library(usethis)
library(gitcreds)

#### Download data ####
test_scores_data <- read_dta(here::here("inputs/data/scores_lm_demographics.dta"))

#### Save data ####
write_csv(test_scores_data, "inputs/data/scores_lm_demographics.csv") 

         
