Sys.getenv("JAVA_HOME")
Sys.setenv(JAVA_HOME = '/Library/Java/JavaVirtualMachines/jdk1.8.0_351.jdk/Contents/Home/jre')
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_351.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

# 패키지 다운로드
install.fun <- function(){
  install.packages('rJava')
  install.packages('KoNLP')
  install.packages('wordcloud')
  install.packages('wordcloud2')
  install.packages('slam')
  install.packages('Sejong')
  install.packages('hash')
  install.packages('tau')
  install.packages('devtools')
  install.packages('tm')
  install.packages('RSQLite')
  install.packages('httr')
  install.packages('XML')
  install.packages('rlang')
  install.packages('stringr')
  install.packages('curl')
  install.packages('arules')
  install.packages('igraph')
}
install.fun

# 패키지 로딩
library.fun <- function(){
  library(rJava)
  library(KoNLP) # 세종사전
  library(wordcloud) # RColorBrewer()함수 제공
  library(wordcloud2)
  library(slam) 
  library(Sejong)
  library(hash)
  library(tau)
  library(devtools)
  library(tm) # 영문 텍스트 마이닝
  library(RSQLite)
  library(httr)
  library(XML)
  library(rlang)
  library(stringr)
  library(curl)
  library(arules)
  library(igraph)
}
library.fun()


# 실시간 뉴스 수집과 분석 
# 뉴스1
url <- "https://search.naver.com/search.naver?where=news&query=2014%20%EB%B8%8C%EB%9D%BC%EC%A7%88%20%EC%9B%94%EB%93%9C%EC%BB%B5%20%EC%9A%B0%EC%8A%B9%20%ED%9B%84%EB%B3%B4%20%EC%98%88%EC%B8%A1&sm=tab_opt&sort=1&photo=0&field=0&pd=3&ds=2014.06.01&de=2014.07.13&docid=&related=0&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so%3Add%2Cp%3Afrom20140601to20140713&is_sug_officeid=0"
web <- GET(url)
web

html <- htmlTreeParse(web,useInternalNodes=T,trim=T,encoding="utf-8")
html
rootNode <- xmlRoot(html)
rootNode

news1 <- xpathSApply(rootNode,"//*[@id='main_pack']/section/div/div[2]/ul",xmlValue)
news1

news_pre1 <- gsub('[\r\n\t]', '', news1)
news_pre1 <- gsub('[a-z]','',news_pre1)
news_pre1 <- gsub('[A-Z]','',news_pre1)
news_pre1 <- gsub('\\s+',' ',news_pre1)
news_pre1 <- gsub('[[:cntrl:]]','',news_pre1)
news_pre1 <- gsub('[[:punct:]]','',news_pre1)
news_pre1 <- gsub('\\d+',' ',news_pre1)
news_pre1 <- gsub('네이버뉴스','',news_pre1)
news_pre1 <- gsub('독일과','독일',news_pre1)
news_pre1

# 뉴스2
url <- "https://search.naver.com/search.naver?where=news&sm=tab_pge&query=2014%20%EB%B8%8C%EB%9D%BC%EC%A7%88%20%EC%9B%94%EB%93%9C%EC%BB%B5%20%EC%9A%B0%EC%8A%B9%20%ED%9B%84%EB%B3%B4%20%EC%98%88%EC%B8%A1&sort=1&photo=0&field=0&pd=3&ds=2014.06.01&de=2014.07.15&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so:dd,p:from20140601to20140715,a:all&start=1"
web <- GET(url)
web

html <- htmlTreeParse(web,useInternalNodes=T,trim=T,encoding="utf-8")
html
rootNode <- xmlRoot(html)
rootNode

news2 <- xpathSApply(rootNode,"//*[@id='main_pack']/section/div/div[2]/ul",xmlValue)
news2

news_pre2 <- gsub('[\r\n\t]', '', news2) 
news_pre2 <- gsub('[a-z]','',news_pre2)
news_pre2 <- gsub('[A-Z]','',news_pre2)
news_pre2 <- gsub('\\s+',' ',news_pre2)
news_pre2 <- gsub('[[:cntrl:]]','',news_pre2)
news_pre2 <- gsub('[[:punct:]]','',news_pre2)
news_pre2 <- gsub('\\d+',' ',news_pre2)
news_pre2 <- gsub('네이버뉴스','',news_pre2)
news_pre2

# 뉴스3
url <- "https://search.naver.com/search.naver?where=news&sm=tab_pge&query=2014%20%EB%B8%8C%EB%9D%BC%EC%A7%88%20%EC%9B%94%EB%93%9C%EC%BB%B5%20%EC%9A%B0%EC%8A%B9%20%ED%9B%84%EB%B3%B4%20%EC%98%88%EC%B8%A1&sort=1&photo=0&field=0&pd=3&ds=2014.06.01&de=2014.07.15&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so:dd,p:from20140601to20140715,a:all&start=31"
web <- GET(url)
web

html <- htmlTreeParse(web,useInternalNodes=T,trim=T,encoding="utf-8")
html
rootNode <- xmlRoot(html)
rootNode

news3 <- xpathSApply(rootNode,"//*[@id='main_pack']/section/div/div[2]/ul",xmlValue)
news3

news_pre3 <- gsub('[\r\n\t]', '', news3) 
news_pre3 <- gsub('[a-z]','',news_pre3)
news_pre3 <- gsub('[A-Z]','',news_pre3)
news_pre3 <- gsub('\\s+',' ',news_pre3)
news_pre3 <- gsub('[[:cntrl:]]','',news_pre3)
news_pre3 <- gsub('[[:punct:]]','',news_pre3)
news_pre3 <- gsub('\\d+',' ',news_pre3)
news_pre3 <- gsub('네이버뉴스','',news_pre3)
news_pre3

# 뉴스4
url <- "https://search.naver.com/search.naver?where=news&sm=tab_pge&query=2014%20%EB%B8%8C%EB%9D%BC%EC%A7%88%20%EC%9B%94%EB%93%9C%EC%BB%B5%20%EC%9A%B0%EC%8A%B9%20%ED%9B%84%EB%B3%B4%20%EC%98%88%EC%B8%A1&sort=1&photo=0&field=0&pd=3&ds=2014.06.01&de=2014.07.15&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so:dd,p:from20140601to20140715,a:all&start=51"
web <- GET(url)
web

html <- htmlTreeParse(web,useInternalNodes=T,trim=T,encoding="utf-8")
html
rootNode <- xmlRoot(html)
rootNode

news4 <- xpathSApply(rootNode,"//*[@id='main_pack']/section/div/div[2]/ul",xmlValue)
news4

news_pre4 <- gsub('[\r\n\t]', '', news4) 
news_pre4 <- gsub('[a-z]','',news_pre4)
news_pre4 <- gsub('[A-Z]','',news_pre4)
news_pre4 <- gsub('\\s+',' ',news_pre4)
news_pre4 <- gsub('[[:cntrl:]]','',news_pre4)
news_pre4 <- gsub('[[:punct:]]','',news_pre4)
news_pre4 <- gsub('\\d+',' ',news_pre4)
news_pre4 <- gsub('네이버뉴스','',news_pre4)
news_pre4

# 뉴스5
url <- "https://search.naver.com/search.naver?where=news&sm=tab_pge&query=2014%20%EB%B8%8C%EB%9D%BC%EC%A7%88%20%EC%9B%94%EB%93%9C%EC%BB%B5%20%EC%9A%B0%EC%8A%B9%20%ED%9B%84%EB%B3%B4%20%EC%98%88%EC%B8%A1&sort=1&photo=0&field=0&pd=3&ds=2014.06.01&de=2014.07.15&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so:dd,p:from20140601to20140715,a:all&start=41"
web <- GET(url)
web

html <- htmlTreeParse(web,useInternalNodes=T,trim=T,encoding="utf-8")
html
rootNode <- xmlRoot(html)
rootNode

news5 <- xpathSApply(rootNode,"//*[@id='main_pack']/section/div/div[2]/ul",xmlValue)
news5

news_pre5 <- gsub('[\r\n\t]', '', news5) 
news_pre5 <- gsub('[a-z]','',news_pre5)
news_pre5 <- gsub('[A-Z]','',news_pre5)
news_pre5 <- gsub('\\s+',' ',news_pre5)
news_pre5 <- gsub('[[:cntrl:]]','',news_pre5)
news_pre5 <- gsub('[[:punct:]]','',news_pre5)
news_pre5 <- gsub('\\d+',' ',news_pre5)
news_pre5 <- gsub('네이버뉴스','',news_pre5)
news_pre5

#뉴스 통합
news_pre <- str_c(news_pre1,news_pre2)
news_pre <- str_c(news_pre,news_pre3)
news_pre <- str_c(news_pre,news_pre4)
news_pre <- str_c(news_pre,news_pre5)
news_pre

write.table(news_pre,"news1.txt")


# 토픽 분석 
# 세종 사전에 없는 단어 추가
useSejongDic() # 세종 사전 불러오기
mergeUserDic(data.frame(c("브라질","독일","아르헨티나","프랑스"), c("ncn"))) 
# ncn -명사지시코드

# 명사 추출
exNouns <- function(x) { paste(extractNoun(as.character(x)), collapse=" ")}
news_noun <- sapply(news_pre, exNouns) 


# 단어 처리
newsCorpus <- Corpus(VectorSource(news_noun))
TDM <- TermDocumentMatrix(newsCorpus, control=list(wordLengths=c(4,16)))
TDM
tdm.df <- as.data.frame(as.matrix(TDM))
tdm.df

wordResult <- sort(rowSums(tdm.df),decreasing=T)
wordResult <- wordResult[-c(1:7,9)]
wordResult


myNames <- names(wordResult)
df <- data.frame(word=myNames, freq=wordResult)
df
pal <- brewer.pal(12,"Paired")

# 워드 클라우드 생성
wordcloud(df$word,df$freq,min.freq=2,random.order=F,scale=c(4,0.7),
          rot.per=0.1,colors=pal,family="AppleGothic")


wordcloud2(data=df , size =.5,color='random-light', backgroundColor="black")


# 연관어 분석 
news_A <- read.table("news1.txt",encoding="UTF-8")
news_A <- str_split(news_A,"저장하기")
news_A
write.table(news_A,"news3.txt")

news_B <- file("news3.txt",encoding="UTF-8")
news_C <- readLines(news_B)
news_C <- str_replace_all(news_C,"바로가기","")
news_C <- str_replace_all(news_C,"저장","")
news_C <- str_replace_all(news_C,"언론사","")
news_C
lword <- Map(extractNoun, news_C)  
length(lword)

lword <- unique(lword)
length(lword)

lword <- sapply(lword, unique)
length(lword)

# 전처리
filter1 <- function(x){
  nchar(x) <= 4 && nchar(x) >= 2 && is.hangul(x)
}

filter2 <- function(x){
  Filter(filter1, x)
}

lword <- sapply(lword, filter2)
lword


wordtran <- as(lword, "transactions")
wordtran 

tranrules <- apriori(wordtran, parameter=list(supp=0.3, conf=0.05)) 

inspect(tranrules)

rules <- labels(tranrules, ruleSep=" ")  
rules 
class(rules)

rules <- sapply(rules, strsplit, " ",  USE.NAMES=F) 
rules
class(rules) 

rulemat <- do.call("rbind", rules)
rulemat
class(rulemat)


ruleg <- graph.edgelist(rulemat[c(10:50),], directed=F)
ruleg

plot.igraph(ruleg, vertex.label=V(ruleg)$name,
            vertex.label.cex=1.2, vertex.label.color='black', 
            vertex.size=20, vertex.color='green', vertex.frame.color='blue',
            vertex.label.family='AppleGothic')


