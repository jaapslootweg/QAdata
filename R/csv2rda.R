#export rda to csv files, for editing

# check latest AQData.rda, temp folder and csv file names
load("AQData.rda")
if (!dir.exists("temp/")) {
  cat("csv's are expected in temp\\")
}
csvFiles <- list.files("temp", "*.csv")
expectedDfNames <- gsub(".csv", "", csvFiles)
notFoundNames <- expectedDfNames[!expectedDfNames %in% names(AQData)]
askSure <- F
if (length(notFoundNames)> 0) {
  askSure <- T
  warning(paste("not found", notFoundNames))
}

notFoundFiles <- names(AQData)[!names(AQData) %in% expectedDfNames]
if (length(notFoundFiles)> 0) {
  askSure <- T
  warning(paste("not found", notFoundFiles))
}

if (askSure && readline(prompt="Enter 'y' or the action is cancelled :") == "y") {
  for (fname in expectedDfNames) {
    df <- read.csv(paste("temp/", fname, ".csv", sep = ""))
    AQData[[fname]] <- df
  }
  save(AQData, file = paste("data", "AQData.rda", sep = "/"))
}
