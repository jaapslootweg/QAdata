#export rda to csv files, for editing

# make temp folder if it doesn't exist
if (!dir.exists("temp/")) {
  cat("add temp to your gitignore")
  dir.create()
}
load("AQData.rda")
for (dfname in names(AQData)) {
  df = AQData[[dfname]]
  write.csv(df, paste("temp/", dfname, ".csv", sep = ""))
}
