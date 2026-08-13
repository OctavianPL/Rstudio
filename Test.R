library(usethis)


#3 zródła CSV, XLSX I HTTPS
#Sprawdz dane i polaczyc joinami


library(readxl)
library(dplyr)
gitcreds_set()

setwd("C:/Users/User/OneDrive/Pulpit/R")
getwd()
avai_doc <- read_excel("avaible.xlsx", sheet="dane")
exp_heatlh <- read.csv("exp.csv")
life_exp <- read.csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")

str(exp_heatlh)
str(avai_doc)
str(life_exp)

connected2 <- left_join(avai_doc,exp_heatlh, by = "kraj")


con_final <- inner_join(connected2, life_exp, by = c("kraj" = "country", "rok" = "year"))

summary(con_final)

plot(con_final$lifeExp, con_final$wydatki_zdrowie_pct_pkb, xlab = "Life expectancy", ylab="Health care expenditure as per capita",
     main = "Oczekiwana długość życia a Wydatki w % PKB")

model <- lm(lekarze_na_1000 ~ gdpPercap, data = con_final)
summary(model)
