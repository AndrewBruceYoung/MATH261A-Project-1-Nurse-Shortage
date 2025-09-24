library(readr)
library(dplyr)
library(janitor)
library(ggplot2)

# reading file

df <- read_csv("data/2025-registered-nurse-shortage-areas-raw.csv") %>%
  clean_names() %>%
  remove_empty("cols") %>%
  mutate(
    gap_pct        = readr::parse_number(gap_percent),
    est_population = as.numeric(est_population)
  )

# keeping important columns
cleaned_data <- df %>%
  select(county, est_population, gap_pct, severity, rnsa_designation) %>%
  filter(is.finite(est_population), is.finite(gap_pct))

glimpse(cleaned_data)
