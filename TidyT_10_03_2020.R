# Tidy Tuesday Data
library(tidyverse)
library(ggplot2)
library(viridis)
library(ggthemes)
library(wesanderson)

tuition_cost <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-10/tuition_cost.csv')

tuition_income <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-10/tuition_income.csv') 

salary_potential <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-10/salary_potential.csv')

historical_tuition <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-10/historical_tuition.csv')

diversity_school <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-10/diversity_school.csv')

# Twitter Figure

salary_potential <- merge(salary_potential, s_abb, by.x = "state_name", by.y = "state.name")

pal <- wes_palette(name = "Darjeeling1", n = 768, type = "continuous")

ggplot(salary_potential, aes(x = reorder(state.abb, -early_career_pay), 
                             y = early_career_pay, fill = name)) +
  geom_col() +
  theme_tufte() +
  scale_fill_manual(values = pal, aesthetics = "fill") +
  xlab("US States") +
  ylab("Early Career Pay") +
  guides(fill=F) 