###import packages
library(tidyverse)
#install.packages("WeightedCluster")
library(WeightedCluster)
#install.packages("reshape2")
library(reshape2)

###import data

coalesced_data <- read_csv("#travel-map-collab, April 2023 - All subdivisions visited.csv") %>% 
  filter(Count>100) %>% 
  rename("X3"=Visitors) %>% 
  transmute(`Subdivision ID`=`Subdivision ID`,
            Count=Count,
            visitors=across(starts_with("X"),as.character))
