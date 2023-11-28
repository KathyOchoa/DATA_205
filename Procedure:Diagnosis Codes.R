# Necessary libraries
library(readxl)
library(tidyverse)
library(dplyr)
library(stringi)

##### Data Ingestion ##### 

# Read in the flaps dataset from 2016-2019
setwd("/Users/kathyochoa/Documents/DATA_205/Project/Flaps_CSV")
flaps2016 <- read.csv("2016_Flap.csv", na = c("", "NA", "-99"))
flaps2017 <- read.csv("2017_Flap.csv", na = c("", "NA", "-99"))
flaps2018 <- read.csv("2018_Flap.csv", na = c("", "NA", "-99"))
flaps2019 <- read.csv("2019_Flap.csv", na = c("", "NA", "-99"))

# Read in the excel sheet with all the necessary codes
flap_Codes <- read_excel("Timing to Flap Procedure Codes.xlsx")
fracture_Codes <- read_excel("Timing to Flap Procedure Codes.xlsx", 2)
fixation_Codes <- read_excel("Timing to Flap Procedure Codes.xlsx", 3)



##### Data Wrangling ##### 

## Spreadsheets ##

# Rename code columns names
colnames(flap_Codes)[1] <-"code"
colnames(flap_Codes)[2] <- "description"
colnames(fracture_Codes)[1] <- "code"
colnames(fracture_Codes)[2] <- "description"
colnames(fixation_Codes)[1] <- "code"
colnames(fixation_Codes)[2] <- "description"

# Merge the spreadsheets
codesOfInterest <- full_join(flap_Codes, fixation_Codes, 
                             by = c("code", "description")) %>%
  full_join(fracture_Codes, by = c("code", "description"))

# Remove white space or extra characters in code columns
codesOfInterest$code <- gsub("`", '', codesOfInterest$code, fixed = TRUE)
codesOfInterest$code <- stri_trim_both(codesOfInterest$code)


## Flaps Dataframes ##

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


### All Diagnostic and Procedure Codes ###

# Filter all the diagnostic and procedure columns
checkAll <- allYears %>%
  select(year, totchg, los, contains("i10_dx"), contains("i10_pr"))

head(checkAll)

# Elongate diagnostic and procedure columns
dpLong <- pivot_longer(checkAll, cols = -c(year, totchg, los))

head(dpLong)

# Group by codes, count each occurrence, and get the average total charge
allCodes <- dpLong %>%
  group_by(year, value) %>%
  filter(value != "I10",
         totchg > 0,
         los > 0) %>%
  na.omit() %>%
  summarize(count = n(),
            avgChg = round(mean(totchg)),
            avgLos = round(mean(los)))

head(allCodes)


## All codes of interest ##

# Filter the codes of interest (from spreadsheet)
myCodes <- allCodes %>%
  filter(grepl("0HX|0JX|0PH|0QH", value) |
         value %in% fracture_Codes$code) %>%
  mutate(type = case_when(
    grepl("0PH", value) ~ "Upper Fixation",
    grepl("0QH", value) ~ "Lower Fixation",
    grepl("0HX", value) ~ "Skin & Breast Transfer",
    grepl("0JX", value) ~ "Tissue & Fascia Transfer"
  ))

head(myCodes)
  

# Rename code column in myCodes
colnames(myCodes)[2] <- "code"

# Remove white space from the codes
myCodes$code <- stri_trim_both(myCodes$code)


# Merge flapcodes and skinTansfer to get the desciption of codes
finalCodes <- left_join(myCodes, codesOfInterest, by = "code")

write.csv(finalCodes, "Types of Flaps.csv")

#### Visualizations #####

ggplot(data = finalCodes) +
  geom_bar(aes(x = type), position = "stack")

ggplot(data = finalCodes) +
  geom_bar(aes(x = type, y = avgChg), position = "stack")


#### Statistical Analysis #####

model1 <- glm(avgChg ~ avgLos + type, data = finalCodes)
summary(model1)
