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
Chris Okugami : http://www.facebook.com/christopher.okugami

Manually, training your data specific NLP recogniser 
---- 
This R-blogger journal article provides you with other R package, NLP parser etc for training sentiment analyser. 

R-Blogger Article: "Sentiment analysis with machine learning in R" by Cheng-Jun Wang 
---- 

http://www.r-bloggers.com/sentiment-analysis-with-machine-learning-in-r/?utm_source=feedburner&utm_medium=email&utm_campaign=Feed%3A+RBloggers+%28R+bloggers%29





