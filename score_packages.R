library(dplyr)
library(riskmetric)

# installed packages
ip <- read.csv('data/R361_installed_packages.csv', stringsAsFactors = FALSE)

# score packages
sp <- pkg_ref(ip$Package) %>%
  as_tibble() %>%
  pkg_assess() %>%
  pkg_score()

write.csv(sp, file = 'data/R361_scored_packages.csv')
