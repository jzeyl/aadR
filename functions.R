#BROWSE DATABASE DATA
browse_audiograms<-function(){
  url<- "https://www.animalaudiograms.org/api/v1/browse"
  res <- GET("https://www.animalaudiograms.org/api/v1/browse")
  dat <- fromJSON(rawToChar(res$content))
  assign("browse",dat, envir = .GlobalEnv)
}

#GET AUDIOGRAM DATA FOR A GIVEN SPECIES
get_species<-function(name){
  #load audiogram brower from url
  browse_audiograms()

  #find id numbers for that species
  idlist<-browse$id[browse$species_name==name]

  #get audiogram for that as a list
  audiogramlst<-list()
  for (i in idlist) {
    # ... make some data
    url<- paste0("https://www.animalaudiograms.org/api/v1/audiogram?id=",i)
    res <- GET(url)
    print(url)
    dat<- fromJSON(rawToChar(res$content))
    dat$i <- i  # maybe you want to keep track of which iteration produced it?
    dat$species<-as.character(name)
    audiogramlst[[i]] <- dat # add it to your list
  }
  #convert list of single audiograms to a dataframe

  big_data <- do.call(rbind, audiogramlst)
  assign(paste0("audiograms_",name),big_data,envir = .GlobalEnv)
}

#SHOW WHICH SPECIES ARE AVAILABLE IN THE DATABASE
species_available<-function(common = FALSE){
  url<- "https://www.animalaudiograms.org/api/v1/browse"
  res <- GET("https://www.animalaudiograms.org/api/v1/browse")
  dat <- fromJSON(rawToChar(res$content))
  if(common == TRUE){
    print(unique(dat$vernacular_name_english))
  }
  else{print(unique(dat$species_name))
  }
}


SPL_units <- read_json("SPL units.json", simplifyVector = TRUE)
