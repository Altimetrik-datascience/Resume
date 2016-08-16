## First Test for Feature Extraction

setwd("C:/Users/anaskar/Desktop/HR_Analytics/code")

#######################################################################

## Extract only tables from the Resume.

library(docxtractr)
real_world <- read_docx("36_Vinayak_Altimetrik-02Jul2014.docx")
real_world
tbls <- docx_extract_all_tbls(real_world)
tbls
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
class(project6)


##########################################################

## Extract full text through XML

uzfil <- unzip("36_Vinayak_Altimetrik-02Jul2014.docx")
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
final
class(final)
df <- xmlToDataFrame(final)
############################################################

which(df$text == "Profile Summary"):which(df$text == "Academics")

which(df$text == "Trainings Attended"):which(df$text == "Personal Information")

which(df$text == "Personal Information"):nrow(df)

#############################################################
h <- as.character(df[2:4,1])
h
## Make multiple charecter to one charecter String.
paste(h, collapse = '')
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
