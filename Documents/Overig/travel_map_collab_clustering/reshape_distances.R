#converts the distances in a nice 

distance_matrix  <- jaccard_distances %>%
  acast(sub1 ~ sub2, value.var = "dist") %>% 
  as.dist()
