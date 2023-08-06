weights = setNames(coalesced_data$Count,coalesced_data$`Subdivision ID`)

clusters <- hclust(distance_matrix, 
                   method = "average",
                   memb =  weights) #this weighs by # of visitors

plot(clusters)

cluster_data <- coalesced_data[,1]
cluster_data$k10 <- cutree(clusters,k=10)[cluster_data$`Subdivision ID`]
cluster_data$k20 <- cutree(clusters,k=20)[cluster_data$`Subdivision ID`]
cluster_data$k50 <- cutree(clusters,k=50)[cluster_data$`Subdivision ID`]
