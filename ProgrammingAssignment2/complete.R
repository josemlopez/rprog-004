complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
	pollutantData<-data.frame()
	fileData<-data.frame()
	#pollutantData<-c("id", "nobs")
  for(file in rep(id)){
		fileData<-read.table(paste(directory,"/",sprintf("%03d", file),".csv",sep=""),sep=",",header=TRUE)
		pollutantData<-rbind(pollutantData, c(file,sum(complete.cases(fileData))))
		
	}
	colnames(pollutantData)<-c("id","nobs")
	pollutantData
}