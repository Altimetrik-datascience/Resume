setwd("C:/Users/anaskar/Desktop/HR_Analytics/code/R_Code")
 
source("manipulate_tables.R")
#------------------------------------------------------------------------

#------------------------------------------------------------------------

Resume_Data <- data.frame(matrix(0, ncol = no_of_project, nrow = 1))

names(Resume_Data)[grep("^X", names(Resume_Data))] <- 
  paste("project", names(Resume_Data)[grep("^X", names(Resume_Data))], sep="_")

for(i in 1:no_of_project){
  Resume_Data[1,i] <- get(paste0("pr",i))
}

##-----------------------------------------------------------------------

Resume_Data$Name <- Name
Resume_Data$Personal_information <- Personal_information
Resume_Data$Training_Attended <- Training_Attended
Resume_Data$profile_summary <- profile_summary
Resume_Data$Specialization <- Specialization
Resume_Data$Degrees <- Degrees
Resume_Data$University <- University
Resume_Data$Years_for_Degree <- Years_for_Degree
Resume_Data$Primary_Skills <- Primary_Skills
Resume_Data$Secondary_Skills <- Secondary_Skills
Resume_Data$technology_known <- technology_known
Resume_Data$time_for_each_technology <- time_for_each_technology
Resume_Data$Certification_Name <- Certification_Name
Resume_Data$Certification_Institute <- Certification_Institute
Resume_Data$Certification_Year <- Certification_Year
Resume_Data$Company_Worked_For <- Company_Worked_For
Resume_Data$Deignation <- Deignation
Resume_Data$Start_Date <- Start_Date
Resume_Data$End_Date <- End_Date
