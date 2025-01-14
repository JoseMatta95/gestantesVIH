install.packages("gtsummary")

library(here)
library(tidyverse)
library(haven)
library(gtsummary)
library(survey)
library(RColorBrewer)
library(sf)
library(readr)
library(dplyr)

violence <- read_sav("2020/REC84DV.sav")
sociodemo <- read_sav("2020/REC0111.sav")
vih1 <- read_sav("2020/RE758081.sav")
vih2 <- read_sav("2020/REC91.sav")
gestacion1 <- read_sav("2020/RE223132.sav")
gestacion2 <- read_sav("2020/REC94.sav")
programas <- read_sav("2020/Programas Sociales x Hogar.sav")

violence <- select(violence,ID1,CASEID,D101A:D101F,D104,D106,D107,D108)
sociodemo <- select(sociodemo,ID1,CASEID,HHID,V001:V007,Q105DD,V009,V010:V012,V024,V025,V103:V106,V150:V152,V155,UBIGEO,V022,V005,V005A,V190,V191,NCONGLOME)
vih1 <- select(vih1,ID1,CASEID,V750,V751,V754BP:V754WP,V756,V761,V762AA:V762AZ,V763A:V763C,V766A,V766B,V768A,V769,V770,V781,V784A:V784X,V785,V820,V828,V830,V834A,V835A,V836)
vih2 <- select(vih2,ID1,CASEID,SREGION,S108N,S229B1,S512C,S621,S704N,S802,S802D:S802I,S803AF,S803AG,S803AM,S804A,S804C,S815AA:S815AZ,S816AA:S816AZ,S817,S1002C:S1002E,S1012B,S1012BN)
gestacion1 <- select(gestacion1,ID1, CASEID, V201, V208, V209, V210, V211, V213, V225, V312)
gestacion2 <- select(gestacion2, ID1, CASEID, S410B, S411H, S411EA)
df = merge(x=vih2,y=gestacion2,by="CASEID",all=TRUE)
ENDES_2020 = merge(merge(merge(merge(merge(merge(vih2,sociodemo,by=c("CASEID","ID1"),all=TRUE),vih1,by=c("CASEID","ID1"),all=TRUE),violence,by=c("CASEID","ID1"),all=TRUE),gestacion1,by=c("CASEID","ID1"),all=TRUE),gestacion2,by=c("CASEID","ID1"),all=TRUE),programas,by=c("HHID","ID1"),all = TRUE)




