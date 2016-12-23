# library("readr")
# sea <- read_csv("data/SEA.csv")
# indxDest <- which(sea["Dest"] == "SEA")
# sea <- sea[indxDest,]
sea <- readRDS("FlightsToSeattle.rds")
# Drop obs with missing ArrTime:
sea <- sea[!is.na(sea[["ArrTime"]]),]
fracHour <- sea[["ArrTime"]] %/% 100 + (sea[["ArrTime"]] %% 100) / 60
