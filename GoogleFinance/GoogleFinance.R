# Library
#########
library(quantmod)
library(stringr)

# Get Stock Daily
#################
getSymbols.google("IDX:ABBA", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:BBKP", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:BBRI", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:BBTN", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:BJTM", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:BUDI", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:BWPT", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:GEMS", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:IPCM", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:JRPT", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:JTPE", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:JRPT", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:SIDO", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:STAR", env=globalenv(),
                  from="2005-04-01")
getSymbols.google("IDX:TRAM", env=globalenv(),
                  from="2005-04-01")

# Save
######
x <- str_extract_all(Sys.time(),
                     "\\(?[0-9]+\\)?")[[1]]
filename <- paste("GFinance",
                  paste(x, collapse=""),
                  sep="_")
save.image(file=paste(filename, "RData",
                      sep="."))
