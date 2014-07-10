Exploratory Data Analysis: Project 1
=======================================

## Background
This project deals with massaging data and creating several, increasingly complicated plots using the base package in R.  
The data comes from the [UCI Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/) and is the data set concerned with [Electric Power Consumption](http://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption)

## Data Modifications
For this project, the entire 2,000,000+ data was loaded into memory, however only the data for February 1st - 2nd, 2007 was used to plot.  Other than that, no modifications or renaming was performed on the dataset.  There were no missing values when the data was originally downlaoded from the website.  If the reader wished to use the code in this repository, then the unzipped file needs to be in the working directory for the code to function

## Naming Conventions
The naming scheme was not altered for this project

## Attribute Names and Descriptions

1:Date: Date in format dd/mm/yyyy  
2:Time: time in format hh:mm:ss  
3:Global_active_power: household global minute-averaged active power (in kilowatt)  
4:Global_reactive_power: household global minute-averaged reactive power (in kilowatt)  
5:Voltage: minute-averaged voltage (in volt)  
6:Global_intensity: household global minute-averaged current intensity (in ampere)  
7:Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).  
8:Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.  
9:Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.  
