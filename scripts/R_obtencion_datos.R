library(dplyr)
library(readr)
library(tidyr)

# Ruta de la carpeta donde están los archivos CSV
carpeta <- "D:/HUGO/MAtriX/variables" 

# Para leer todos los archivos csv dentro de esa carpeta
archivos <- list.files(path = carpeta, pattern = "*.csv", full.names = TRUE)

# Leer y combinar los archivos 1 por 1
data <- NULL

for (archivo in archivos) {
  df <- read.csv(archivo)
  # El valor de la variable se llama Value, y está siempre en la ultima columna
  # entonces: renombrar la última columna usando el prefijo antes del "–"
  nuevo_nombre <- gsub(" .*", "", gsub("–.*", "", basename(archivo)))  
  nuevo_nombre <- gsub(" ", "", nuevo_nombre)  # Elimina espacios
  
  if (length(names(df)) > 0) {
    names(df)[length(names(df))] <- nuevo_nombre  # Renombra la última columna
    print(paste0(nuevo_nombre," Numero de datos: ",nrow(df)))
  }
  
  if (is.null(data)) {
    data <- df  # Si es el primer archivo, se asigna directamente
  } else {
    columnas_comunes <- intersect(names(data), names(df))  # Ccolumnas comunes
    data <- full_join(data, df, by = columnas_comunes)  # Une por esas columnas
  }
}

# Mostrar las primeras filas de data
print(head(data,4))
# Ver si hay valores faltantes en este punto
print(table(is.na(data)))

# Cargar el nuevo CSV PLA con separador ";" y decimales con ","
archivo_nuevo <- "D:/HUGO/MAtriX/variables/PLA/CSV_PLA_19_05_25.csv"
df_nuevo <- read.csv(archivo_nuevo)

# Seleccionar las coordenadas y la columna grid_cod, renombrándola como PLA
df_nuevo <- df_nuevo %>% select(POINT_X, POINT_Y, Value) %>% rename(PLA = Value)

# Convertir coordenadas a un mismo tipo (por ejemplo, numérico)
df_nuevo <- df_nuevo %>%
  mutate(POINT_X = as.numeric(POINT_X),
         POINT_Y = as.numeric(POINT_Y))

data <- data %>%
  mutate(POINT_X = as.numeric(POINT_X),
         POINT_Y = as.numeric(POINT_Y))


coordenadas_comunes <- left_join(data %>% select(POINT_X, POINT_Y), df_nuevo %>% select(POINT_X, POINT_Y), by = c("POINT_X", "POINT_Y"))
print(paste("Número de coordenadas coincidentes:", nrow(coordenadas_comunes)))


# Unir el nuevo CSV con data
data <- inner_join(data, df_nuevo, by = c("POINT_X", "POINT_Y"))

# Reordenar las columnas para que PLA sea la tercera
columnas_ordenadas <- c("POINT_X", "POINT_Y", "PLA", setdiff(names(data), c("POINT_X", "POINT_Y", "PLA")))
data <- data[, columnas_ordenadas]

# Mostrar las primeras filas del dataset combinado
print(head(data))

table(is.na(data))

# Guardar el resultado en un nuevo CSV
write_csv(data, "datos_combinados.csv")