sentiment140
============

R package for sentiment text analysis
---- 

* **Easy to use**, quick to run your own sentiment analysis of any text 
* No additional installation of NLP components - it uses free sentiment140 service
* **No need** for vacaburary building
* Default language model is tuned for Twitter message, _context free grammer language model__ 
* Supported languge: English and Spanish

Installation
--- 
with *Rstudio* 
* Project menu -> New Project -> Version Control -> **Git**
* Paste following Repository URL: https://github.com/okugami79/sentiment140 
* Shift-Control b - to build R package 
* type library(sentiment) at R console,  start using it! 


without rstudio 
* download zip file from https://github.com/okugami79/sentiment140
* unzip  downloaded file 
  * for unix user, on terminal, where you unzip directory, type R CMD INSTALL sentiment140
  * for window user, **RGUI**, select *Packages menu* -> *Install package(s) from local zip files* 
  
* Added spanish and english language support 

* require internet connection 

For help in R,  
?sentiment 

or any issue contact me 
Chris okugami : http://www.facebook.com/christopher.okugami
