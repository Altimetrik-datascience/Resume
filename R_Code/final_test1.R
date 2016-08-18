setwd("C:/Users/anaskar/Desktop/HR_Analytics/code")

#######################################################################

Resume_name <- "1337-Ravin Mukeshkumar Resume.docx"

## Extract only tables from the Resume.

library(docxtractr)
real_world <- read_docx(Resume_name)
real_world
tbls <- docx_extract_all_tbls(real_world)
#tbls
class(tbls)

##################################################

## Create separate dataframe for each table

## Academics...******
Academics <- as.data.frame(tbls[[1]])
colnames(Academics)[1] <- "Degree/ Education"
colnames(Academics)[2] <- "Specialization"
colnames(Academics)[3] <- "Institute / University Name"
colnames(Academics)[4] <- "Details (Years)"
ncol(Academics)
Academics[nrow(Academics),2] <- "Not Mentioned"

## Technical Expertise...******
Technical_Expertise <- as.data.frame(tbls[[2]])

## Technology Known...******
Technology_known <- as.data.frame(tbls[[3]])
colnames(Technology_known)[1] <- "Technology"
colnames(Technology_known)[2] <- "Details"
colnames(Technology_known)[3] <- "Experience (No. of Months)"

## Technical/ Professional Certifications...******
Certification <- as.data.frame(tbls[[4]])
colnames(Certification)[1] <- "Certification"
colnames(Certification)[2] <- "Institute Name"
colnames(Certification)[3] <- "Year of Completion"

## Employment History...******
Employment <- as.data.frame(tbls[[5]])
colnames(Employment)[1] <- "Company Name"
colnames(Employment)[2] <- "Designation"
colnames(Employment)[3] <- "Start date"
colnames(Employment)[4] <- "End date"

## Project Details...

## Calculate total no. of projects.
no_of_project <- length(tbls)-5

## All project data frame...******
for(i in 1:no_of_project){
  
  assign(paste("project", i, sep = ""), 
         (as.data.frame(tbls[i+5])))
  print(paste("project",i,sep = ""))
}



##########################################################

## Extract full text through XML

uzfil <- unzip(Resume_name)
str(uzfil)
uzfil
uzfil[1]
library(XML)
#xtext <-  xmlTreeParse(uzfil[4], useInternalNodes = TRUE) 
#library("methods")
text <- xmlParse(uzfil[4])
#class(text)

##########################################################
final <- getNodeSet(text, "/w:document/w:body/w:p/w:r/w:t")
#final
class(final)
df <- xmlToDataFrame(final)

############################################################

## Extract all text..

## Profile Summary...******
profile_summary_row <- (which(df$text == "Profile Summary")+1 ): (which(df$text == "Academics")-1)

char <- as.character(df[profile_summary_row,1])
profile_summary <- paste(char, collapse = '')


## Training Attended...******
training_row <- (which(df$text == "Trainings Attended")+1 ): (which(df$text == "Personal Information")-1)

tr_char <- as.character(df[training_row,1])
Training_Attended <- paste(tr_char, collapse = '')

## Personal Information...******
presonal_row <- (which(df$text == "Personal Information")+1):(nrow(df))
personal_char <- as.character(df[presonal_row,1])
Personal_information <- paste(personal_char, collapse = '')
#df_pub$geoip_country_name <- gsub(".*, country_name = \\s*|, continent_code.*", "", df_pub$geoip)

Father_Name <- gsub(".*Name :\\s*|Date of Birth :.*", "", Personal_information)
Date_of_Birth <- gsub(".*Birth :\\s*|Permanent Address:.*", "", Personal_information)
Permanent_Address <- gsub(".*Address:\\s*|Contact Numbers:.*", "", Personal_information)
Contact_Number <- gsub(".*Numbers:\\s*|Languages Known:.*", "", Personal_information)
Language_Known <- gsub(".*Languages Known:\\s*|$.*", "", Personal_information)


##### ****************************************************** #####
## Genarate Name Field ...
##### ****************************************************** #####

#te <- xmlParse(uzfil[5])
#f <- xmlToList(te)
##...******
#Name <- f$p$r$t

##-------------------------------------------------------------------
### Header...
##-------------------------------------------------------------------

head <- xmlParse(uzfil[7])
l <- xmlToList(head)
#l
header <- getNodeSet(head, "/w:hdr/w:p/w:r/w:t")

header_df <- xmlToDataFrame(header)

Name_header <- header_df[1:nrow(header_df),1]
Name_header <- paste(Name_header, collapse = '')

##-------------------------------------------------------------------
## Information...******
##-------------------------------------------------------------------
information <- getNodeSet(text, 
                          "/w:document/w:body/w:p/w:r/mc:AlternateContent/mc:Fallback
                          /w:pict/v:rect/v:textbox/w:txbxContent/w:p/w:r/w:t")
information_df <- xmlToDataFrame(information)

information_tx <- information_df[1:nrow(information_df),1]
information_tx <- paste(information_tx, collapse = '')
##-------------------------------------------------------------------
### Find Current Address and Email Address...
##-------------------------------------------------------------------

# Split String 
part_name <- strsplit(Name_header," ")
# match header name with information name and delete to get current address.
name_no <- list()
for(i in 1:length(part_name[[1]])){
  name_no[[i]] <- (which(grepl(part_name[[1]][i],information_df$text)))
}

name_row <- as.numeric(name_no)
# Find emailaddress...
email_row <- which(grepl("@altimetrik.com",information_df$text))
# Find mobile no.
temp <- gregexpr("[0-9]", information_df$text)
ph_row <- which(as.character(nchar(temp))>22)

no_char_row <- which(!(nchar(as.character(information_df$text))>1))
##****************
## Name...******
Name <- Name_header
## Email Address
email <- information_df[email_row,1]

## Remove Name, Email and phone no and no value row to extract 
information_df <- information_df[-c(name_row,ph_row,email_row,
                                    no_char_row),,drop = FALSE]
rownames(information_df) <- NULL

## Current Address...******
current_address <- information_df[1:nrow(information_df),1]
current_address <- paste(current_address, collapse = '')
