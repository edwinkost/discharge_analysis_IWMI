
import os
import pcraster as pcr
import sys

# clone file name
ldd_file_name = "/data/hydroworld/PCRGLOBWB20/input30min/routing/lddsound_30min.map"

# set clone
pcr.setclone(ldd_file_name)

# working directory (obtained from the argument)
working_directory = str(sys.argv[1]) 

# type of analysis: monthly discharge or annual baseflow
analysis_type = str(sys.argv[2])

# station/catchment map (based on the system argument)
if sys.argv[3] == "calibration": station_catchment_file_name = "station_map/calibration/calibration_station.map"
if sys.argv[3] == "validation" : station_catchment_file_name = "station_map/validation/validation_station.map"
station_catchment_map = pcr.readmap(station_catchment_file_name)

# using R to prepare a pcraster table
cmd = "R -f create_table_performance "+working_directory+" "+analysis_type
print cmd
os.system(cmd)

# plot in the pcraster format
performance = pcr.lookupscalar(working_directory+"/performance.txt", station_catchment_map)
pcr.report(performance, working_directory+"/performance.map")

