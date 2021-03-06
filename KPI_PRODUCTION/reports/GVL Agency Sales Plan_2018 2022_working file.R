source('KPI_PRODUCTION/Common functions.R')

path = "d:\\workspace_excel\\GVL\\DOMS\\SP 18-22\\"
exceltemplate = paste(path, "1.0. GVL Agency Sales Plan_2018 2022_working file (July 2017)_Tung_updated_170823.xlsx", sep = '')
excelFile = paste(path, sprintf("1.0. GVL Agency Sales Plan_2018 2022_working file (July 2017)_Tung_updated_%s.xlsx", strftime(Sys.time(),'%Y%m%d')), sep = '')
# sheet North -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

df=report_kpi_segmentation(criteria = "where territory='NORTH' and value != 'NA'")
df=tidyr::spread(df, time_view, value)
# set rownames equal to column1: trim leading and trailing whitespace (left trim, right trim) 
rownames(df)<-gsub("^\\s+|\\s+$", "", df[,'kpi'])

replace_cellvalue2.1_set_cell_color(df,
                                    sheetname="Agency North",
                                    rowNameColIndex = 1,
                                    headerRowIndex = 1,
                                    template=exceltemplate,
                                    result_file=excelFile, '#,##0', "#FF00FF")

RDCOMClient_replace_cellvalues(
  df=df,
  excelfile=excelFile,
  newexcelfile = excelFile,
  sheetname="Agency North",
  visible=F,
  rowNameColIndex=1,
  headerRowIndex=1
)




# fill genlion 
df=report_kpi_segmentation(criteria = "where upper(territory)='GEN LION NORTH' and kpi like '%GENLION%' and value != 'NA' ")
df=tidyr::spread(df, time_view, value)
# set rownames equal to column1: trim leading and trailing whitespace (left trim, right trim) 
rownames(df)<-gsub("^\\s+|\\s+$", "", df[,'kpi'])
df1 = df[startsWith(df$kpi, 'Activity Ratio_by_rookie_GENLION'),]
df2 = df[!startsWith(df$kpi, 'Activity Ratio_by_rookie_GENLION'),]
replace_cellvalue2.1_set_cell_color(df1,
                                    sheetname="Agency North",
                                    rowNameColIndex = 1,
                                    headerRowIndex = 1,
                                    template=excelFile,
                                    result_file=excelFile, '0%', "3")
replace_cellvalue2.1_set_cell_color(df2,
                                    sheetname="Agency North",
                                    rowNameColIndex = 1,
                                    headerRowIndex = 1,
                                    template=excelFile,
                                    result_file=excelFile, '#,##0', "3")
# *** ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

df=report_kpi_segmentation(criteria = "where territory='SOUTH' and value != 'NA' ")
df=tidyr::spread(df, time_view, value)
# set rownames equal to column1: trim leading and trailing whitespace (left trim, right trim) 
rownames(df)<-gsub("^\\s+|\\s+$", "", df[,'kpi'])


replace_cellvalue2.1_set_cell_color(df,
                                    sheetname="Agency South",
                                    rowNameColIndex = 1,
                                    headerRowIndex = 1,
                                    template=excelFile,
                                    result_file=excelFile, '#,##0', "#FF00FF")

RDCOMClient_replace_cellvalues(
  df=df,
  excelfile=excelFile,
  newexcelfile = excelFile,
  sheetname="Agency South",
  visible=F,
  rowNameColIndex=1,
  headerRowIndex=1
)

# fill genlion 
df=report_kpi_segmentation(criteria = "where upper(territory)='GEN LION SOUTH' and kpi like '%GENLION%' and value != 'NA' ")
df=tidyr::spread(df, time_view, value)
# set rownames equal to column1: trim leading and trailing whitespace (left trim, right trim) 
rownames(df)<-gsub("^\\s+|\\s+$", "", df[,'kpi'])
df1 = df[startsWith(df$kpi, 'Activity Ratio_by_rookie_GENLION'),]
df2 = df[!startsWith(df$kpi, 'Activity Ratio_by_rookie_GENLION'),]
replace_cellvalue2.1_set_cell_color(df1,
                                    sheetname="Agency South",
                                    rowNameColIndex = 1,
                                    headerRowIndex = 1,
                                    template=excelFile,
                                    result_file=excelFile, '0%', "3")
replace_cellvalue2.1_set_cell_color(df2,
                                    sheetname="Agency South",
                                    rowNameColIndex = 1,
                                    headerRowIndex = 1,
                                    template=excelFile,
                                    result_file=excelFile, '#,##0', "3")

