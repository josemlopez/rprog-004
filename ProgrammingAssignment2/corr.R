corr <- function(directory, threshold = 0) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations

	data = complete(directory)
	measures = data[data$nobs > threshold, ]$id

	##Define a function to make the correlation between the rows desired
	calculate.cor = function(measure) {
		measures_ok = complete.cases(measure)
		cor(measure[measures_ok, ]$sulfate, measure[measures_ok, ]$nitrate)
	}

	above.threshold = lapply(measures, getmonitor, directory = directory)
	sapply(above.threshold, calculate.cor)
}

