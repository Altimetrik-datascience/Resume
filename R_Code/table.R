rm(list=ls())
setwd("C:/Users/anaskar/Desktop/HR_Analytics/code/R_Code/Final Code/final_code_all/50_data")
source("extract.R")
# as.data.frame(Degrees_df,Degrees_df[[1]] <- NULL)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
####|--------------.
####|   Academics..|
####|--------------'
## Degree...******-----------------------------------------------------
Degrees <- list()
Specialization_For_Degree_ <- list()
University <- list()
Years_for_Degree <- list()
Primary_Skills <- list()
Secondary_Skills <- list()
technology_known <- list()
time_for_each_technology <- list()
Certification_Name <- list()
Certification_Institute <- list()
Certification_Year <- list()
Company_Worked_For <- list()
Deignation <- list()
Start_Date <- list()
End_Date <- list()
#Degrees_df1 <-list()

removeNullRec <- function( x ){  
  x <- x[ !sapply( x, is.null ) ]
  if( is.list(x) ){
    x <- lapply( x, removeNullRec)
  }
  return(x)
}


for(i in 1:length(temp)){
  assign(paste0("projectdata",i) , removeNullRec(get(paste0("projectdata",i))))
}

for(i in 1:length(temp)){
  #________________________________________________________________________________  
  ## Degree...******-----------------------------------------------------
  if(Academics[[i]][1]=="NULL"){
    assign(paste0("Degrees_df",i),NA)
    assign(paste0("Specialization_df",i),NA)
    assign(paste0("University_df",i),NA)
    assign(paste0("Years_for_Degree_df",i),NA)
  }else{
    assign(paste0("Degrees_df",i) , list())
    Degrees[[i]] <- Academics[[i]][2:nrow(Academics[[i]]),1]
    for(j in 1:length(Degrees[[i]])){
      (table <- paste("Degrees_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("Degrees[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("Degree_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("Degrees_df", i))
    assign(paste0("Degrees_df", i),
           setNames(df_i, paste0("Degrees", 1:length(df_i))))
    #________________________________________________________________________________  
    ## Specialization...******---------------------------------------------
    assign(paste0("Specialization_df",i) , list())
    Specialization_For_Degree_[[i]] <- Academics[[i]][2:nrow(Academics[[i]]),2]
    for(j in 1:length(Specialization_For_Degree_[[i]])){
      (table <- paste("Specialization_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("Specialization_For_Degree_[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("Specialization_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("Specialization_df", i))
    assign(paste0("Specialization_df", i),
           setNames(df_i, paste0("Specialization_For_Degree_", 1:length(df_i))))
    #________________________________________________________________________________
    ## Institute / University Name...******--------------------------------
    assign(paste0("University_df",i) , list())
    University[[i]] <- Academics[[i]][2:nrow(Academics[[i]]),3]
    for(j in 1:length(University[[i]])){
      (table <- paste("University_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("University[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("University_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("University_df", i))
    assign(paste0("University_df", i),
           setNames(df_i, paste0("University", 1:length(df_i))))
    #________________________________________________________________________________
    ## Details Years...******----------------------------------------------
    assign(paste0("Years_for_Degree_df",i) , list())
    Years_for_Degree[[i]] <- Academics[[i]][2:nrow(Academics[[i]]),4]
    for(j in 1:length(Years_for_Degree[[i]])){
      (table <- paste("Years_for_Degree_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("Years_for_Degree[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("Years_for_Degree_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("Years_for_Degree_df", i))
    assign(paste0("Years_for_Degree_df", i),
           setNames(df_i, paste0("Years_for_Degree", 1:length(df_i))))
  }
  #________________________________________________________________________________ 
  ####|-----------------------.
  ####| Technical_Expertise...|
  ####|-----------------------'
  ## Primary and Secondary Skills...******--------------------------------
  if(Technical_Expertise[[i]][1]=="NULL"){
    Primary_Skills[[i]] <- NA
    Secondary_Skills[[i]] <- NA
  }else{
    Primary_Skills[[i]] <- Technical_Expertise[[i]][1,2]
    Secondary_Skills[[i]] <- Technical_Expertise[[i]][2,2]
  }
  #_______________________________________________________________________________
  ####|-----------------------.
  ####| Technology_known...   |
  ####|-----------------------'
  ## List of Technology Known...******------------------------------------
  if(Technology_known[[i]][1]=="NULL"){
    assign(paste0("technology_known_df",i),NA)
    assign(paste0("time_for_each_technology_df",i),NA)
  }else{
    assign(paste0("technology_known_df",i) , list())
    technology_known[[i]] <- Technology_known[[i]][2:nrow(Technology_known[[i]]),2]
    for(j in 1:length(technology_known[[i]])){
      (table <- paste("technology_known_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("technology_known[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("technology_known_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("technology_known_df", i))
    assign(paste0("technology_known_df", i),
           setNames(df_i, paste0("technology_known", 1:length(df_i))))
    #_______________________________________________________________________________  
    ## Times For Each Technology...******----------------------------------
    assign(paste0("time_for_each_technology_df",i) , list())
    time_for_each_technology[[i]] <- Technology_known[[i]][2:nrow(Technology_known[[i]]),3]
    for(j in 1:length(time_for_each_technology[[i]])){
      (table <- paste("time_for_each_technology_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("time_for_each_technology[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("time_for_each_technology_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("time_for_each_technology_df", i))
    assign(paste0("time_for_each_technology_df", i),
           setNames(df_i, paste0("time_for_each_technology", 1:length(df_i))))
  }
  #_______________________________________________________________________________
  ####|-----------------------.
  ####| Cirtification...      |
  ####|-----------------------'
  # Certification Name...******-----------------------------------------
  if(Certification[[i]][1]=="NULL"){
    assign(paste0("Certification_Name_df",i),NA)
    assign(paste0("Certification_Institute_df",i),NA)
    assign(paste0("Certification_Year_df",i),NA)
  }else{
    assign(paste0("Certification_Name_df",i) , list())
    Certification_Name[[i]] <- Certification[[i]][2:nrow(Certification[[i]]),1]
    for(j in 1:length(Certification_Name[[i]])){
      (table <- paste("Certification_Name_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("Certification_Name[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("Certification_Name_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("Certification_Name_df", i))
    assign(paste0("Certification_Name_df", i),
           setNames(df_i, paste0("Certification_Name", 1:length(df_i))))
    #_______________________________________________________________________________
    ## Institute for Certifications...-------------------------------------
    assign(paste0("Certification_Institute_df",i) , list())
    Certification_Institute[[i]] <- Certification[[i]][2:nrow(Certification[[i]]),2]
    for(j in 1:length(Certification_Institute[[i]])){
      (table <- paste("Certification_Institute_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("Certification_Institute[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("Certification_Institute_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("Certification_Institute_df", i))
    assign(paste0("Certification_Institute_df", i),
           setNames(df_i, paste0("Certification_Institute", 1:length(df_i))))
    #_______________________________________________________________________________
    ## Certification Year...-----------------------------------------------
    assign(paste0("Certification_Year_df",i) , list())
    Certification_Year[[i]] <- Certification[[i]][2:nrow(Certification[[i]]),3]
    for(j in 1:length(Certification_Year[[i]])){
      (table <- paste("Certification_Year_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("Certification_Year[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("Certification_Year_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("Certification_Year_df", i))
    assign(paste0("Certification_Year_df", i),
           setNames(df_i, paste0("Certification_Year", 1:length(df_i))))
  }
  #_______________________________________________________________________________
  ####|-----------------------.
  ####| Employment...         |
  ####|-----------------------'
  ## Companies Worked For...---------------------------------------------
  if(Employment[[i]][1]=="NULL"){
    assign(paste0("Company_Worked_For_df",i),NA)
    assign(paste0("Start_Date_df",i),NA)
    assign(paste0("End_Date_df",i),NA)
    assign(paste0("Deignation_df",i),NA)
  }else{
    assign(paste0("Company_Worked_For_df",i) , list())
    Company_Worked_For[[i]] <- Employment[[i]][2:nrow(Employment[[i]]),1]
    for(j in 1:length(Company_Worked_For[[i]])){
      (table <- paste("Company_Worked_For_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("Company_Worked_For[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("Company_Worked_For_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("Company_Worked_For_df", i))
    assign(paste0("Company_Worked_For_df", i),
           setNames(df_i, paste0("Company_Worked_For", 1:length(df_i))))
    #_______________________________________________________________________________
    ## Designation For Each Company...--------------------------------------
    assign(paste0("Deignation_df",i) , list())
    Deignation[[i]] <- Employment[[i]][2:nrow(Employment[[i]]),2]
    for(j in 1:length(Deignation[[i]])){
      (table <- paste("Deignation_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("Deignation[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("Deignation_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("Deignation_df", i))
    assign(paste0("Deignation_df", i),
           setNames(df_i, paste0("Deignation_For_Company", 1:length(df_i))))
    #_______________________________________________________________________________
    ## Start Year For Each Company...---------------------------------------
    assign(paste0("Start_Date_df",i) , list())
    Start_Date[[i]] <- Employment[[i]][2:nrow(Employment[[i]]),3]
    for(j in 1:length(Start_Date[[i]])){
      (table <- paste("Start_Date_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("Start_Date[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("Start_Date_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("Start_Date_df", i))
    assign(paste0("Start_Date_df", i),
           setNames(df_i, paste0("Start_Date", 1:length(df_i))))
    #_______________________________________________________________________________
    ## End Date For Each Company...-----------------------------------------
    assign(paste0("End_Date_df",i) , list())
    End_Date[[i]] <- Employment[[i]][2:nrow(Employment[[i]]),4]
    for(j in 1:length(End_Date[[i]])){
      (table <- paste("End_Date_df",i,"[[",j,"]]" ,
                      "<-" ,(paste0("End_Date[[",i,"]][",j,"]")), sep = ""))
      eval(parse(text=table))
      
      print(paste("End_Date_df",i,"[[",j,"]]", sep = ""))
    }
    df_i <- get(paste0("End_Date_df", i))
    assign(paste0("End_Date_df", i),
           setNames(df_i, paste0("End_Date", 1:length(df_i))))
  }
  #_______________________________________________________________________________
  ####|-----------------------.
  ####| No of Project...      |
  ####|-----------------------'
  ## Project list with title...******-------------------------------------
  
}
### No of project... need to start..
