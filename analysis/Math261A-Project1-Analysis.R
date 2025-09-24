library(readr)
library(dplyr)
library(janitor)
library(ggplot2)

# reading file

df <- read_csv("data/2025-registered-nurse-shortage-areas-raw.csv" , show_col_types = FALSE, trim_ws = TRUE) |>
  clean_names() |>
  remove_empty("cols") |>
  mutate(
    gap_pct        = readr::parse_number(gap_percent),
    est_population = as.numeric(est_population)
  )
