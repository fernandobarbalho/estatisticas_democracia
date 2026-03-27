###O arquivo zipado do dado bruto total está disponível no google drive
#https://drive.google.com/file/d/1M4FVM542pw2zrHB4zHoVDa_xr8TUrUTl/view?usp=drive_link

library(tidyverse)

V_Dem_CY_Core_v16 <- read_csv("V-Dem-CY-Core-v16.csv")


nomes_colunas<- tibble(nome_coluna = names(V_Dem_CY_Core_v16))


dados_trabalho_libdem<-
  V_Dem_CY_Core_v16 %>%
  select(country_id, country_name, country_text_id, year, v2x_libdem, v2x_libdem_codelow, v2x_libdem_codehigh, v2x_libdem_sd) %>%
  filter(year>= 1960)


dados_trabalho_libdem %>%
  filter(country_text_id %in% c("BRA", "USA")) %>%
  ggplot(aes(x= year, y= v2x_libdem)) +
  geom_line(aes(color = country_name))
