#
# mod: 2013-10-30, add auto language detection added. 
# reference: http://help.sentiment140.com/api 

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
                sprintf('{"language": "auto", "data": [%s]}', x),
              url = "http://www.sentiment140.com/api/bulkClassifyJson", 
              verbose = verbose,
              post = 1L, 
              writefunction = r$update)
  
  r$value()
  
  # list item to JSON 
  j <- fromJSON(r$value()) 
  j$language <- NULL 
  
  k <-  ldply(j, as.data.frame, stringsAsFactors=FALSE) 
  idx.text     <- grep("text", names(k))
  idx.polarity <- grep("polarity", names(k))
  idx.lang     <- grep("language", names(k))
  
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
} # output 
  
  if( length(idx.text) == 1)
  {
    j<-k[,2:4]
    names(j) <-c('text','polarity','language') 
    output()
    return (j )
  } else  # multiple case  
  {
    text=unlist( k[,idx.text] )
    names(text) <- NULL 
    
    polarity=unlist( k[,idx.polarity]) 
    names(polarity) <- NULL 
    
    language=unlist( k[,idx.lang]) 
    names(language) <- NULL 
    
    # note: R crash on wide character, trick them reading by csv file. 
    TFILE=tempfile()
    cat(      
    sprintf('"%s",%s,"%s"\n', text,unlist(polarity),unlist(language), sep=','),
    file=TFILE) 
    
    j<-read.csv(file=TFILE, header=FALSE)
    names(j) <- c('text','polarity','language')
        
    output()
    return ( j )     
    
  }
  

}


