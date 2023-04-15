# aadR
Scripts to connect to the [animal audiogram database API](https://github.com/MfN-Berlin/AnimalAudiogramDatabase_API/tree/1ff02de608924474f04ca25752a1539b8e7f92b9) to import audiograms into R.

|Function name|Task|
|--|--|
|species_available()|Prints list of species available in the database e.g. |
|browse_audiograms()|browse_audiograms() will create a dataframe with all the available species in the database, named 'aad_audiograms'|
|get_species()|get_species("Eretmochelys imbricata") will create a dataframe with audiogram data for a specific species. 'audiograms_speciesname'|



## Dependencies:  
library(jsonlite)  
library(httr)  
library(ggplot2)  
library(dplyr)  
