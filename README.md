# MATH261A-Project-1-Nurse-Shortage

**Author:** Andrew Young  
**Course:** MATH261A  
**Submission date:** 2025-09-24

## Overview

This project explores whether population size predicts the projected RN shortage gap percentage across California. I used the 2025 Registered Nurse Shortage Areas (RNSA) dataset provided by California’s Department of Health Care Access and Information (HCAI) through the California Open Data Portal. I fit a simple OLS regression of `gap_pct` on `est_population`, reported the fitted relationship and model diagnostics, and discussed limitations and extensions.

### Repository structure

analysis/
- Math261A-Project1-Analysis.R # data import, cleaning, model fit, plots

data/
- 2025-registered-nurse-shortage-areas-raw.csv # raw data file acquired from CA.gov
- 2025-registered-nurse-shortage-areas-cleaned.csv # cleaned data file

paper/
- Math261A-Project1-Paper.Rmd # paper source
- Math261A-Project1-Paper.pdf # knitted paper 
- references.bib # BibTeX references

README.md

.gitignore

### External Sources

https://data.ca.gov/dataset/registered-nurse-shortage-areas-in-california # for data

https://www.rdocumentation.org/ # for coding help

https://stackoverflow.com/questions # for coding help

### License statement

The dataset is provided via the California Open Data Portal, which lists a license for each resource on the landing page.
