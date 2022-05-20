state = read.csv("/Users/tanmaybirar/Downloads/winter.csv")
library(tidyverse)
summary(state)

head(state %>% arrange(desc(order_amount)))

#From the summary here, it is observed that the Mean order amount happens to be 3145. This is unreasonable for an average order of sneakers.
#This issue stems from the fact that the Mean of the column (order_amount) is determined using the wrong formula here.


#Possible fixes:

state_2 = state[,c('shop_id', 'order_amount', 'total_items')]
state_2$mean_amount = state_2$order_amount / state_2$total_items
mean(state_2$mean_amount)
state_2 %>% arrange((mean_amount))SS
summary(state_2$mean_amount)

#it can be observed here that the highest mean amount happens to be in the case of shop id 78. This could be a likely outlier skewing the data distribution and influencing the mean. 

ggplot(state_2, aes(, mean_amount)) +
    ylab("Average Order Value") +
    geom_boxplot(outlier.colour = "#611f1f") + 
    coord_trans(y="sqrt") + 
    scale_y_continuous()
#It can be inferred from the boxplot that the presence of two outliers shop_id 42 along with 78 is influencing the data distribution.
#The problem likely seems to be that the total_items to be mistakenly entered as for an entire manifest and not the count of individual items in that manifest

#the true mean amount can ve determined if the outliers shop 42 and 78 are not included in the analysis.

state_2 = subset(state_2, shop_id!=c(78,42))
summary(state_2)

#The metric which should be used instead is Median. Median stays significantly less affected by extreme values than the mean.

