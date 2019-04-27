#the purpose of this script is to 1) understand the correlation between county level
#vulnerability and rooftop solar energy production potential in Texas
#and 2) understand the correlation between county level vulnerability and 
#the amount of buildings with rooftop solar potential in Texas
#we will first import and clean data
svi_raw<-read.csv("~/Github/THA4_DataMgmt/Texas_COUNTY.csv", header=TRUE,na.strings="")
head(svi_raw)
pv_lmi_raw<-read.csv("~/Github/THA4_DataMgmt/pv_rooftop_county_lmi_pct_gwh.csv", header = TRUE,na.string="")
head(pv_lmi_raw)
#filter pv_lmi to include only TX counties
#load tidyverse before filtering
library(tidyverse)

#filter so only contains TX county values
pv_lmi_tx_v1<-filter(pv_lmi_raw,pv_lmi_raw$state_abbr=="TX")

head(pv_lmi_tx_v1)
#We are only interested in the pcnt gwh which 
#is the percentage of total energy production that rests on LMI households
#use data.frame to slect those variables

pv_lmi_v2<-data.frame(pv_lmi_tx_v1$name,pv_lmi_tx_v1$state_abbr,pv_lmi_tx_v1$lmi_pct_gwh,pv_lmi_tx_v1$lmi_pct_bldg)

#now lets clean up svi dataset
#svi_raw only contains TX county data

svi_v1<-data.frame(svi_raw$ST_ABBR,svi_raw$COUNTY,svi_raw$RPL_THEMES)

#Raname variable/column headings to intuitive for svi and pv_lmi

svi_v1_headr<-c("state","cnty","svi_score")
names(svi_v1)<-svi_v1_headr

pv_lmi_headr<-c("cnty","state","lmi_pcnt_pv_potential","lmi_pcnt_bldgs")
names(pv_lmi_v2)<-pv_lmi_headr


#now merge the datasets
#all.y=True ensures that only observations with matches are included in new dataset
svi_pv_lmi_v1<-merge(x=svi_v1,y=pv_lmi_v2,by="cnty",all.y=TRUE)

#check datatype to ensure svi_score, lmi_pcnt_bldg, and lmi_pcnt_pv_potential
str(svi_pv_lmi_v1)

#correlation and correlation test 1) svi and potential
cor.test(svi_pv_lmi_v1$svi_score,svi_pv_lmi_v1$lmi_pcnt_pv_potential)

#Results show that there is a moderate positive correlation r=0.52 
#Correlation between the social vulnerability index and the percentage of pv solar 
#energy potential on lmi resdidantial buidings p value<<<0.05 which is significant

#export correlation
write.csv(cor(svi_pv_lmi_v1$svi_score,svi_pv_lmi_v1$lmi_pcnt_pv_potential),
          file="corr_svi_potential.csv")



#correlation and correlation test 2) svi and bldg
cor.test(svi_pv_lmi_v1$svi_score,svi_pv_lmi_v1$lmi_pcnt_bldgs)

#Results show that there is a moderate positive correlation r=0.52 
#Correlation between the social vulnerability index and the percentage of lmi resdidantial
#buidings suitable for pv solar. p value<<<0.05 which is significant

#export correlation
write.csv(cor(svi_pv_lmi_v1$svi_score,svi_pv_lmi_v1$lmi_pcnt_bldgs),file="corr_svi_bldgs.csv")
