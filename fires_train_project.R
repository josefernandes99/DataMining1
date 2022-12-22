library(readr)
library(tibble)
library(dplyr)

#import dataset
ft <- readr("fires_train.csv")


#PRE-PROCESSING STEPS
#functions

#convert date to 
function(x) as.integer(strsplit(as.character(x),"[ ]")[[1]][1])
#convert date to year
convertDate2Year <- function(x) as.integer(strsplit(as.character(x), "[-]")[[1]][1])
#convert date to month
convertDate2Month <- function(x) as.integer(strsplit(as.character(x), "[-]")[[1]][2])
#convert date to day
convertDate2Day <- function(x) as.integer(strsplit(as.character(x), "[-, ]")[[1]][3])
#convert degree:minute:second or degreeºminute'second'' to decimal degree
function(x) {
  if(strsplit(as.character(x),"[:]")[[1]][1] == "00"){
    a = strsplit(as.character(x),"[:]")[[1]][2]
    b = strsplit(as.character(x),"[:,.]")[[1]][3]
    x = paste(a,b,"00",sep=":")
  }
}

convertDMS2DD <- function(x) as.double(strsplit(as.character(x),"[º,\',:]")[[1]][1]) 
                  + as.double(strsplit(as.character(x),"[º,\',:]")[[1]][2])/60 
                  + as.double(strsplit(as.character(x),"[º,\',:]")[[1]][3])/3600

#add interval since the first intervention till extinction column
intervFT2E <- depr_df %>% 
  mutate( 
    time_fInterv_to_extin = )


