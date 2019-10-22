# Pat Byrne

library(tidyverse)
library(here)
library(janitor)

db <- read_csv(here('data','disease_burden.csv')) %>% 
  clean_names() %>% 
  rename(death_rate = death_rate_per_100_000)

db.sub <- db %>% 
  filter(country_name %in% c('United States', 'Japan', 'Afghanistan', 'Somalia')) %>% 
  filter(age_group == '0-6 days', sex == 'Both')

ggplot(data = db.sub, aes(x = year, y = death_rate)) +
  geom_line(aes(lty = country_name))
  
ggsave(here('finalgraphs', 'disease_graph.png'))