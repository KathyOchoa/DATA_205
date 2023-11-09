# Necessary libraries
library(tidyverse)
library(tidyselect)
library(dplyr)
library(RColorBrewer)
library(DataExplorer)

##### Data Ingestion ##### 

## Read in the flaps dataset from 2016-2019
setwd("/Users/kathyochoa/Documents/DATA_205/Project/Flaps_CSV")
flaps2016 <- read.csv("2016_Flap.csv", na = c("", "NA", "-99"))
flaps2017 <- read.csv("2017_Flap.csv", na = c("", "NA", "-99"))
flaps2018 <- read.csv("2018_Flap.csv", na = c("", "NA", "-99"))
flaps2019 <- read.csv("2019_Flap.csv", na = c("", "NA", "-99"))


## Merge Flaps2016-Flaps2019 based on common columns

# comCols used to merge flaps2016 and flaps2017
# comCols2 used to merge flaps2016/2017 and 2018/2019

comCols <- c("X.1", "X", "age", "age_neonate", "amonth", "aweekend", 
             "died", "discwt", "dispuniform", "dqtr", "drg", "drgver", 
             "drg_nopoa", "dxver","elective", "female", "hcup_ed", 
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
             "prver", "race", "totchg", "tran_in", "tran_out", 
             "year", "zipinc_qrtl", "flap")
comcols2 <- c("X.1", "X", "age", "age_neonate", "amonth", "aweekend", 
              "died", "discwt", "dispuniform", "dqtr", "drg", "drgver", 
              "drg_nopoa", "elective", "female", "hcup_ed", 
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
              "race", "totchg", "tran_in", "tran_out", "year",
              "zipinc_qrtl", "flap", 
              "i10_dx31", "i10_dx32", "i10_dx33", "i10_dx34", "i10_dx35", 
              "i10_dx36","i10_dx37", "i10_dx38", "i10_dx39", "i10_dx40",
              "i10_pr16", "i10_pr17", "i10_pr18", "i10_pr19", "i10_pr20", 
              "i10_pr21", "i10_pr22", "i10_pr23", "i10_pr24", "i10_pr25",
              "prday16", "prday17", "prday18", "prday19", "prday20",
              "prday21", "prday22", "prday23", "prday24", "prday25")

## Full join the 4 dataframes
dfJoins <- flaps2016 %>%
  full_join(flaps2017, by = comCols) %>%
  full_join(flaps2018, by = comcols2) %>%
  full_join(flaps2019, by = comcols2)

## Rename the hcup_division column to hosp_division
colnames(dfJoins)[18] <- "hosp_division"



##### Data Wrangling ##### 

# Create a new dataframe with categorical variables 
# and filter according to bounds
categDf <- dfJoins %>%
  select(amonth, aweekend, died, dispuniform, elective, female, 
         hosp_division, pay1, race, year, zipinc_qrtl) %>%
  filter(between(amonth, 1,12), between(aweekend, 0,1),
         between(died, 0,1), between(dispuniform,1,99), 
         between(elective,0,1), between(female,0,1),
         between(pay1,1,6), between(race,1,6), 
         between(zipinc_qrtl,1,4))


## Rename categorical variables

# Rename amonths
for(i in 1:length(month.name)) {
  categDf$amonth[categDf$amonth == i] <- month.name[i]
}

# Rename aweekend
categDf$aweekend[categDf$aweekend == 0] <- "Mon-Fri"
categDf$aweekend[categDf$aweekend == 1] <- "Sat-Sun"


# Rename died
categDf$died[categDf$died == 0] <- "Did not die"
categDf$died[categDf$died == 1] <- "Died"


# Rename the dispuniform
dispUni <- c("Routine", "Transfer to short-term hospital", "Transfer Other",
             "Home Health Care", "Against medical advice", "Died in hospital",
             "Discharged/transferred to court/law enforcement",
             "Discharged alive, destination unknown")

categDf$dispuniform[categDf$dispuniform == 1] <- dispUni[1]
categDf$dispuniform[categDf$dispuniform == 2] <- dispUni[2]
categDf$dispuniform[categDf$dispuniform == 5] <- dispUni[3]
categDf$dispuniform[categDf$dispuniform == 6] <- dispUni[4]
categDf$dispuniform[categDf$dispuniform == 7] <- dispUni[5]
categDf$dispuniform[categDf$dispuniform == 20] <- dispUni[6]
categDf$dispuniform[categDf$dispuniform == 21] <- dispUni[7]
categDf$dispuniform[categDf$dispuniform == 99] <- dispUni[8]

# Rename elective
categDf$elective[categDf$elective == 0] <- "Non-elective"
categDf$elective[categDf$elective == 1] <- "Elective"


# Rename female
categDf$female[categDf$female == 0] <- "Male"
categDf$female[categDf$female == 1] <- "Female"


# Rename hosp_division
hospDiv <- c("New England", "Middle Atlantic", "East North Central",
             "West North Central", "South Atlantic", "East South Central",
             "West South Central", "Mountain", "Pacific")
for (i in 1:length(hospDiv)) {
  categDf$hosp_division[categDf$hosp_division == i] <- hospDiv[i]
}


# Rename pay1
pay <- c("Medicare", "Medicaid", "Private insurance", 
         "Self-pay", "No charge", "Other")
for (i in 1:length(pay)) {
  categDf$pay1[categDf$pay1 == i] <- pay[i]
}


# Rename race
race <- c("White", "Black", "Hispanic", "Asian or Pacific Islander",
          "Native American", "Other")
for (i in 1:length(race)) {
  categDf$race[categDf$race == i] <- race[i]
}


# Rename zipinc_qrtl
incQt <- c("0-25th percentile", "26th to 50th percentile (median)",
           "51st to 75th percentile", "76th to 100th percentile")
for(i in 1:length(incQt)) {
  categDf$zipinc_qrtl[categDf$zipinc_qrtl == i] <- incQt[i]
}

# Rename column names
colnames(categDf) <- c("Admission Month", "Admission Weekday", 
                       "Died/Did not die", "Disposition", "Elective",
                       "Sex", "Hospital Division", "Primary payer", 
                       "Race", "Year", "Household Income")

head(categDf)



##### Exploratory Data Analysis ##### 

# Frequency Table for categorical variables
freqTable <- sapply(categDf, table)
freqTable

# Proportion Table
proportTable <- sapply(freqTable, prop.table)
proportTable


### Statistical testing ###
# Create a dataframe only for statistical testing
statTest <- dfJoins %>%
  select(age, los, totchg, aweekend, died, elective, female) %>%
  filter(age > 0, los > 0, totchg > 0, between(aweekend, 0,1), 
         between(died, 0,1), between(elective,0,1), 
         between(female,0,1))

# Correlation plot
plot_correlation(statTest)
#cor(statTest)


# Generalized Linear Model
 # Backwards elimination to analyze the relationship
 # between total charge and several independent variables




### Visualizations ###

# A - Annual Incidence #
annualIncidence <- dfJoins %>%
  select(flap, year) %>%
  group_by(year) %>%
  summarize(count = n()) %>%
  arrange(year)

ptAAnnualIncidence <- annualIncidence %>%
  ggplot(aes(x = year, y = count)) +
  ggtitle("Annual Flaps Incidence") +
  theme_minimal(base_size = 12) + 
  geom_line() +
  xlab("Year") +
  ylab("Annual Incidence")  

ptAAnnualIncidence


# D - Mean Annual Charge ($) #
meanAnnualCharge <- dfJoins %>%
  select(totchg, year) %>%
  filter(totchg > 0) %>%
  group_by(year) %>%
  summarize(avgCharge = mean(totchg)) %>%
  arrange(year)

ptDMeanCharge <- meanAnnualCharge %>%
  ggplot(aes(x = year, y = avgCharge)) +
  ggtitle("Mean Annual Total Charges of Flaps Procedures") +
  theme_minimal(base_size = 12) + 
  geom_line() +
  xlab("Year") +
  ylab("Mean Annual Charge($)") 

ptDMeanCharge 
