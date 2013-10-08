#
#  Todo: add anomaly of sensitement of tweet 
#  todo: classification of anomaly with using word cloud 
#

sentiment <- function(text, verbose=FALSE)
{
  require(RCurl)
  require(rjson)
  require(plyr)
  
  r <- dynCurlReader()  
  
  # get rid of single quote 
  text <- gsub("'", ' ' ,text)
  text <- gsub('"', ' ' ,text)
  
  x  <- paste( sprintf("{'text': '%s'}", text),
         collapse = "," ) 
  
  
  curlPerform(postfields =   
                sprintf("{'data': [%s]}", x),
              url = "http://www.sentiment140.com/api/bulkClassifyJson", 
              verbose = verbose,
              post = 1L, 
              writefunction = r$update)
  
  r$value()
   
  # list item to JSON 
  j <- fromJSON(r$value()) 
  k <-  ldply(j, as.data.frame, stringsAsFactors=FALSE) 
  idx.text     <- grep("text", names(k))
  idx.polarity <- grep("polarity", names(k))
   
output <-function()
{
  #   The polarity values are:
  #   0: negative
  #   2: neutral
  #   4: positive
  #    
  #
  label<-function(key.value,key.string) 
  {
    idx= j$polarity == key.value
    if ( sum(idx) > 0 ) 
      j[idx,]$polarity <<- key.string 
  }
  
  label(0, "negative")
  label(2, "neutral" )
  label(4, "positive" )  
  }
  
  if( length(idx.text) == 1)
  {
    j<-k[,2:3]
    names(j) <-c('text','polarity') 
    output()
    return (j )
  } else  # multiple case  
  {
    text=unlist( k[,idx.text] )
    names(text) <- NULL 
    
    polarity=unlist( k[,idx.polarity]) 
    names(polarity) <- NULL 
    
    
    j<- data.frame(text=text,
                   polarity= unlist(polarity) )
            
    output()
    return ( j )     
    
  }
  

}


