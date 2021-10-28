
yearest <- function( diagnosis, yeardesign, stringsub = "one == 1"){

	diagnosis <- sapply( diagnosis, function(j) j)

	yeardesign <- sapply( yeardesign, function(j) j)

	stiringsub <- paste0("age < 65 & ", srtingsub)
	
	lapply(diagnosis, function(i){
	
		x <- do.call(rbind, 
			lapply(yeardesign, function(j){
				as.data.frame(eval(bquote(
					svymean(~.(as.name(i)),
					subset(get(j), eval(parse(text=stringsub))),
					na.rm=T)
				)))
			})
		)
		
		y <- do.call(rbind,
			lapply(yeardesign, function(j){
				as.data.frame(eval(bquote(
					unwtd.count( ~.(as.name(i)),
					subset( get(j), eval(parse( text=stringsub))),
					na.rm=T)
				)))
			})
		)
		
		merge(x, y, by=0, all=TRUE)
		
	})
	
}

