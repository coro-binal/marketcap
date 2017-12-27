############################
# HowTo get currency USD/IDR
############################
# References:
# - Bloomberg
# - Reuters
############################
# Copyright:
# B2B.Web.ID, 2017
############################

############################
# Library
############################
library(XML)
library(RCurl)
library(rvest)

############################
# Function
############################
getPriceUSDIDR <- function(curURL, idClass) {
  theurl <- getURL(curURL, .opts = list(ssl.verifypeer = FALSE) )
  page <- read_html(theurl)
  listings <- html_nodes(page, css = idClass)
  prices <- as.numeric(gsub('[^0-9.]', '', listings))
  prices_fix <- na.omit(ifelse(prices > 100000, prices %% 100000, prices))
  prices_fix
}

############################
# Fetch
############################
# Get from bloomberg
price_bloomberg <- getPriceUSDIDR("https://www.bloomberg.com/quote/USDIDR:CUR",
                                  ".price")
# Get from reuters
price_reuters <- getPriceUSDIDR("https://www.reuters.com/finance/currencies/quote?destAmt=&srcAmt=1.00&srcCurr=USD&destCurr=IDR",
                                ".small2")
