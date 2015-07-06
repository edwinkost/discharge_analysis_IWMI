
# working directory
output_directory = "/scratch/edwin/30min_22_jun_2015/rerun_for_iwmi/calibration_27_june_2015/code__a__0/analysis/calibration/monthly_discharge/"
output_directory = commandArgs()[4]
print(output_directory)

# type of analysis: monthly discharge or annual baseflow
analysis_type = commandArgs()[5]

# summary table file name
table_file_name = "/scratch/edwin/30min_22_jun_2015/rerun_for_iwmi/calibration_27_june_2015/code__a__0/analysis/calibration/monthly_discharge/summary.txt"
if (analysis_type == "monthly_discharge") {table_file_name = paste(output_directory,"/summary.txt",sep="")} else {print(analysis_type)}
if (analysis_type == "annual_baseflow" )  {table_file_name = paste(output_directory,"/baseflow_summary.txt",sep="")} else {print(analysis_type)}

# reading the performance table
table = read.table(table_file_name,header=T,sep=";")

# only using the relevant performance
if (analysis_type == "monthly_discharge") {table = data.frame(table$id_from_grdc, table$ns_efficiency)} else {print(analysis_type)}
if (analysis_type == "annual_baseflow" )  {table = data.frame(table$id_from_grdc, table$avg_baseflow_deviation)} else {print(analysis_type)}

# remove all NA and NAN
table = table[which(!is.nan(table[,2])),]
table = table[which( !is.na(table[,2])),]

# sort the table
table = table[order(table[,1]),]

# write to a pcraster table
table = rbind(c(-9,1),table)
write.table(table,file=paste(output_directory,"/performance.txt",sep=""),sep="\t",row.names = FALSE,col.names=FALSE)


