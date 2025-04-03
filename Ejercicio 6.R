#Ejercicio 6a ####
library(tidyverse)
library(janitor)
library(ggstats)
library(stats)
library(ggplot2)

Tabla_supervivientes <- titanic %>% 
  count(Survived) %>% 
  rename(Frecuencia = n) %>% 
  mutate(`Frecuencia Relativa` = Frecuencia / sum(Frecuencia),
         `Frecuencia Relativa Porcentual`= `Frecuencia Relativa`*100)

#inciso b

tabla_embarque <- titanic %>% 
  filter(!is.na(Embarked)) %>% 
  count(Embarked) %>% 
  rename(Frecuencia = n) %>% 
  mutate(`Frecuencia Relativa` = Frecuencia / sum(Frecuencia),
         `Frecuencia Relativa Porcentual`= `Frecuencia Relativa`*100)

ggplot(tabla_embarque, aes(x=Embarked, y=Frecuencia, fill=Embarked))+
  geom_col() #Grafico sobre la tabla

#tratar de graficar sobre la base de datos

ggplot(titanic, aes(x=Embarked, fill = Embarked))
  geom_bar()
  
  

#inciso C
tabla_c <- titanic %>% 
  count(Survived, Pclass) %>% 
  pivot_wider(names_from = Survived,values_from = n)
  
  
tabla_c1 <- tabla_c %>% 
  adorn_percentages("row")
  
tabla_c2 <- tabla_c %>% 
  adorn_percentages("col")
  
  
  #inciso D
tabla_d <- titanic %>% 
  mutate(intervalos=cut(Fare,11)) %>% 
  count(intervalos) %>% 
  rename(Frecuencia = n)
  
 ggplot(data = tabla_d, aes(x=intervalos, )) +
   geom_histogram(binwidth = 10, fill = "lightblue",
                  col = "black", boundary = 0)
   


nclass.Sturges(titanic $Fare)

  
