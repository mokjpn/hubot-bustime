
bus <- read.csv("Bus.csv", stringsAsFactors=FALSE)
Buson <- list()
for( time in 6:23) {
  for(r in 1:nrow(bus)) {
    tbl <- as.character(bus[r,paste("X",time,sep="")])
    if(is.na(tbl)) next
    stp <- bus[r, "Stop"]
    dest <- bus[r, "Dest"]
    buses <- strsplit(tbl, " +")[[1]]
    if(length(buses) > 0) {
      for(abus in buses) {
        if(abus == "") next
        bust <- paste(time, abus,sep=":")
        b <- list(Stop=stp, Dest=dest)
        if(is.null(Buson[[bust]])) Buson[[bust]] <- list(b)
        else Buson[[bust]] <- append(Buson[[bust]],list(b))
      }
    }
  }
}

