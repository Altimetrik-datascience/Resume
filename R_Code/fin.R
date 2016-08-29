rm(list=ls())
setwd("C:/Users/anaskar/Desktop/HR_Analytics/code/R_Code/Final Code/final_code_all/deleted_code/test")
source("tab.R")

library(dplyr)
library(plyr)
library(data.table)

####|-----------------------.
####| Full Project Data...  |
####|-----------------------'

Resume_df <- list()
project_df <- data.frame("NA")
for(i in 1:length(temp)){
  
  #assign(paste0("project_df",i) , data.frame("NA"))
  if(length(get(paste0("projectdata",i))) >20){
    
    for(j in 1:20){
      for(k in 1:length(get(paste0("projectdata",i))[[j]][["V1"]])){
        #d <- paste0("projectdata",i)
        project_df[paste0("project",j,"_",get(paste0("projectdata",i))[[j]][["V1"]][k])] <- get(paste0("projectdata",i))[[j]][["V2"]][k]
        
        Resume_df[[i]] <- project_df
        #Resume_data <- rbind.fill(Resume_df[[i]],Resume_df[[i+1]])
        
      }
    }
    print(paste0("Resume_df","[[",i,"]]"))
    
  }else{
    if(get(paste0("projectdata",i))[[1]][1]=="NULL"){
      project_df <- data.frame(project="NA")
      Resume_df[[i]] <- project_df
    }else{
  for(j in 1:length(get(paste0("projectdata",i)))){
    for(k in 1:length(get(paste0("projectdata",i))[[j]][["V1"]])){
      #d <- paste0("projectdata",i)
      project_df[paste0("project",j,"_",get(paste0("projectdata",i))[[j]][["V1"]][k])] <- get(paste0("projectdata",i))[[j]][["V2"]][k]
      
      Resume_df[[i]] <- project_df
      #Resume_data <- rbind.fill(Resume_df[[i]],Resume_df[[i+1]])
    }
    }
  }
  print(paste0("Resume_df","[[",i,"]]"))
}}

#######################################
Degrees_d <- list()                   #
Specialization_d <- list()            #
University_d <- list()                #
Years_for_Degree_d <- list()          #
technology_known_d <- list()          #
time_for_each_technology_d <- list()  #
Certification_Name_d <- list()        #
Certification_Institute_d <- list()   #
Certification_Year_d <- list()        #
Company_Worked_For_d <- list()        #
Deignation_d <- list()                #
Start_Date_d <- list()                #
End_Date_d <- list()                  #
#######################################
for(i in 1:length(temp)){
  Degrees_d[[i]] <- get(paste0("Degrees_df",i))
  Specialization_d[[i]] <- get(paste0("Specialization_df",i))
  University_d[[i]] <- get(paste0("University_df",i))
  Years_for_Degree_d[[i]] <- get(paste0("Years_for_Degree_df",i))
  technology_known_d[[i]] <- get(paste0("technology_known_df",i))
  time_for_each_technology_d[[i]] <- get(paste0("time_for_each_technology_df",i))
  Certification_Name_d[[i]] <- get(paste0("Certification_Name_df",i))
  Certification_Institute_d[[i]] <- get(paste0("Certification_Institute_df",i))
  Certification_Year_d[[i]] <- get(paste0("Certification_Year_df",i))
  Company_Worked_For_d[[i]] <- get(paste0("Company_Worked_For_df",i))
  Deignation_d[[i]] <- get(paste0("Deignation_df",i))
  Start_Date_d[[i]] <- get(paste0("Start_Date_df",i))
  End_Date_d[[i]] <- get(paste0("End_Date_df",i))
}

####|-----------------------------------.
####| Create Each Column Separately...  |
####|-----------------------------------'

Project_data <- rbind.fill(lapply(Resume_df,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
Name_data <- t(data.frame(Name_Header))
Training_Attended_data <- t(data.frame(Training_Attended))
profile_summary_data <- t(data.frame(profile_summary))
Primary_Skills_data <- t(data.frame(Primary_Skills))
Secondary_Skills_data <- t(data.frame(Secondary_Skills))
information_data  <- t(data.frame(Information))
Personal_data  <- t(data.frame(Personal_information))
Degrees_data <- rbind.fill(lapply(Degrees_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
Specialization_data <- rbind.fill(lapply(Specialization_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
University_data <- rbind.fill(lapply(University_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
Years_for_Degree_data <- rbind.fill(lapply(Years_for_Degree_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
technology_known_data <- rbind.fill(lapply(technology_known_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
time_for_each_technology_data <- rbind.fill(lapply(time_for_each_technology_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
Certification_Name_data <- rbind.fill(lapply(Certification_Name_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
Certification_Institute_data <- rbind.fill(lapply(Certification_Institute_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
Certification_Year_d <- rbind.fill(lapply(Certification_Year_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
Company_Worked_For_data <- rbind.fill(lapply(Company_Worked_For_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
Deignation_data <- rbind.fill(lapply(Deignation_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
Start_Date_data <- rbind.fill(lapply(Start_Date_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))
End_Date_data <- rbind.fill(lapply(End_Date_d,function(y){as.data.frame((y),stringsAsFactors=FALSE)}))


#______________________________________________________________________________
## Refresh row names to sequence
row.names(Name_data) <- NULL;nrow(Name_data)
rownames(Training_Attended_data) <- NULL;nrow(Training_Attended_data)
rownames(profile_summary_data) <- NULL;nrow(profile_summary_data)
rownames(Primary_Skills_data) <- NULL;nrow(Primary_Skills_data)
rownames(Secondary_Skills_data) <- NULL;nrow(Secondary_Skills_data)
rownames(information_data) <- NULL;nrow(information_data)
rownames(Personal_data) <- NULL;nrow(Personal_data)
rownames(Degrees_data) <- NULL;nrow(Degrees_data)
rownames(Specialization_data) <- NULL;nrow(Specialization_data)
rownames(University_data) <- NULL;nrow(University_data)
rownames(Years_for_Degree_data) <- NULL;nrow(Years_for_Degree_data)
rownames(technology_known_data) <- NULL;nrow(technology_known_data)
rownames(time_for_each_technology_data) <- NULL;nrow(time_for_each_technology_data)
rownames(Certification_Name_data) <- NULL;nrow(Certification_Name_data)
rownames(Certification_Institute_data) <- NULL;nrow(Certification_Institute_data)
#rownames(Certification_Year_data) <- NULL;nrow(Certification_Year_data)
rownames(Company_Worked_For_data) <- NULL;nrow(Company_Worked_For_data)
rownames(Deignation_data) <- NULL;nrow(Deignation_data)
rownames(Start_Date_data) <- NULL;nrow(Start_Date_data)
rownames(End_Date_data) <- NULL;nrow(End_Date_data)
nrow(Project_data)
#__________________________________________________________________________________

####|-----------------------------------------------------.
####| Split primary and secondery skill data by comma...  |
####|-----------------------------------------------------'
# Convert matrix to data frame for primary skill and secondery skill...
Primary_Skills_data <- as.data.frame(Primary_Skills_data)
colnames(Primary_Skills_data)[1] <- "Primary_skills"
Secondary_Skills_data <- as.data.frame(Secondary_Skills_data)
colnames(Secondary_Skills_data)[1] <- "secondary_skill"

# Split by comma for primary skill...
Primary <- strsplit(as.character(Primary_Skills_data$Primary_skills),',')
out <- lapply(Primary, FUN=function(x) c(unlist(x), rep(NA, max(lengths(Primary))-length(x))))
Primary_Skills_data_fin <- as.data.frame( cbind(df$Value,do.call(rbind, out)))
#------------------------------------------------------------------------------
# Split by comma for secondery skill
Secondary <- strsplit(as.character(Secondary_Skills_data$secondary_skill),',')
out <- lapply(Secondary, FUN=function(x) c(unlist(x), rep(NA, max(lengths(Secondary))-length(x))))
Secondary_Skills_data_fin <- as.data.frame( cbind(df$Value,do.call(rbind, out)))

# put all splitted data into different column for primary skill...
for(p in 1:ncol(Primary_Skills_data_fin)){
  colnames(Primary_Skills_data_fin)[p] <- paste0("Primary_Skill",p)
  #colnames(Secondary_Skills_data_fin)[p] <- paste0("Secondary_Skill",p)
}
# put all splitted data into different column for Secondery skill...
for(o in 1:ncol(Secondary_Skills_data_fin)){
  colnames(Secondary_Skills_data_fin)[o] <- paste0("Secondary_Skill",o)
  #colnames(Secondary_Skills_data_fin)[p] <- paste0("Secondary_Skill",p)
}

####|----------------------------------------------------------.
####| Create spesific number of column for each data frame...  |
####|----------------------------------------------------------'
# Create Column for primary skill..
p_col <- ncol(Primary_Skills_data_fin)

if(p_col > 50){
  Primary_Skills_data_fin <- Primary_Skills_data_fin[,1:50]
}else{
  for(l in (p_col+1):50){
    p_col <- ncol(Primary_Skills_data_fin)
  Primary_Skills_data_fin[,p_col+1] <- NA
  colnames(Primary_Skills_data_fin)[p_col+1] <- paste0("Primary_Skill",l)
}}

# Create Column for Secondary skill..
n_col <- ncol(Secondary_Skills_data_fin)

if(n_col > 50){
  Secondary_Skills_data_fin <- Secondary_Skills_data_fin[,1:50]
}else{
  for(l in (n_col+1):50){
    n_col <- ncol(Secondary_Skills_data_fin)
    Secondary_Skills_data_fin[,n_col+1] <- NA
  colnames(Secondary_Skills_data_fin)[n_col+1] <- paste0("Secondary_Skill",l)
}}

# Create Column for Degree_data..
d_col <- ncol(Degrees_data)

if(d_col > 10){
  Degrees_data <- Degrees_data[,1:10]
}else{
  for(l in (d_col+1):10){
    d_col <- ncol(Degrees_data)
    Degrees_data[,d_col+1] <- NA
    colnames(Degrees_data)[d_col+1] <- paste0("Degrees",l)
  }}

# Create Column for Specialization_data..
s_col <- ncol(Specialization_data)

if(s_col > 10){
  Specialization_data <- Specialization_data[,1:10]
}else{
  for(l in (s_col+1):10){
    s_col <- ncol(Specialization_data)
    Specialization_data[,s_col+1] <- NA
    colnames(Specialization_data)[s_col+1] <- paste0("Specialization_For_Degree_",l)
  }}

# Create Column for University_data..
s_col <- ncol(University_data)

if(s_col > 10){
  University_data <- University_data[,1:10]
}else{
  for(l in (s_col+1):10){
    s_col <- ncol(University_data)
    University_data[,s_col+1] <- NA
    colnames(University_data)[s_col+1] <- paste0("University",l)
  }}

# Create Column for time_for_each_technology_data..
s_col <- ncol(time_for_each_technology_data)
time_for_each_technology_data$`(y)` <- NULL

if(s_col > 20){
  time_for_each_technology_data <- time_for_each_technology_data[,1:10]
}else{
  for(l in (s_col+1):20){
    s_col <- ncol(time_for_each_technology_data)
    time_for_each_technology_data[,s_col+1] <- NA
    colnames(time_for_each_technology_data)[s_col+1] <- paste0("time_for_each_technology",l)
  }}

# Create Column for technology_known_data..
s_col <- ncol(technology_known_data)
technology_known_data$`(y)` <- NULL

if(s_col > 20){
  technology_known_data <- technology_known_data[,1:10]
}else{
  for(l in (s_col+1):20){
    s_col <- ncol(technology_known_data)
    technology_known_data[,s_col+1] <- NA
    colnames(technology_known_data)[s_col+1] <- paste0("technology_known",l)
  }}

# Create Column for Certification_Name_data..
s_col <- ncol(Certification_Name_data)
Certification_Name_data$`(y)` <- NULL

if(s_col > 10){
  Certification_Name_data <- Certification_Name_data[,1:10]
}else{
  for(l in (s_col+1):10){
    s_col <- ncol(Certification_Name_data)
    Certification_Name_data[,s_col+1] <- NA
    colnames(Certification_Name_data)[s_col+1] <- paste0("Certification_Name",l)
  }}

# Create Column for Certification_Institute_data..
s_col <- ncol(Certification_Institute_data)
Certification_Institute_data$`(y)` <- NULL

if(s_col > 10){
  Certification_Institute_data <- Certification_Institute_data[,1:10]
}else{
  for(l in (s_col+1):10){
    s_col <- ncol(Certification_Institute_data)
    Certification_Institute_data[,s_col+1] <- NA
    colnames(Certification_Institute_data)[s_col+1] <- paste0("Certification_Institute",l)
  }}

# Create Column for Company_Worked_For_data..
s_col <- ncol(Company_Worked_For_data)
#Company_Worked_For_data$`(y)` <- NULL

if(s_col > 10){
  Company_Worked_For_data <- Company_Worked_For_data[,1:10]
}else{
  for(l in (s_col+1):10){
    s_col <- ncol(Company_Worked_For_data)
    Company_Worked_For_data[,s_col+1] <- NA
    colnames(Company_Worked_For_data)[s_col+1] <- paste0("Company_Worked_For",l)
  }}

# Create Column for Deignation_data..
s_col <- ncol(Deignation_data)
#Company_Worked_For_data$`(y)` <- NULL

if(s_col > 10){
  Deignation_data <- Deignation_data[,1:10]
}else{
  for(l in (s_col+1):10){
    s_col <- ncol(Deignation_data)
    Deignation_data[,s_col+1] <- NA
    colnames(Deignation_data)[s_col+1] <- paste0("Deignation_For_Company",l)
  }}

# Create Column for Start_Date_data..
s_col <- ncol(Start_Date_data)
#Company_Worked_For_data$`(y)` <- NULL

if(s_col > 10){
  Start_Date_data <- Start_Date_data[,1:10]
}else{
  for(l in (s_col+1):10){
    s_col <- ncol(Start_Date_data)
    Start_Date_data[,s_col+1] <- NA
    colnames(Start_Date_data)[s_col+1] <- paste0("Start_Date",l)
  }}

# Create Column for End_Date_data..
s_col <- ncol(End_Date_data)
#Company_Worked_For_data$`(y)` <- NULL

if(s_col > 10){
  End_Date_data <- End_Date_data[,1:10]
}else{
  for(l in (s_col+1):10){
    s_col <- ncol(End_Date_data)
    End_Date_data[,s_col+1] <- NA
    colnames(End_Date_data)[s_col+1] <- paste0("End_Date",l)
  }}

#_______________________________________________________________________
####|------------------------------------------------------.
####| Combine All Columns Together except Personal_data... |
####|------------------------------------------------------'

Resume_output <- cbind(Name_data,profile_summary_data,Training_Attended_data,
                       Primary_Skills_data,Secondary_Skills_data,information_data,
                       Personal_data,Degrees_data,Specialization_data,University_data,
                       Years_for_Degree_data,technology_known_data,
                       time_for_each_technology_data,Certification_Name_data,
                       Certification_Institute_data,
                       Company_Worked_For_data,Deignation_data,Start_Date_data,
                       End_Date_data,Project_data)
rownames(Resume_output)  <- NULL
##__________________________________________
#  Certification_Year_data Removed.
##________________________________________

####|---------------------------------------------------------------.
####| Feature Extraction from Personal_data and information_data... |
####|---------------------------------------------------------------'
## Prepare Personal_data Field...
#Resume_output$Personal_data <- gsub("(?<=[a-z0-9])(?=[A-Z])|^|(?=Father's)
#          |(?=Date of Birth)|(?=Permanent Address:)|
#          (?=Contact Numbers)|(?=Passport Number)|(?=PAN Number)|(?=Languages Known)
#          ", "}",Resume_output$Personal_data, perl = TRUE)
#

spl <- strsplit(as.character(Resume_output$Personal_data),":")
#d <- do.call(rbind, spl)

## Personal_data...
no_col <- ncol(Resume_output)
for(i in 1:length(temp)){
  if(length(which(grepl("Father",spl[[i]])))!=0){
  Resume_output[i,(no_col+1)] <- spl[[i]][which(grepl("Father",spl[[i]]))+1]
  }else{Resume_output[i,(no_col+1)] <- NA}
  if(length(which(grepl("Father",spl[[i]])))!=0){
  Resume_output[i,(no_col+2)] <- spl[[i]][which(grepl("Date of Birth|Date Of Birth",spl[[i]]))+1]
  }else{Resume_output[i,(no_col+2)] <- NA}
  if(length(which(grepl("Father",spl[[i]])))!=0){
  Resume_output[i,(no_col+3)] <- spl[[i]][which(grepl("Permanent Address",spl[[i]]))+1]
  }else{Resume_output[i,(no_col+3)] <- NA}
  if(length(which(grepl("Father",spl[[i]])))!=0){
  Resume_output[i,(no_col+4)] <- spl[[i]][which(grepl("Contact Numbe",spl[[i]]))+1]
  }else{Resume_output[i,(no_col+4)] <- NA}
  if(length(which(grepl("Father",spl[[i]])))!=0){
  Resume_output[i,(no_col+5)] <- spl[[i]][which(grepl("Languages Known",spl[[i]]))+1]
  }else{Resume_output[i,(no_col+5)] <- NA}
  #Resume_output[i,269] <- spl[[i]][which(grepl("Passport Number",spl[[i]]))+1]
}

colnames(Resume_output)[(no_col+1)] <- "Father_Name"
colnames(Resume_output)[(no_col+2)] <- "Date_of_Birth"
colnames(Resume_output)[(no_col+3)] <- "Permanent_Address"
colnames(Resume_output)[(no_col+4)] <- "Contact_Number"
colnames(Resume_output)[(no_col+5)] <- "Languages_Known"
#colnames(Resume_output)[269] <- "Passport_Number"

#______________________________________________________________________________

## Clean Personal data.
Resume_output$Father_Name <- gsub("Date of Birth","",Resume_output$Father_Name)
Resume_output$Date_of_Birth <- gsub("Permanent Address","",Resume_output$Date_of_Birth)
Resume_output$Permanent_Address <- gsub("Contact Numbers","",Resume_output$Permanent_Address)
#Resume_output$Languages_Known <- gsub("Passport Number","",Resume_output$Languages_Known)
Resume_output$Contact_Number <- gsub("Languages Known|Passport Number","",Resume_output$Contact_Number)

#_____________________________________________________________________________
## Information Field...
## Email ...
email <- list()
for(i in 1:length(temp)){
  if(length(which(grepl("altimetrik.com",information_df[[i]][[1]])))==0){
    email[[i]] <- "NULL"
  }else{
    email[[i]] <- information_df[[i]][[1]][which(grepl("altimetrik.com",information_df[[i]][[1]]))]
  }
}

Email_df <- t(as.data.frame(email))
rownames(Email_df) <- NULL
## Current Address...

## Find email address..
row_email <- list()
Email <- list()
for(i in 1:length(temp)){
  if(length(which(grepl("altimetrik.com",information_df[[i]][[1]])))==0){
    Email[[i]] <- "NULL"
  }else{
    row_email[[i]] <- which(grepl("altimetrik.com",information_df[[i]][[1]]))
    #assign(paste0("Email",i) , information_df[[i]][[1]][row_email[[i]]])
    Email[[i]] <- information_df[[i]][[1]][row_email[[i]]]}
}


Email_data <- t(data.frame(Email))
rownames(Email_data) <- NULL
Resume_output$Email_Address <- Email_data

## Current Address...
#Resume_output$Current_Address <- gsub(as.character(Resume_output$Email_Address),"",as.character(Resume_output$information_data))

for(i in 1:length(temp)){
  Resume_output[i,(no_col+6)] <- gsub(as.character(Resume_output[i,(no_col+5)]),"",as.character(Resume_output[i,6]))
  Resume_output[i,(no_col+6)] <- gsub(as.character(Resume_output[i,1]),"",as.character(Resume_output[i,(no_col+6)]))
}

colnames(Resume_output)[(no_col+6)] <- "Current_Address"
## Now Name and Email address is there apply gsub and get current address.

#Language_known <- data.frame(do.call('rbind', strsplit(as.character(Resume_output$Languages_Known),"\\,|\\/|&|and")))
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
language_df <- as.data.frame(Resume_output$Languages_Known)
Language <- strsplit(as.character(language_df$`Resume_output$Languages_Known`),"\\,|\\/|&|and")
out <- lapply(Language, FUN=function(x) c(unlist(x), rep(NA, max(lengths(Language))-length(x))))
Language_known <- as.data.frame( cbind(df$Value,do.call(rbind, out)))

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Create Column for Language_known..
s_col <- ncol(Language_known)
#Company_Worked_For_data$`(y)` <- NULL

  for(l in 1:s_col){
    #s_col <- ncol(Language_known)
    #Language_known[,s_col+1] <- NA
    colnames(Language_known)[l] <- paste0("Language",l)
  }

if(s_col > 10){
  Language_known <- Language_known[,1:10]
}else{
  for(l in (s_col+1):10){
    s_col <- ncol(Language_known)
    Language_known[,s_col+1] <- NA
    colnames(Language_known)[s_col+1] <- paste0("Language",l)
  }}
#-----------------------------------------------------------------------------

#Resume_output <- Resume_output[-c(21,31),]
#Primary_Skills_data_fin <- Primary_Skills_data_fin[-c(21,31),]
#Language_known <- Language_known[-c(21,31),]
#Primary_Skills_data_fin <- Primary_Skills_data_fin[,1:20]
Resume_output <- cbind(Resume_output,Primary_Skills_data_fin,Secondary_Skills_data_fin,Language_known)

Resume_output1 <- apply(Resume_output, 2, function(y) (gsub(",", "|", y)))

setwd("C:/Users/anaskar/Desktop/HR_Analytics/output_data")


write.csv(Resume_output1,file = "final_data4.csv")
