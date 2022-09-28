library(dplyr)

df_final <- read.csv("final_data.csv")

# Removing data for 1st of January as it is a public holiday. 
df_final<-subset(df_final, Date!="01.01.2019")

# Line 63, 230, 666 are fake lines. These lines are in the data for testing purpose
df_final<-subset(df_final, Line!=63)
df_final<-subset(df_final, Line!=230)
df_final<-subset(df_final, Line!=666)

# This stops are non existent. In the data set for testing purpose  
new_data <- filter(df_final, Stop=="Auf d?r Lieth")
df_final<-subset(df_final, Stop!="Legoland")
df_final<-df_final[!(df_final$Stop=="Semperoper" | df_final$Stop=="Eiffelturm" | df_final$Stop=="Kolosseum"),]
df_final<-subset(df_final, Pattern!="42/420 HennebergstraÃYe -> Sprangerweg")

# Delay in the "Betreibshof" ( the depo) is not that important
df_final<-su?set(df_final, Stop!="Betreibshof")
filter(df_final, Stop=="Betreibshof")


df_copy_cln <-select(df_final, -DT_actdpt, -DT_schdpt, -Direction, -Date, -Stop.no, -Sched..arr, -Sched..dep, -Actual.dep, -date, -time)
filter(df_final, Line==230)
write.csv(df_copy_cln, "final.csv", row.names=FALSE)
