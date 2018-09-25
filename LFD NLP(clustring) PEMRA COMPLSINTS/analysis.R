library(dplyr)
library(ggplot2)
df <- read.csv('nlp_clusters_3.csv', sep = '|')
a <- ggplot(df, aes(x = Month.and.Year, fill = word.list)) +
  geom_bar(position=position_dodge()) +
  theme(
    axis.text.x  = element_text(angle=90),
    legend.position = c(0.3,0.8),
    panel.grid.major = element_line(colour = "grey80", size = 0.5))
ggsave("R_plot_1.png", width = 15,height = 7)
a
######################################################################################################################
# min_hundred <- df %>%
#   group_by(Channel.name) %>%
#   summarise(count = n()) %>%
#   filter(count > 99)
# b <- ggplot(df, aes(x = word.list, fill = Month.and.Year)) + 
#   geom_bar(position=position_dodge()) +
#   theme(
#     legend.box = "h",
#     axis.text.x  = element_text(angle=40, size = 12),
#     # legend.position = c(0.3,0.8),
#     panel.grid.major = element_line(colour = "grey80", size = 0.5))
# b
# ggsave("R_plot_2.png", width = 15,height = 10)
######################################################################################################################
# may_2018 <- df[df$Month.and.Year == 'May 2018',]
# c <- ggplot(may_2018, aes(x = word.list, fill = Channel.name)) +
#   geom_bar(position=position_dodge()) +
#   theme(
#     legend.box = "v",
#     axis.text.x  = element_text(angle=40, size = 12))#,
#     # legend.position = c(0.3,0.8),
#     # panel.grid.major = element_line(colour = "grey80", size = 0.5))
# ggsave("R_plot_3.png", width = 15,height = 10)
# c