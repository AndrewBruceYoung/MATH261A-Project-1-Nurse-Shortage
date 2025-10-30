library(readr)
library(dplyr)
library(janitor)
library(ggplot2)
library(knitr)
library(scales)

#Reading and cleaning
cleaned_data <- read_csv("2025-registered-nurse-shortage-areas-cleaned.csv", show_col_types = FALSE) %>%
  clean_names()

cleaned_data %>%
  summarise(
    n_areas = n(),
    pop_min = min(est_population, na.rm = TRUE),
    pop_median = median(est_population, na.rm = TRUE),
    pop_max = max(est_population, na.rm = TRUE),
    gap_min_pct = min(gap_pct, na.rm = TRUE),
    gap_median = median(gap_pct, na.rm = TRUE),
    gap_max_pct = max(gap_pct, na.rm = TRUE)) %>%
  kable(caption = "Sample size and ranges for population and RN gap percentage.")

# create linear model
dm1 <- lm(gap_pct ~ est_population, data = cleaned_data)
summary(dm1)

# plot scatter plot along with linear regression line
ggplot(cleaned_data, aes(x = est_population, y = gap_pct)) +
  geom_point(alpha = 0.85) +
  geom_smooth(method = "lm", se = TRUE) +
  scale_x_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  labs(x = "Population", y = "RN Gap (%)") +
  theme_minimal()

# Diagnostics
par(mfrow = c(1,1))
plot(dm1, which = 1, sub.caption = "", caption = "Residuals vs Fitted")

par(mfrow = c(1,1))
plot(dm1, which = 2, sub.caption = "", caption = "Normal Q–Q")
