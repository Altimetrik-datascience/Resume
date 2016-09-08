setwd("C:/Users/anaskar/Desktop/HR_Analytics/tutorial/document/clean/New folder")

tech <- read.csv("technology.csv")

tech$X <- NULL
tech$Freq <- NULL
tech$a <- as.character(tech$a)

tech <- strsplit(as.character(tech$a),'/')
out <- lapply(tech, FUN=function(x) c(unlist(x), rep(NA, max(lengths(tech))-length(x))))
#tech <- as.data.frame( cbind(df$Value,do.call(rbind, out)))
tech <- t(data.frame(out))
rownames(tech) <- NULL
tech <- as.data.frame(tech)

z1 <- as.data.frame(tech$V1)
z2 <- as.data.frame(tech$V2)
z3 <- as.data.frame(tech$V3)
z4 <- as.data.frame(tech$V4)
z5 <- as.data.frame(tech$V5)
z6 <- as.data.frame(tech$V6)
z7 <- as.data.frame(tech$V7)
z8 <- as.data.frame(tech$V8)

colnames(z1)[1] <- "v" 
colnames(z2)[1] <- "v" 
colnames(z3)[1] <- "v" 
colnames(z4)[1] <- "v" 
colnames(z5)[1] <- "v" 
colnames(z6)[1] <- "v" 
colnames(z7)[1] <- "v" 
colnames(z8)[1] <- "v" 

tech <- rbind(z1,z2,z3,z4,z5,z6,z7,z8)

tech <- na.omit(tech)

tech1 <- as.data.frame(tech[16:36,])
colnames(tech1)[1] <- "v"
#--------------------------------------------------------------------------------
tech1$g_search <- paste0(tech1$v," wiki")
#################################################################################
########## Google Search ...  ###################################################                    #
#################################################################################

library(XML)
library(RCurl)
getGoogleURL <- function(search.term, domain = '.co.in', quotes=TRUE) 
{
  search.term <- gsub(' ', '%20', search.term)
  if(quotes) search.term <- paste('%22', search.term, '%22', sep='') 
  getGoogleURL <- paste('http://www.google', domain, '/search?q=',
                        search.term, sep='')
}

getGoogleLinks <- function(google.url) {
  doc <- getURL(google.url, httpheader = c("User-Agent" = "R
                                           (2.10.0)"))
  html <- htmlTreeParse(doc, useInternalNodes = TRUE, error=function
                        (...){})
  nodes <- getNodeSet(html, "//h3[@class='r']//a")
  return(sapply(nodes, function(x) x <- xmlAttrs(x)[["href"]]))
}

#search.term <- 'sap wiki'
#quotes <- "FALSE"
#search.url <- getGoogleURL(search.term=search.term, quotes=quotes)

#links <- getGoogleLinks(search.url)
#links[which(grepl("wikipedia",links))[1]]
##...............................................................................
mylist <- list()
for(i in 1:nrow(tech1)){
  search.term <- tech1[i,2]
  quotes <- "FALSE"
  search.url <- getGoogleURL(search.term=search.term, quotes=quotes)
  links <- getGoogleLinks(search.url)
  tech1[i,3] <- links[which(grepl("wikipedia",links))[1]]
}

tech1$V3 <- gsub(".*q=|&.*", "", tech1$V3)
#-----------------------------------------------------------------------
library(rvest)
library(stringr)

htmlpage <- read_html("https://en.wikipedia.org/wiki/Adobe_Photoshop")
namehtml <- html_nodes(htmlpage,"#firstHeading")
name <- html_text(namehtml)
#-----------------------------------------------------------------------

library(rvest)
library(stringr)

for(i in 1:nrow(tech1)){
  htmlpage <- read_html(tech1[i,3])
  namehtml <- html_nodes(htmlpage,"#firstHeading")
  tech1[i,4] <- html_text(namehtml)
}
tech1$V5 <- tech1$v
