# Copyright 2019 Province of British Columbia
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.

source("header.R")

#Read in DFO conservation Unit data
DFO_ConUnit <- read.csv(file=file.path(DataDir,'DFO_NUSEDS/Conservation_Unit_Data.csv'), header=TRUE)
#Read in DFO NUSED Data
DFO_NUSEDS <- read.csv(file=file.path(DataDir,'DFO_NUSEDS/NUSEDS_20190117.csv'), header=TRUE)

SALMONSPAWNINGZONES.gdb

Salmon_gdb <- list.files(file.path(DataDir), pattern = ".gdb", full.names = TRUE)[1]
fc_list <- st_layers(Salmon_gdb)
SockChan<-read_sf(Salmon_gdb, layer = 'SockeyeSpwngStrmChanls')
# Read as sf and calculate road lengths
roads_sf <- read_sf(Rd_gdb, layer = "integrated_roads") %>%
  mutate(rd_len = st_length(.))
