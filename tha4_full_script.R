#the purpose of this script is understand the correlation between county level
#vulnerability and rooftop solar in Texas
#we will first import and clean data
svi_raw<-read.csv("~/Github/THA4_DataMgmt/Texas_COUNTY.csv", header=TRUE,na.strings="")

pv_lmi_raw<-read.csv("~/Github/THA4_DataMgmt/pv_rooftop_county_lmi_pct_gwh.csv", header = TRUE,na.string="")

#filter pv_lmi to include only TX counties
#load tidyverse before filtering
library(tidyverse)

#filter so only contains TX county values
pv_lmi_tx_v1<-filter(pv_lmi_raw,pv_lmi_raw$state_abbr=="TX")


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

#correlation and correlation test
cor(svi_pv_lmi_v1$svi_score,svi_pv_lmi_v1$lmi_pcnt_pv_potential)
cor.test(svi_pv_lmi_v1$svi_score,svi_pv_lmi_v1$lmi_pcnt_pv_potential)

cor(svi_pv_lmi_v1$svi_score,svi_pv_lmi_v1$lmi_pcnt_bldgs)
cor.test(svi_pv_lmi_v1$svi_score,svi_pv_lmi_v1$lmi_pcnt_bldgs)