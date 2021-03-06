
# folder for a specific scenario
folder = "/scratch/edwin/IWMI_calibration/version_01_dec_2014/uncalibrated/code__a__0/analysis/calibration/"

# read table containing discharge analysis
discharge_table_file = paste(folder, "monthly_discharge/summary.txt", sep="") 
discharge_table = read.table(discharge_table_file, header=T, sep= ";")

# read table containing baseflow analysis
baseflow_table_file  = paste(folder, "annual_baseflow/baseflow_summary.txt", sep="") 
baseflow_table = read.table(baseflow_table_file, header=T, sep= ";")

# calculate performance values
#
ns_discharge = discharge_table$ns_efficiency
ns_discharge[which(ns_discharge < 0.00)] = 0.00
average_ns_discharge = mean(ns_discharge, na.rm = TRUE)
#
baseflow_deviation_relative = abs(baseflow_table$avg_baseflow_deviation/baseflow_table$average_iwmi_opt_baseflow)
baseflow_deviation_relative[which(baseflow_deviation_relative > 1.50)] = 1.50
baseflow_deviation = mean(baseflow_deviation_relative, na.rm = TRUE)
baseflow_deviation = floor(baseflow_deviation*10)/10
#
general_performance = average_ns_discharge / (baseflow_deviation)

