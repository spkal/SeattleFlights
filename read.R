sea <- readr::read_csv("data/SEA.csv")
indxDest <- which(sea[["Dest"]] == "SEA")
FlightsToSeattle <- sea[indxDest, ]
indxOrig <- which(sea[["Origin"]] == "SEA")
FlightsFromSeattle <- sea[indxOrig, ]
saveRDS(FlightsToSeattle, "FlightsToSeattle.rds")
saveRDS(FlightsFromSeattle, "FlightsFromSeattle.rds")
FlightsToSeattle <- readRDS("FlightsToSeattle.rds")
FlightsFromSeattle <- readRDS("FlightsFromSeattle.rds")
# Drop obs with missing ArrTime:
FlightsToSeattle <-
  FlightsToSeattle[!is.na(FlightsToSeattle[["ArrTime"]]),]
FlightsFromSeattle <-
  FlightsFromSeattle[!is.na(FlightsFromSeattle[["DepTime"]]),]
fracArrHour <- FlightsToSeattle[["ArrTime"]] %/% 100
  + (FlightsToSeattle[["ArrTime"]] %% 100) / 60
fracDepHour <- FlightsToSeattle[["DepTime"]] %/% 100
  + (FlightsToSeattle[["DepTime"]] %% 100) / 60
