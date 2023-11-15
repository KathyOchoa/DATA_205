# Necessary libraries
library(tidyverse)
library(tidyselect)
library(dplyr)
library(rio)

# Read in the flaps dataset from 2016-2019
setwd("/Users/kathyochoa/Documents/DATA_205/Project/Flaps_CSV")
flaps2016 <- read.csv("2016_Flap.csv", na = c("", "NA", "-99"))
flaps2017 <- read.csv("2017_Flap.csv", na = c("", "NA", "-99"))
flaps2018 <- read.csv("2018_Flap.csv", na = c("", "NA", "-99"))
flaps2019 <- read.csv("2019_Flap.csv", na = c("", "NA", "-99"))

# Read in the excel sheet with all the necessary codes
flapCodes <- read_excel("Timing to Flap Procedure Codes.xlsx")
diagFracture <- read_excel("Timing to Flap Procedure Codes.xlsx", 2)
operFixation <- read_excel("Timing to Flap Procedure Codes.xlsx", 3)


## Merge Flaps2016-Flaps2019 based on common columns

# comCols used to merge flaps2016 and flaps2017
# comCols2 used to merge flaps2016/2017 and 2018/2019

comCols <- c("X.1", "X", "age", "age_neonate", "amonth", "aweekend", 
             "died", "discwt", "dispuniform", "dqtr", "drg", "drgver", 
             "drg_nopoa","elective", "female", "hcup_ed", 
             "hcup_division", "hosp_nis", 
             "i10_dx1", "i10_dx2", "i10_dx3", "i10_dx4", "i10_dx5",
             "i10_dx6","i10_dx7", "i10_dx8", "i10_dx9", "i10_dx10", 
             "i10_dx11","i10_dx12","i10_dx13", "i10_dx14", "i10_dx15",
             "i10_dx16", "i10_dx17", "i10_dx18", "i10_dx19", "i10_dx20",
             "i10_dx21", "i10_dx22", "i10_dx23", "i10_dx24", "i10_dx25",
             "i10_dx26", "i10_dx27", "i10_dx28", "i10_dx29", "i10_dx30",
             "i10_ndx", "i10_npr",
             "i10_pr1", "i10_pr2", "i10_pr3", "i10_pr4", "i10_pr5",
             "i10_pr6", "i10_pr7", "i10_pr8", "i10_pr9", "i10_pr10",
             "i10_pr11", "i10_pr12", "i10_pr13", "i10_pr14", "i10_pr15",
             "key_nis", "los", "mdc", "mdc_nopoa", "nis_stratum",
             "pay1", "pl_nchs",
             "prday1", "prday2", "prday3", "prday4", "prday5",
             "prday6", "prday7", "prday8", "prday9", "prday10",
             "prday11", "prday12", "prday13", "prday14", "prday15", 
             "race", "totchg", "tran_in", "tran_out", 
             "year", "zipinc_qrtl", "flap")

comcols2 <- c("i10_dx31", "i10_dx32", "i10_dx33", "i10_dx34", "i10_dx35", 
              "i10_dx36","i10_dx37", "i10_dx38", "i10_dx39", "i10_dx40",
              "i10_pr16", "i10_pr17", "i10_pr18", "i10_pr19", "i10_pr20", 
              "i10_pr21", "i10_pr22", "i10_pr23", "i10_pr24", "i10_pr25",
              "prday16", "prday17", "prday18", "prday19", "prday20",
              "prday21", "prday22", "prday23", "prday24", "prday25")

# Full join the 4 dataframes
allYears <- flaps2016 %>%
  full_join(flaps2017, by = c(comCols, "dxver", "prver")) %>%
  full_join(flaps2018, by = c(comCols, comcols2)) %>%
  full_join(flaps2019, by = c(comCols, comcols2))



### Diagnostic Codes ###

diagCols <- c("i10_dx1", "i10_dx2", "i10_dx3", "i10_dx4", "i10_dx5", 
              "i10_dx6","i10_dx7", "i10_dx8", "i10_dx9", "i10_dx10", 
              "i10_dx11","i10_dx12","i10_dx13", "i10_dx14", "i10_dx15", 
              "i10_dx16", "i10_dx17", "i10_dx18", "i10_dx19", "i10_dx20", 
              "i10_dx21", "i10_dx22", "i10_dx23", "i10_dx24", "i10_dx25", 
              "i10_dx26", "i10_dx27", "i10_dx28", "i10_dx29", "i10_dx30",
              "i10_dx31", "i10_dx32", "i10_dx33", "i10_dx34", "i10_dx35", 
              "i10_dx36","i10_dx37", "i10_dx38", "i10_dx39", "i10_dx40")


# Subset only the diagnoses columns

onlyDiagCols <- allYears %>%
  select(diagCols, year)

## List all the associated diagnosis

# Lengthen data, group by year then diagnosis code,
# count each occurrence for each code, omit any NAs,
# filter out diagnoses that occur less that 100 times,
# arrange by descending order

associatedDiagnosis <- pivot_longer(onlyDiagCols, diagCols) %>%
  group_by(year, value) %>%
  summarize(count = n()) %>%
  na.omit() %>%
  filter(count > 100) %>%
  filter(value != "I10") %>%
  arrange(year, desc(count))


# Write associated Diagnosis to file
write_csv(associatedDiagnosis, "associatedDiagnosis.csv")


## List the diagnostic fracture codes and their frequency

# Lengthen data, group by year then diagnosis code,
# filter the fracture codes, count the frequency 
# omit any NAs, arrange by descending order

diagnosticCM <- diagFracture$`Diagnostic codes - CM codes`
fractureCodes <- pivot_longer(onlyDiagCols, diagCols) %>%
  group_by(year, value) %>%
  filter(value %in% diagnosticCM) %>%
  summarize(count = n()) %>%
  na.omit() %>%
  arrange(year, desc(count))
  


### Procedure Codes ###

procedureCols <- c("i10_pr1", "i10_pr2", "i10_pr3", "i10_pr4", 
                   "i10_pr5", "i10_pr6", "i10_pr7", "i10_pr8", 
                   "i10_pr9", "i10_pr10", "i10_pr11", "i10_pr12", 
                   "i10_pr13", "i10_pr14", "i10_pr15","i10_pr16", 
                   "i10_pr17", "i10_pr18", "i10_pr19", "i10_pr20", 
                   "i10_pr21", "i10_pr22", "i10_pr23", "i10_pr24", 
                   "i10_pr25")

# Create flapTypes df of procedure codes

flapTypes <- allYears %>%
  select(year, procedureCols)

