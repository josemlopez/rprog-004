getmonitor <- function(id, directory, summarize=FALSE){
    ## 'id' is a vector of length 1 indicating the monitor ID
    ## number. The user can specify 'id' as either an integer, a
    ## character, or a numeric.

    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'summarize' is a logical indicating whether a summary of
    ## the data should be printed to the console; the default is
    ## FALSE

    while(nchar(id) < 3){
        id <- paste('0',id,sep="")
    }
    file_path = paste(directory,'/',id,'.csv', sep="")
    data = read.csv(file_path)
    if(summarize){
        print(summary(data))
    }
    data
}