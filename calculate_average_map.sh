
# removing all maps
rm *.map
rm *.nc

# copying the maps of landmask and cell area: 
cp /home/sutan101/data/limit_gw_abstraction_half_arc_degree/design_pumping_capacity/analysis_2005/landmask_iwmi.map .
cp /data/hydroworld/PCRGLOBWB20/input30min/routing/cellarea30min.map .

# average total groundwater abstraction
cdo timavg -selyear,2000/2008 ../../netcdf/totalGroundwaterAbstraction_annuaTot_output.nc totalGroundwaterAbstraction_annuaTot_output_avg2000to2008.nc
gdal_translate -of PCRaster NETCDF:"totalGroundwaterAbstraction_annuaTot_output_avg2000to2008.nc":total_groundwater_abstraction totalGroundwaterAbstraction_annuaTot_output_avg2000to2008.map
mapattr -c cellarea30min.map *.map
pcrcalc totalGroundwaterAbstraction_annuaTot_output_avg2000to2008_km3.map = "if(landmask_iwmi.map, totalGroundwaterAbstraction_annuaTot_output_avg2000to2008.map * cellarea30min.map / (1000000000.))"
aguila totalGroundwaterAbstraction_annuaTot_output_avg2000to2008_km3.map

# average fossil groundwater abstraction
cdo timavg -selyear,2000/2008 ../../netcdf/fossilGroundwaterAbstraction_annuaTot_output.nc fossilGroundwaterAbstraction_annuaTot_output_avg2000to2008.nc
gdal_translate -of PCRaster NETCDF:"fossilGroundwaterAbstraction_annuaTot_output_avg2000to2008.nc":fossil_groundwater_abstraction fossilGroundwaterAbstraction_annuaTot_output_avg2000to2008.map
mapattr -c cellarea30min.map *.map
pcrcalc fossilGroundwaterAbstraction_annuaTot_output_avg2000to2008_km3.map = "if(landmask_iwmi.map, fossilGroundwaterAbstraction_annuaTot_output_avg2000to2008.map * cellarea30min.map / (1000000000.))"
aguila fossilGroundwaterAbstraction_annuaTot_output_avg2000to2008_km3.map

# average groundwater recharge
cdo timavg -selyear,2000/2008 ../../netcdf/gwRecharge_annuaTot_output.nc gwRecharge_annuaTot_output_avg2000to2008.nc
gdal_translate -of PCRaster NETCDF:"gwRecharge_annuaTot_output_avg2000to2008.nc":groundwater_recharge gwRecharge_annuaTot_output_avg2000to2008.map
mapattr -c cellarea30min.map *.map
pcrcalc gwRecharge_annuaTot_output_avg2000to2008_km3.map = "if(landmask_iwmi.map, gwRecharge_annuaTot_output_avg2000to2008.map * cellarea30min.map / (1000000000.))"
aguila gwRecharge_annuaTot_output_avg2000to2008_km3.map

# average baseflow
cdo timavg -selyear,2000/2008 ../../netcdf/baseflow_annuaTot_output.nc baseflow_annuaTot_output_avg2000to2008.nc
gdal_translate -of PCRaster NETCDF:"baseflow_annuaTot_output_avg2000to2008.nc":baseflow baseflow_annuaTot_output_avg2000to2008.map
mapattr -c cellarea30min.map *.map
pcrcalc baseflow_annuaTot_output_avg2000to2008_km3.map = "if(landmask_iwmi.map, baseflow_annuaTot_output_avg2000to2008.map * cellarea30min.map / (1000000000.))"
aguila baseflow_annuaTot_output_avg2000to2008_km3.map

# average renewable groundwater abstraction (nonFossilGroundwaterAbstraction_annuaTot_output)
cdo timavg -selyear,2000/2008 ../../netcdf/nonFossilGroundwaterAbstraction_annuaTot_output.nc nonFossilGroundwaterAbstraction_annuaTot_output_avg2000to2008.nc
gdal_translate -of PCRaster NETCDF:"nonFossilGroundwaterAbstraction_annuaTot_output_avg2000to2008.nc":non_fossil_groundwater_abstraction nonFossilGroundwaterAbstraction_annuaTot_output_avg2000to2008.map
mapattr -c cellarea30min.map *.map
pcrcalc nonFossilGroundwaterAbstraction_annuaTot_output_avg2000to2008_km3.map = "if(landmask_iwmi.map, nonFossilGroundwaterAbstraction_annuaTot_output_avg2000to2008.map * cellarea30min.map / (1000000000.))"
aguila nonFossilGroundwaterAbstraction_annuaTot_output_avg2000to2008_km3.map

