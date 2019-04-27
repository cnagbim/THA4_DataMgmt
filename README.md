# THA4_DataMgmt
This take home assignment analysis and workflow were developed by Chinelo Agbim.

Problem statement: Many in the Environmental Justice community are beginning to push for more clean energy (especially rooftop pv solar)
to be put in lower income and more vulerable communities. In order for there to be any sort of development there needs to be a
high potential for power generation. This analysis thus is of the correlation between county level social vulnerability 
and solar rooftop potential. I focus on Texas specifically.

Specifically, operationalize the data using pearson "r" coefficient of correlation.
We answer:

1) What's the pearson "r" coefficiant between social vulnerability index and the 
percentage of pv solar energy potential that are on lmi resdidantial buidings?

2)What's Pearson "r" coefficiant between social vulnerability index and 
percentage of lmi resdidantial buidings suitable for pv solar?

RESULTS show moderate positive correlation for both question ~0.50. p values generated in ".R"script indicate significance of results
This means the most vulnerable communities do not necessarily indicate solar potential alone. 

Workflow: <tha4_workflow_agbim.io> and <tha4_workflow.png> worflow in 2 different formats

R files:
<THA4_DataMgmt.Rproj> project files to direct the script
<tha4_full_script.R> code/script used to clean data and run analysis

SOURCES:

Raw File: <pv_rooftop_county_lmi_pct_gwh.csv>
Data Source: National Renewable Energy Lab (NREL), Energy Affordability and Access in Focus

LMI Solar Rooftop Annual Generation Potential (as a % of Total Residential Potential) - All U.S. County

Description: This layer maps the total Low-to-Moderate Income (0-80% AMI) annual generation potential for rooftop PV as a percentage of the 
total residential annual generation potential, at the County-level. 
Mapping the percent LMI potential provides a better understanding of the relative LMI solar potential opportunities for each county,
regardless of population density. Attributes included in this layer include both percent LMI generation potential and 
percent LMI suitable building count. In addition to these percentage attributes, we provide the total LMI and total residential
values for both generation potential (GWh) and suitable building count, for each county.

The data NREL used to create the dataset was from 2013-2017 American Community Survey

Website: <https://www.arcgis.com/apps/MapJournal/index.html?appid=7cbbe0063c1f49b0b167f604f8f40576>
Date Accessed: 4/29/2019

Raw file: <Texas_COUNTY.csv>
Data Source: Center for Disease Control (CDC), Social Vulnerability Index (SVI)

Social Vulnerability Index measures a communities resilience and adaptability after a disaster happens.
It is broken down into 4 "theme" areas that are then aggregated to give a total vulnerability score.
That total score is the variable "RPL_Themes". The data that the CDC used to create this dataset is from 2016.

The themes:
1) Socioeconomic status, 
2) Household composition and disability,
3) Minority Status and Language,
4)Housing and Transportation.
The score is a percentile of vulnerability compared to other census tract communities.
A higher score means the community is more susceptible to despair when a disaster occurs.


Website: <https://svi.cdc.gov/data-and-tools-download.html>
Date Accessed: 4/29/2019

File: <SVI2016Documentation.pdf>
File of data description/documentation that downloaded with the CDC's SVI file discussed above.
Website: <https://svi.cdc.gov/data-and-tools-download.html>
Date Accessed: 4/29/2019

OUTPUTS:

File: <merged_svi_pv_lmi.csv>
Cleaned and merged file of social vulnerability index, the percentage of pv solar energy potential that are on lmi resdidantial buidings, 
and percentage of lmi resdidantial buidings suitable for pv solar. The file also contains county names.

File: <Data_dictionary.csv>
Explains the variables in the <merged_svi_pv_lmi.csv> file.


File:<corr_svi_potential.csv>
Pearson "r" coefficiant between social vulnerability index and the 
percentage of pv solar energy potential that are on lmi resdidantial buidings.

File: <corr_svi_bldgs.csv>
Pearson "r" coefficiant between social vulnerability index and percentage of lmi resdidantial buidings suitable for pv solar
