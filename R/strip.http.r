# parse text of twitt message, create extract http text, return

strip.http<-function(x)
{
  .internal<-function(x)
  {
    y=unlist(strsplit(x,split='[\ \n\t]'))
    
    if( length(y) >= 1 ) 
    {
      #find index doesn't have http following suffix of ://    
      return( paste( y[grepl('http',y) == 0], collapse=" " ) )
    } else
    {
      if( grep('http',x)==0 ) return(x) else return(NA)
    }
    
  }
  
  # main 
  if(is.vector(x))
  {
    return( unlist(lapply(x,FUN=.internal))) 
  }
  else 
    .internal(x)
  
}


# checking with 
#TEXT.TMP <- strip.http(TEXT)
#IDX<- grepl('http', TEXT.TMP)

# TEXT.TMP <- strip.http(TEXT)
# strip.http("http://t.co/SwkjhJhcxI" )

# unit tests 
#strip.http('xx http://123.htm yy')
#strip.http('http://xxx http://xx')
#strip.http() 
#strip.http("") 


