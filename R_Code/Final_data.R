setwd("C:/Users/anaskar/Desktop/HR_Analytics/code/R_Code")
 
source("manipulate_tables.R")
#------------------------------------------------------------------------

#------------------------------------------------------------------------

Resume_Data <- project_df

##-----------------------------------------------------------------------

Resume_Data$Name <- Name
Resume_Data$Training_Attended <- Training_Attended
Resume_Data$profile_summary <- profile_summary
Resume_Data$Primary_Skills <- Primary_Skills
Resume_Data$Secondary_Skills <- Secondary_Skills
Resume_Data$Email_Address <- email
Resume_Data$Current_Address <- current_address
Resume_Data$Father_Name <- Father_Name
Resume_Data$Date_of_Birth <- Date_of_Birth
Resume_Data$Permanent_Address <- Permanent_Address
Resume_Data$Contact_Number <- Contact_Number
Resume_Data$Language_Known <- Language_Known
##------------------------------------------------------------------------
#write.csv(Resume_Data,file = "Sample_Data.csv")
# Degrees_df,Specialization_df,University_df,Years_for_Degree_df,
#technology_known_df,time_for_each_technology_df,Certification_Name_df,
#Certification_Institute_df,Certification_Year_df,company_df,deignation_df,
#Start_Date_df,End_Date_df,