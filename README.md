sentiment140
sentiment140
============

R package for Twitter sentiment text analysis
---- 

If you want quick, **no NLP training**, headache free sentiment analysis with Twitter text/grammar in R. __Try this one!__  


* **Easy to use**, quick to run your own sentiment analysis of Twitter context free grammer

* No additional installation of NLP components - it uses free sentiment140 service, they do vocaburay training, syntax of hash, http link etc. 

* **No need** for vacaburary building

* Default language model is tuned for Twitter message, _context free grammer language model__ 

* Supported languge: English and Spanish

Installation
--- 
require(devtools) 

install_github('sentiment140', 'okugami79')

library(sentiment)
>sentiment('I LOVE #Apple')

>sentiment('I hate #Apple')

or you can just pass vector of string message 


For help in R,  
?sentiment 

or any issue contact me 
Chris okugami : http://www.facebook.com/christopher.okugami
