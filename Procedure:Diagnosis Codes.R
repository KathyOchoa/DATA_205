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
fractureCodes <- read_excel("Timing to Flap Procedure Codes.xlsx", 2)
fixationCodes <- read_excel("Timing to Flap Procedure Codes.xlsx", 3)


## Merge Flaps2016-Flaps2019 based on common columns

# comCols used to merge flaps2016 and flaps2017
# comCols2 used to merge flaps2016/2017 and 2018/2019

comCols1 <- intersect(names(flaps2016), names(flaps2017))
comCols2 <- intersect(names(flaps2018), names(flaps2019))

# Full join the 4 dataframes

allYears <- flaps2016 %>%
  full_join(flaps2017, by = comCols1) %>%
  full_join(flaps2018, by = comCols2) %>%
  full_join(flaps2019, by = comCols2)

head(allYears)


### Diagnostic Codes ###

# Subset only the diagnoses columns

onlyDiagCols <- allYears %>%
  select(year, contains("i10_dx"))

head(onlyDiagCols)

## List all the associated diagnosis

diagnoses <- pivot_longer(onlyDiagCols, cols = contains("i10_dx")) %>%
  group_by(year, value) %>%
  filter(value != "I10") %>%
  summarize(count = n()) %>%
  na.omit() %>%
  arrange(year, desc(count))

head(diagnoses)

# Write diagnoses to file
#write_csv(diagnoses, "associatedDiagnosis.csv")


## List the diagnostic fracture codes and their frequency

diagnosticCM <- fractureCodes$`Diagnostic codes - CM codes`

onlyFracture <- diagnoses %>%
  filter(value %in% diagnosticCM)

head(onlyFracture)

# Rename the columns
colnames(fractureCodes)[1] = "cm_code"
colnames(fractureCodes)[2] = "description"
colnames(onlyFracture)[2] = "cm_code"

# Merge the onlyFracture df with the fractureCodes df
frac_desc <- merge(onlyFracture, fractureCodes, sort=FALSE)
head(frac_desc)
  
# Write the fractureCodes to file
#write_csv(frac_desc, "diagnosticFracture.csv")



### Procedure Codes ###

# Subset only the procedure columns

onlyProcedureCols <- allYears %>%
  select(year, starts_with("i10_pr"))

head(onlyProcedureCols)

# Subset FLAP procedures

flapCodes1 <- flapCodes$`Flap coding`

flapProcedures <- pivot_longer(onlyProcedureCols, cols = contains("i10_pr")) %>%
  group_by(year, value) %>%
  summarize(count = n()) %>%
  na.omit() %>%
  filter(value %in% c(flapCodes1)) %>%
  arrange(year, desc(count))

head(flapProcedures)

# Rename columns
colnames(flapCodes)[1] <-"flap_code"
colnames(flapCodes)[2] <- "description"
colnames(flapProcedures)[2] <- "flap_code"

# Merge the flapProcedures df with the flapCodes df
flap_desc <- merge(flapProcedures, flapCodes, sort = FALSE)

head(flap_desc)


# Subset FIXATION procedures

fixationCodes1 <- fixationCodes$`Procedural Codes`

fixationProcedures <- pivot_longer(onlyProcedureCols, cols = contains("i10_pr")) %>%
  group_by(year, value) %>%
  summarize(count = n()) %>%
  na.omit() %>%
  filter(value %in% c(fixationCodes1)) %>%
  arrange(year, desc(count))

head(fixationProcedures)

# Rename columns
colnames(fixationCodes)[1] <-"fixation_code"
colnames(fixationCodes)[2] <- "description"
colnames(fixationProcedures)[2] <- "fixation_code"

# Merge the flapProcedures df with the flapCodes df
fixation_desc <- merge(fixationProcedures, fixationCodes, sort = FALSE)

head(fixation_desc)
