library(jsonlite)
library(httr)
library(ggplot2)
library(dplyr)

source("functions.R")

#BROWSE DATABASE DATA
browse_audiograms()


#SHOW WHICH SPECIES ARE AVAILABLE IN THE DATABASE
species_available(common = TRUE)#common names
species_available(common = FALSE)#scientific names

#GET AUDIOGRAM DATA FOR A GIVEN SPECIES
get_species("Phoca largha")
get_species("Gobius cruentatus")


##PLOTTING
library(ggplot2)
`audiograms_Gobius cruentatus`

plot_audiograms<-function(df){
  withspl<-`audiograms_Phoca largha` %>%
    inner_join(SPL_units, by = c("sound_pressure_level_reference_id" = "id"), keep = TRUE)


  plt<-ggplot(withspl, aes(testtone_frequency_in_khz, sound_pressure_level_in_decibel, group = audiogram_experiment_id)) +
    geom_line() +
    scale_x_log10()+
    #annotate(geom = text, y = max(sound_pressure_level_in_decibel, na.rm = TRUE),x = median(testtone_frequency_in_khz,na.rm = TRUE),
    #              label = paste0("ok"))+
    labs(x= "Frequency (kHz)", y = "SPL in dB")+
    facet_wrap(vars(audiogram_experiment_id), scales = "free_y")
  plt

  print(unique(withspl$sound_pressure_level_reference_id))
#print(paste0("ID "))
}



plot_audiograms(`audiograms_Phoca largha`)
plot_audiograms(`audiograms_Gobius cruentatus`)

df


fromJSON(temp) %>% as.data.frame


