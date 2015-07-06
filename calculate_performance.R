# function to calculate performance values

ns_discharge = discharge_table$ns_efficiency
ns_discharge[which(ns_discharge < 0.00)] = 0.00
average_ns_discharge = mean(ns_discharge, na.rm = TRUE)
#
baseflow_deviation_relative = abs(baseflow_table$avg_baseflow_deviation/baseflow_table$average_iwmi_opt_baseflow)
baseflow_deviation_relative[which(baseflow_deviation_relative > 2.00)]   = 2.00
baseflow_deviation_relative[which(is.na(baseflow_deviation_relative) )]  = 2.00
baseflow_deviation_relative[which(is.nan(baseflow_deviation_relative) )] = 2.00
#~ baseflow_deviation_relative = floor(baseflow_deviation_relative*100)/100
baseflow_deviation = mean(baseflow_deviation_relative, na.rm = FALSE)
#
general_performance = average_ns_discharge / (1+baseflow_deviation)
#~ general_performance = mean(ns_discharge/(1+ baseflow_deviation))
