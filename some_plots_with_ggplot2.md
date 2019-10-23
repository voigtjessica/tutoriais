## Plots with ggplot2 R

### Bar plot with labels and "fill"

Here I describe some codes to remember how I made the plots.

```{r}
df <- data.frame(situacao_da_obra = c(rep("Inacabada"), 4), rep("Paralisada", 4)), 
                 status_executado = c("Acima de 80%", "Até 10%", "Entre 10% e 30%", "Entre 30% e 50%", 
                 "Entre 50% e 80%", "Acima de 80%", "Até 10%", "Entre 10% e 30%", "Entre 30% e 50%",
                 "Entre 50% e 80%"),
                 total_obras = c(57, 149, 195, 146, 175,  27,  99, 172, 124, 108))
                 
df

#Ploting:

library(hrbrthemes)

#Fisrt, reordering
x$status_executado <- factor(x$status_executado, levels = c("Até 10%" ,"Entre 10% e 30%", "Entre 30% e 50%", 
                             "Entre 50% e 80%", "Acima de 80%" ))

ggplot(data=x, aes(x=status_executado, y=total_obras, fill=situacao_da_obra)) +
  geom_bar(stat="identity") + theme_ipsum() +
  geom_text(aes(label = total_obras), position = position_stack(vjust = 0.5)) +
  labs(fill = "Situação da obra" , 
       title = "Obras viáveis x Percentual executado") +
  xlab("Percentual executado") +  ylab("Qtde obras")

```

#### Result:

![alt text](https://github.com/voigtjessica/tutoriais/blob/master/files/obras_viaveis_perc.png?raw=true)

-------------

