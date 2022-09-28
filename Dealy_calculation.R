library(dplyr)
library(ggplot2)

df <- read.csv('mergedfinal.csv')
head(df)
lapply(df, class)

# Calculation of dalays in minutes

DT_actdpt <- as.POSIXct(as.character(paste(df$Date, df$Actual.dep)), format="%d.%m.%Y %H:%M:%S")
head(DT_actdpt)
DT_schdpt <- as.POSIXct(as.character(paste(df$Date, df$Sched..dep)), format="%d.%m.%Y %H:%M:%S")
head(DT_schdpt)

df$DT_actdpt <- DT_actdpt
df$DT_schdpt <- DT_schdpt

dif_t <- round(as.numeric(difftime(df$DT_actdpt, df$DT_schdpt, units = 'mins')),3)
head(dif_t)


df$delay_mins <- dif_t

head(df)

##########

df <- df[complete.cases(df), ]


################
# Creating a binary column to check if there is actual dealy or not

dif_t_copy <- df$delay_mins

for (i in 1:length(dif_t_copy)){
  if(dif_t_copy[i] > 0){
    dif_t_copy[i] <- 1
  }else{
    dif_t_copy[i] <- 0 
  }
}

head(dif_t_copy)

df$delay <- dif_t_copy

######
df_copy <- df

df_copy <-select(df_copy, -DT_actdpt, -DT_schdpt)
head(df_copy)

write.csv(df_copy, "BusData_Delay.csv", row.names = FALSE)














