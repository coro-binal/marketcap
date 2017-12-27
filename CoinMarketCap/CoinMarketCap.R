############################################
# HowTo get cryptocoin market capitalization
############################################
# Copyright:
# B2B.Web.ID, 2017
############################################

############################################
# Library
############################################
library(XML)
library(RCurl)
library(rlist)
library(dplyr)
library(stringr)

############################################
# Function
############################################
marketCap <- function(coinName) {
  coinURL <- paste("https://coinmarketcap.com",
                   "currencies", coinName, "",
                   sep="/")
  theurl <- getURL(coinURL, .opts = list(ssl.verifypeer = FALSE) )
  tables <- readHTMLTable(theurl)
  tables <- list.clean(tables, fun = is.null, recursive = FALSE)
  n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
  
  Market <- tables[["markets-table"]]
  Market$Price_USD <- as.numeric(str_extract_all(Market$Price,"\\(?[0-9,.]+\\)?"))
  Market$Volume_24h <- as.numeric(gsub(",","",
                                       str_extract_all(Market$`Volume (24h)`,
                                                       "\\(?[0-9,.]+\\)?")))
  Market$Date <- Sys.time()
  Market
}

############################################
# Get the market data based on coin name
############################################
BTC_Market <- marketCap("bitcoin")
BCH_Market <- marketCap("bitcoin-cash")
BTG_Market <- marketCap("bitcoin-gold")
ETH_Market <- marketCap("ethereum")
ETC_Market <- marketCap("ethereum-classic")
LTC_Market <- marketCap("litecoin")
NXT_Market <- marketCap("nxt")
WAVES_Market <- marketCap("waves")
XLM_Market <- marketCap("stellar")
XRP_Market <- marketCap("ripple")
XZC_Market <- marketCap("zcoin")

############################################
# Save
# file=Sys.time()
############################################
x <- str_extract_all(Sys.time(),
                     "\\(?[0-9]+\\)?")[[1]]
filename <- paste(x, collapse="")
save.image(file=paste(filename, "RData",
                      sep="."))
