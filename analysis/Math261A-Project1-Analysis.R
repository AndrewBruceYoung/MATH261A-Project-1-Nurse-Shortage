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

# create linear model
m1 <- lm(gap_pct ~ est_population, data = cleaned_data)
summary(m1)

# plot scatter plot along with linear regression line
ggplot(cleaned_data, aes(x = est_population, y = gap_pct)) +
  geom_point(alpha = 0.85) +
  geom_smooth(method = "lm", se = TRUE) +
  scale_x_continuous(
    labels = scales::label_number(scale_cut = scales::cut_short_scale())
  ) +
  labs(
    title = "Projected RN Shortage Gap Percentage vs Population",
    x = "Population",
    y = "RN Gap Percent"
  ) +
  theme_minimal()

# Diagnostics
par(mfrow = c(1,2))
plot(m1, which = 1)
plot(m1, which = 2)
par(mfrow = c(1,1))
