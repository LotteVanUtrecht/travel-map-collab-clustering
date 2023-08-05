#define functions

jaccard <- function(a, b) {
  intersection = length(intersect(a, b))
  union = length(a) + length(b) - intersection
  return (intersection/union)
}

jaccard_wrapper <- function(sub1,sub2){
dist = 1 - jaccard(coalesced_data %>% filter(`Subdivision ID`==sub1) %>% pull(visitors) %>% as.character() %>% na.omit(),
        coalesced_data %>% filter(`Subdivision ID`==sub2) %>% pull(visitors) %>% as.character() %>% na.omit())
return (dist)
}

#initialize distances

jaccard_distances <- expand_grid("sub1"=coalesced_data$`Subdivision ID`, "sub2"=coalesced_data$`Subdivision ID`) %>% 
  filter(sub1>=sub2) %>%  #undoubles
  mutate(dist=numeric(1))

#set distances

for (i in 1:nrow(jaccard_distances)) {
  dist <- jaccard_wrapper(jaccard_distances$sub1[i],jaccard_distances$sub2[i])
  
  jaccard_distances$dist[i] <- dist
}

