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
## Degree...******
Degrees <- Academics[2:nrow(Academics),1]
Degrees <- paste(Degrees, collapse = '|')

## Specialization...******
Specialization <- Academics[2:nrow(Academics),2]
Specialization <- paste(Specialization, collapse = '|')

## Institute / University Name...******
University <- Academics[2:nrow(Academics),3]
University <- paste(University, collapse = '|')

## Details Years...******
Years_for_Degree <- Academics[2:nrow(Academics),4]
Years_for_Degree <- paste(Years_for_Degree, collapse = '|')

#---------------
### Technical_Expertise...
#---------------
## Primary Skills...******
Primary_Skills <- Technical_Expertise[1,2]
Secondary_Skills <- Technical_Expertise[2,2]

#---------------
### Technology_known...
#---------------
## List of Technology Known...******
technology_known <- Technology_known[2:nrow(Technology_known),2]
technology_known <- paste(technology_known, collapse = '|')

## Times For Each Technology...******
time_for_each_technology <- Technology_known[2:nrow(Technology_known),3]
time_for_each_technology <- paste(time_for_each_technology, collapse = '|')

#---------------
### Cirtification...******
#---------------
Certification_Name <- Certification[2:nrow(Certification),1]
Certification_Name <- paste(Certification_Name, collapse = '|')

## Institute for Certifications...
Certification_Institute <- Certification[2:nrow(Certification),2]
Certification_Institute <- paste(Certification_Institute, collapse = '|')

## Certification Year...
Certification_Year <- Certification[2:nrow(Certification),3]
Certification_Year <- paste(Certification_Year, collapse = '|')

#---------------
### Employment...******
#---------------
## Companies Worked For...
Company_Worked_For <- Employment[2:nrow(Employment),1]
Company_Worked_For <- paste(Company_Worked_For, collapse = '|')

## Designation For Each Company...
Deignation <- Employment[2:nrow(Employment),2]
Deignation <- paste(Deignation, collapse = '|')

## Start Year For Each Company...
Start_Date <- Employment[2:nrow(Employment),3]
Start_Date <- paste(Start_Date, collapse = '|')

## End Date For Each Company...
End_Date <- Employment[2:nrow(Employment),4]
End_Date <- paste(End_Date, collapse = '|')

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

#all_project <- do.call(rbind.data.frame, mydata)

for(i in 1:no_of_project){
  mydata[[i]][,3] <- paste0("project",mydata[[i]][,1] ," : ", mydata[[i]][,2])
}
#mydata[[4]][,3]


for(i in 1:no_of_project){
  #assign(paste0("pro",i),mydata[[1]][,3][1:nrow(mydata[[i]])])
  assign(paste0("pr",i),paste(mydata[[1]][,3][1:nrow(mydata[[i]])], collapse = '|'))
}
