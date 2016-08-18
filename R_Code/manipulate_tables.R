setwd("C:/Users/anaskar/Desktop/HR_Analytics/code/R_Code")
source("final_test1.R")

#--------------------------------------------------------------------------
# List of Tables.
# Academics,Technical_Expertise,Technology_known,Certification,Employment,
# no_of_project
#--------------------------------------------------------------------------
#---------------
### Academics...
#---------------
## Degree...******-----------------------------------------------------
Degrees <- Academics[2:nrow(Academics),1]

Degrees_df <- data.frame("NA")

for(i in 1:length(Degrees)){
  Degrees_df[paste0("Degrees",i)] <- Degrees[i]
}

## Specialization...******---------------------------------------------
Specialization <- Academics[2:nrow(Academics),2]

Specialization_df <- data.frame("NA")

for(i in 1:length(Specialization)){
  Specialization_df[paste0("Specialization_For_Degree_",i)] <- Specialization[i]
}

## Institute / University Name...******--------------------------------
University <- Academics[2:nrow(Academics),3]

University_df <- data.frame("NA")

for(i in 1:length(University)){
  University_df[paste0("University_For_Degree_",i)] <- University[i]
}

## Details Years...******----------------------------------------------
Years_for_Degree <- Academics[2:nrow(Academics),4]

Years_for_Degree_df <- data.frame("NA")

for(i in 1:length(Years_for_Degree)){
  Years_for_Degree_df[paste0("Years_for_Degree_",i)] <- Years_for_Degree[i]
}

#---------------
### Technical_Expertise...
#---------------
## Primary Skills...******
Primary_Skills <- Technical_Expertise[1,2]
Secondary_Skills <- Technical_Expertise[2,2]

#---------------
### Technology_known...
#---------------
## List of Technology Known...******-----------------------------------
technology_known <- Technology_known[2:nrow(Technology_known),2]

technology_known_df <- data.frame("NA")

for(i in 1:length(technology_known)){
  technology_known_df[paste0("technology_known",i)] <- technology_known[i]
}

## Times For Each Technology...******----------------------------------
time_for_each_technology <- Technology_known[2:nrow(Technology_known),3]

time_for_each_technology_df <- data.frame("NA")

for(i in 1:length(time_for_each_technology)){
  time_for_each_technology_df[paste0("Time_Spend_For_Technology",i)] <- time_for_each_technology[i]
}

#---------------
### Cirtification...******---------------------------------------------
#---------------
Certification_Name <- Certification[2:nrow(Certification),1]

Certification_Name_df <- data.frame("NA")

for(i in 1:length(Certification_Name)){
  Certification_Name_df[paste0("certification",i,"_","Name")] <- Certification_Name[i]
}

## Institute for Certifications...-------------------------------------
Certification_Institute <- Certification[2:nrow(Certification),2]

Certification_Institute_df <- data.frame("NA")

for(i in 1:length(Certification_Institute)){
  Certification_Institute_df[paste0("certification",i,"_","Institute")] <- Certification_Institute[i]
}

## Certification Year...-----------------------------------------------
Certification_Year <- Certification[2:nrow(Certification),3]

Certification_Year_df <- data.frame("NA")

for(i in 1:length(Certification_Year)){
  Certification_Year_df[paste0("certification",i,"_","Year")] <- Certification_Year[i]
}

#---------------
### Employment...******
#---------------
## Companies Worked For...---------------------------------------------
Company_Worked_For <- Employment[2:nrow(Employment),1]

company_df <- data.frame("NA")

for(i in 1:length(Company_Worked_For)){
  company_df[paste0("company",i)] <- Company_Worked_For[i]
}


## Designation For Each Company...--------------------------------------
Deignation <- Employment[2:nrow(Employment),2]
deignation_df <- data.frame("NA")

for(i in 1:length(Deignation)){
  deignation_df[paste0("company",i,"_","Deignations")] <- Deignation[i]
}

## Start Year For Each Company...---------------------------------------
Start_Date <- Employment[2:nrow(Employment),3]

Start_Date_df <- data.frame("NA")

for(i in 1:length(Deignation)){
  Start_Date_df[paste0("company",i,"_","startDate")] <- Start_Date[i]
}

## End Date For Each Company...-----------------------------------------
End_Date <- Employment[2:nrow(Employment),4]

End_Date_df <- data.frame("NA")

for(i in 1:length(Deignation)){
  End_Date_df[paste0("company",i,"_","endDate")] <- End_Date[i]
}

##########################################################################
#---------------
### No of Project...
#---------------

no_of_project

mydata <- list()
for(i in 1:no_of_project){
  #mydata <- list()
  table <- paste("mydata[[",i,"]]" ,"<-" ,"project",i,sep = "")
  eval(parse(text=table))
  print(paste("mydata[[",i,"]]",sep = ""))
}
## Final Project Data Frame
project_df <- data.frame("NA")
for(j in 1:length(mydata)){
  for(i in 1:length(mydata[[j]][,1])){
    project_df[paste0("project",j,"_",mydata[[j]][,1][i])] <- mydata[[j]][,2][i]
  }}
