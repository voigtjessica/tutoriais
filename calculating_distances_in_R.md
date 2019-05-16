---
title: "Calculating distances in R"
author: "Jessica Voigt"
date: "16 de maio de 2019"
output: html_document
---

This tutorial will show how to calculate distances using ggmaps::mapdist()

1. Get a API key - tutorial in portuguese: [https://jtemporal.com/gerando-chaves-api-google/](https://jtemporal.com/gerando-chaves-api-google/)

2. To use mapdist() function, enable the Distance Matrix API

3. Code:

```{r, echo = F, eval = TRUE, warning=FALSE}

library(ggmap)  

gkey <- "zzz"

register_google(key = gkey)

mapdist("Avenida Paulista, 150, São Paulo - SP, Brazil",
        "Rua Professor João Marinho, 161, São Paulo - SP, Brazil",
        "driving", "simple")

```
