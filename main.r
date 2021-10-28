
library( survey )
library( stats )
library( Hmisc )
library( foreign )
rm( list=ls() )


###########################################

# set working directory
setwd( "fill in path" )

# run this to create designs
source("./load_data.r")

# run this to load functions
source("./functions4test.r")


###########################################

# create vector of names of designs
designj <- ls()[grepl("^des\\d{2}$", ls())]

# create vector of names of 0/1 diagnosis variables
diavarbij <- ls()[grepl("^diabi\\d{2}[[:punct:]]", ls())]


###########################################

yearest(diavarbij, designj)
diabilist <- yearest(diavarbij, designj)
do.call(rbind, diabilist)





