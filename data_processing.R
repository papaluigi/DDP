# LOAD REQUIRED LIBRARIES
require(data.table)
library(dplyr)
library(DT)
library(rCharts)
library(stringi)
library(reshape2)

# READ DATA
data <- fread("./data/etalab-inscriptions-registre-2001-2013.csv")
countries <- fread("./data/sql-pays.csv")
continents <- fread("./data/country_continent.csv")

# CLEAN DATA
setnames(data,1:14,as.character(data[1,]))
setnames(data,"Pays/année", "NAME_FR")

data <- data[!1,]
data <- data[data$NAME_FR!="TOTAL" & data$NAME_FR!="Source : " & data$NAME_FR!="",]

#data <- melt(data, id=c("NAME_FR"), measures.vars=c(2:14))
#setnames(data,"variable", "year")
#setnames(data,"value", "count")

setnames(countries,1:6, c("ID","ISONUM","ISOALPHA2","ISOALPHA3","NAME_FR","NAME_EN"))

setnames(continents, 1:2, c("ISOALPHA2","CONT_NAME"))

countries$NAME_FR <- stri_trans_general(str_to_upper(countries$NAME_FR),"Latin-ASCII")

continents[is.na(continents)] <- "NA"


data <- as.data.frame(data)
data[, 2:14] <- apply(data[, 2:14], 2, function(x) as.numeric(gsub(" ", "", x)))
data[is.na(data)] <- 0

countries <- merge(countries, continents, by="ISOALPHA2")

# THIS IS THE REFERENCE DATASET
data <- merge(data, countries, by="NAME_FR")



#data2 <- as.matrix(data[,2:14])
#row.names(data2) <- data$NAME_EN
#data2 <- t(data2)

data3 <- melt(data, id=c("ID","NAME_FR","NAME_EN","CONT_NAME","ISOALPHA2","ISOALPHA3","ISONUM"), measures.vars=c(2:14))
setnames(data3,"variable", "year")
setnames(data3,"value", "count")

data4 <- ddply(data3,.(year,CONT_NAME),summarise,count=sum(count))
data4 <- dcast(data4, CONT_NAME ~ year)
row.names(data4) <- data4$CONT_NAME
data4 <- as.matrix(data4[,2:14])

