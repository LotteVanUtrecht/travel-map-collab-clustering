weights = setNames(coalesced_data$Count,coalesced_data$`Subdivision ID`)

clusters <- hclust(distance_matrix, 
                   method = "average",
                   memb =  weights) #this weighs by # of visitors

plot(clusters)

cutree(clusters,k=20) %>% sort()
