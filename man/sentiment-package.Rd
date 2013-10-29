\name{sentiment-package}
\alias{sentiment-package}
\alias{sentiment}
\docType{package}
\title{
Sentimental text analysis in R 
}
\description{
Sentiment text analysis tool in R without no NLP compoment installation. It uses sentiment140 web service engine through internet, provides instant negative, positive, neutral text expression recognition, tune to Twitter text analysis.

It supports English and Spanish ONLY at this time! 

}

\author{
chris okugami
Maintainer: chris.okugami <chris.okugami@csiro.au>
}
\references{
sentiment140 API docuementation 
http://help.sentiment140.com/for-students
}

\keyword{ package }
\seealso{
}

\examples{
# ++ possitive expression example ++
sentiment('I love my apple')

#             text polarity language
#1 I love my apple positive       en

# ++ negative expression example ++
sentiment('I hate my apple')


RESULT=sentiment(c('I hate my apple','I love my apple')) 

#             text polarity language
#1 I hate my apple negative       en
#2 I love my apple positive       en

#> table(RESULT$polarity)
#negative  positive 
#      1         1 
      
# Batch processing example 
data(twitter)
head(key.1$text)
x<-sentiment(key.1$text)

}

