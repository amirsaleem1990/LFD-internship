df <- read.csv('nlp_clusters_1.csv', sep = '|')
library(tm)
df$Complaint <- as.character(df$Complaint)
df$Channel.name <- as.character(df$Channel.name)

df$Complaint <- removePunctuation(df$Complaint)
df$Channel.name <- removePunctuation(df$Channel.name)
write.table(df, file = "MyData.csv",row.names=FALSE, na="", sep="|")
