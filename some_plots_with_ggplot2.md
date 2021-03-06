## Plots with ggplot2 R

Here I describe some codes to remember how I made the plots.

### Simple bar plot

```{r}
df <- data.frame(situacao_da_obra = c(rep("Inacabada"), 4), rep("Paralisada", 4)), 
                 status_executado = c("Acima de 80%", "Até 10%", "Entre 10% e 30%", "Entre 30% e 50%", 
                 "Entre 50% e 80%", "Acima de 80%", "Até 10%", "Entre 10% e 30%", "Entre 30% e 50%",
                 "Entre 50% e 80%"),
                 total_obras = c(57, 149, 195, 146, 175,  27,  99, 172, 124, 108))

#Ploting:                 

library(hrbrthemes)

# Draw plot
ggplot(atendimento, aes(x=atendimento, y=total_pedidos)) + 
  geom_bar(stat="identity", width=.5, fill="grey") + 
  labs(title="Atendimento", 
       caption="fonte: Transparência Brasil") + theme_ipsum() +
  geom_text(aes(y = total_pedidos, label = perc), color = "black", 
            position = position_stack(vjust = 0.5)) +
  theme(axis.text.x = element_text( vjust=0.6)) +
  xlab("") +  ylab("Total pedidos")
```

#### Result:

![alt text](https://github.com/voigtjessica/tutoriais/blob/master/files/grafico1%20-%20atendimento.jpeg?raw=true)


### Bar plot with labels and "fill"

```{r}
df <- data.frame("atendimento" = c("Atendido", "Não Atendido", "Parcialmente Atendido"), 
                 "total_pedidos" = c(351,106,66),
                 "perc" = c("67%", "20%", "13%"))
                 
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


### Pie plot 

```{r}
#Data frame
df <- data.frame("atendimento" = c("Atendido", "Não Atendido", "Parcialmente Atendido"), 
                 "total_pedidos" = c(351,106,66),
                 "perc" = c("40 %", "12 %", "8 %"))

#Plot

mycols <- c("#ffa600", "#ff6361", "#bc5090", "#58508d")

ggplot(df, aes(x="", y=total_pedidos, fill=atendimento)) +
  geom_bar(width = 1, stat = "identity", color = "white") +
  coord_polar("y", start = 0)+
  geom_text(aes(y = total_pedidos, label = perc), color = "black", 
            position = position_stack(vjust = 0.6))+
  scale_fill_manual(values = mycols) +
  theme_void() +
  labs(fill = "Atendimento" , 
       title = "Atendimento a pedidos feitos à universidades e institutos federais")

```

#### Result:

![alt text](https://github.com/voigtjessica/tutoriais/blob/master/files/grf1.jpeg?raw=true)


-------------


### Geom_point with colour gradient

The original df is available [here](https://docs.google.com/document/d/1o6cPIE2t86Xo1r-eoeA0cpXvBODZHOEMgsPVfiTQ5d4/edit?usp=sharing)

```{r}

plot <- df %>%
  mutate(destino = gsub("IF FLUMINENSE", "IF-FLUMINENSE", destino),
         sigla= gsub(" .*", "", destino),
         tempo_resposta = as.numeric(tempo_resposta)) %>%
  ggplot(aes(num_pedidos, tempo_resposta, label=sigla, colour = tempo_resposta)) +
  geom_point(size = 1.5) +
  scale_colour_gradient(low = "#6ec3ff", high = "#ff0000") +
  scale_y_continuous(breaks=c(0, 20, 30, 40, 50, 60, 70, 80)) +
  labs(y="Tempo médio de resposta (dias)", 
       x="Pedidos recebidos", 
       title="Tempo de resposta por pedidos recebidos",
       colour = NULL) +
  theme(legend.position = "bottom",
        legend.box = "vertical") +
  geom_hline(yintercept = 20, color="grey", linetype="dashed")
  
plot + 
  geom_smooth(method="lm", se=F) +
  geom_label_repel(aes(label = ifelse(num_pedidos>300 | tempo_resposta > 20 ,
                                      as.character(sigla),'')),
                   box.padding   = 0.35, 
                   point.padding = 0.5,
                   segment.color = 'grey50') +
  theme_classic()
  
  ```
  
  ####Result:
  
  ![alt text](https://github.com/voigtjessica/tutoriais/blob/master/files/tempo%20por%20quantidade%20de%20pedido.png?raw=true)
