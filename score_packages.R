#Rlibdir <- paste0('./.Rlibs/', R.version$major, substr(R.version$minor, start = 1, stop = 1))
#.libPaths(c(.libPaths(), Rlibdir))

library(dplyr)
library(riskmetric)

# installed packages
#ip <- read.csv('data/R361_installed_packages.csv', stringsAsFactors = FALSE)
ip <- as.data.frame(installed.packages(), stringsAsFactors = FALSE)

# score packages
sp <- pkg_ref(ip$Package) %>%
  as_tibble() %>%
  pkg_assess() %>%
  pkg_score() %>% 
  mutate(risk = summarize_scores(.))

write.csv(sp, file = 'data/R363_scored_packages.csv')
