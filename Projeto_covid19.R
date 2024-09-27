# Carregar pacotes
library(dplyr)
library(ggplot2)

# Carregar dados
covid_data <- read.csv("C:/Users/nicol/OneDrive/Desktop/estudos/projeto_cv19_gh/CV19")

# Remover NAs e agrupar por país
dados_resumidos <- covid_data %>%
  group_by(country) %>%
  summarise(total_cases = sum(total_cases, na.rm = TRUE))

# Selecionar os 10 países com mais casos
top_n_dados <- dados_resumidos %>% top_n(10, total_cases)

# Criar gráfico de barras
ggplot(top_n_dados, aes(x = reorder(country, total_cases), y = total_cases)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Top 10 Países com Total de Casos",
       x = "País",
       y = "Total de Casos") +
  theme_minimal()
