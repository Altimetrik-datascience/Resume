rm(list=ls())
setwd("C:/Users/anaskar/Desktop/HR_Analytics/code/R_Code/Final Code/final_code_all/deleted_code/test/deleted_resume/all/4")

temp = list.files(pattern="*.docx")

## Extract only tables from the Resume.
library(docxtractr)
library(XML)
library(data.table)
#-------------------------------.
Academics <- list()             #
Technical_Expertise <- list()   #
Technology_known <- list()      #
Certification <- list()         #
Employment <- list()            #
mydata <- list()                #
df <- list()                    #
Name_Header <- list()           #
information_df <- list()        #
profile_summary <- list()       #
Training_Attended <- list()     #
Personal_information <- list()  #
Information <- list()           #
                  #
k <- list()
#info <- list()
#-------------------------------'
for(i in 1:length(temp)){
  text <- list()
  #------------------------------------------------------------------.
  for(j in 1:length((docx_extract_all_tbls(read_docx(temp[i]))))){   #
    text[[j]] <- (docx_extract_all_tbls(read_docx(temp[i])))[[j]][1,1] 
    #k <- (length(text)-length(which(grepl("Title",text))))
  }  
  
  #------------------------------------------------------------------'
  ### Academics...******---------------------------------------------------
  if(length(which(grepl("Degree/ Education",text)))==0){
    Academics[[i]] <- data.frame(Degree ="NA")
    
  }else{
    Academics[[i]] <- 
      (docx_extract_all_tbls(read_docx(temp[i]))[[which(grepl("Degree/ Education",text))]])
    print(paste0("Academics[[",i,"]]"))
    
    setnames(Academics[[i]], 
             old = colnames(Academics[[i]]), 
             new = c('Degree/ Education','Specialization',
                     'Institute / University Name','Details (Years)'))}
  ## Technical Expertise...******------------------------------------------
  if(length(which(grepl("Primary Skills",text)))==0){
    Technical_Expertise[[i]] <- data.frame(V1="NA")
  }else{
    Technical_Expertise[[i]] <- 
      (docx_extract_all_tbls(read_docx(temp[i]))[[which(grepl("Primary Skills",text))]])
    print(paste0("Technical_Expertise[[",i,"]]"))}
  ## Technology Known...******---------------------------------------------
  if(length(which(grepl("Technology",text)))==0){
    Technology_known[[i]] <- data.frame(Technology="NA")
  }else{
    Technology_known[[i]] <- 
      as.data.frame(docx_extract_all_tbls(read_docx(temp[i]))[[which(grepl("Technology",text))]])
    print(paste0("Technology_known[[",i,"]]"))
    
    setnames(Technology_known[[i]], 
             old = colnames(Technology_known[[i]]), 
             new = c('Technology','Details',
                     'Experience (No. of Months)'))}
  ## Technical/ Professional Certifications...******-----------------------
  if(length(which(grepl("Certification",text)))==0){
    Certification[[i]] <- data.frame(Certification_name="NA")
  }else{
    Certification[[i]] <- 
      (docx_extract_all_tbls(read_docx(temp[i]))[[which(grepl("Certification",text))]])
    print(paste0("Certification[[",i,"]]"))
    
    setnames(Certification[[i]], 
             old = colnames(Certification[[i]]), 
             new = c('Certification_name','Institute Name',
                     'Year of Completion'))}
  ## Employment History...******-------------------------------------------
  if(length(which(grepl("Company Name",text)))==0){
    Employment[[i]] <- data.frame(Company_Name="NA")
  }else{
    Employment[[i]] <- 
      (docx_extract_all_tbls(read_docx(temp[i]))[[which(grepl("Company Name",text))[1]]])
    print(paste0("Employment[[",i,"]]"))
    
    setnames(Employment[[i]], 
             old = colnames(Employment[[i]]), 
             new = c('Company Name','Designation',
                     'Start date','End date'))}
  ## All project data frame...******---------------------------------------
  #no_of_project <- length(docx_extract_all_tbls(read_docx(temp[i])))
  
  assign(paste0("projectdata",i) , list())
  #assign(paste0("mydata",i) , list())
  for(j in which(grepl("Title",text))){
    
    
    #assign(paste("project", i,"_",j, sep = ""), 
    #      (as.data.frame(docx_extract_all_tbls(read_docx(temp[i]))[j+5])))
    
    (table <- paste("projectdata",i,"[[",j,"]]" ,
                    "<-" ,((docx_extract_all_tbls
                            (read_docx(temp[i]))[j])), sep = ""))
    eval(parse(text=table))
    
    print(paste("projectdata",i,"[[",j,"]]", sep = ""))
  }
  
  ## Extract full text through XML...--------------------------------------
  df[[i]] <- (xmlToDataFrame(getNodeSet(xmlParse(unzip(temp[i])[4]),
                                        "/w:document/w:body/w:p/w:r/w:t")))
  print(paste("df[[",i,"]]",sep = "")) 
  
  ## Name Header...******--------------------------------------------------
  
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  for(h in which(grepl("./word/header",unzip(temp[i])))){
    head <- getNodeSet(xmlParse(unzip(temp[i])[h]),
                       "/w:hdr/w:p/w:r/w:t")
    if(length(head)>0){
    Name_Header[[i]] <- paste(xmlToDataFrame(getNodeSet(xmlParse(unzip(temp[i])[h]),
                                                        "/w:hdr/w:p/w:r/w:t"))[[1]], collapse = '')
    print(paste0("Name_Header[[",i,"]]"))
    }else{Name_Header[[i]] <- "NULL"}
  }
  
  ## Information Field...******--------------------------------------------
  
  info <- getNodeSet(xmlParse(unzip(temp[i])[4]),
                                 "/w:document/w:body/w:p/w:r/mc:AlternateContent/mc:Fallback
                                 /w:pict/v:rect/v:textbox/w:txbxContent/w:p/w:r/w:t")
  if(length(info)==0){
    information_df[[i]] <- data.frame(text="NA")
    Information[[i]] <- (paste(as.character(information_df[[i]][,1][1:length(information_df[[i]][,1])]), collapse = ''))
    
    print(paste0("information_df[[",i,"]]"))
  }else{
    information_df[[i]] <- 
      xmlToDataFrame(getNodeSet(xmlParse(unzip(temp[i])[4]),
                                "/w:document/w:body/w:p/w:r/mc:AlternateContent/mc:Fallback
                                /w:pict/v:rect/v:textbox/w:txbxContent/w:p/w:r/w:t"))
    
    Information[[i]] <- (paste(as.character(information_df[[i]][,1][1:length(information_df[[i]][,1])]), collapse = ''))
    print(paste0("information_df[[",i,"]]"))
  }
  
  ## Profile Summary...******------------------------------------------------
  
  if(length(which(df[[i]]=="Profile Summary"))>0){
    profile_summary[[i]] <- (paste(as.character(df[[i]][,1][((which(df[[i]] == "Profile Summary")+1 ): 
                                                               (which(df[[i]] == "Academics")-1))]), collapse = ''))
    print(paste0("profile_summary[[",i,"]]"))
  }else{
    profile_summary[[i]] <- "NULL"
    print(paste0("profile_summary[[",i,"]]"))
  }
  
  
  
  ## Training Attended...******----------------------------------------------
  if(length(which(df[[i]]=="Trainings Attended"))==0){
    Training_Attended[[i]] <- "NULL"
  }else{
    Training_Attended[[i]] <- (paste(as.character(df[[i]][,1][((which(df[[i]] == "Trainings Attended")+1 ): 
                                                                 (which(df[[i]] == "Personal Information")-1))]), collapse = '|||'))
    print(paste0("Training_Attended[[",i,"]]"))
  }
  ## Personal Information...******------------------------------------------
  if(length(which(df[[i]]=="Personal Information"))==0){
    Personal_information[[i]] <- NA
  }else{
  Personal_information[[i]] <- (paste(as.character(df[[i]][,1][((which(df[[i]] == "Personal Information")+1 ): 
                                                                  (nrow(df[[i]])))]), collapse = ''))
  print(paste0("Personal_information[[",i,"]]"))
  }
  print("----------------------------------------------------------")
  print(temp[i+1])
  print("----------------------------------------------------------")
}
