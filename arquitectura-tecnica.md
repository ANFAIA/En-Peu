# Arquitectura técnica del proyecto


## Capa de adquisición de datos

### Origen de datos:

CSV de datos geoespaciales (pendiente, altitud, usos del suelo, etc).


### Procesamiento inicial:

Unificación de los datos en un dataframe.

Comprobación de valores faltantes.

Análisis exploratorio de datos para identificar outliers y comprobar normalidad.

Correlaciones (heatmap, Kruskal-Wallis, Cramers'V, etc.)


### Herramientas utilizadas:

R, RStudio, Jupyter Notebook.

### Librerías clave



## Capa de preparación y preprocesamiento

### Tratamientos aplicados:

Normalización de variables numéricas.

Conversión de la variable categórica AC a numérica (por media de grupo).


### Librerías clave:

tidyverse, caret, dplyr, forcats



## Capa de modelado y análisis

### Modelos aplicados:

Gradient Boosting Machine (GBM)

Random Forest (RF)

Support Vector Machine (SVM)


### Evaluación:

Validación cruzada (trainControl)


### Interpretabilidad con:

Importancia de variables (varImp)

Gráficos PDP (Partial Dependence Plots)




## Capa de visualización y resultados

### Gráficos generados:

Mapas de zonas de alta vulnerabilidad


### Herramientas:



## Repositorio y documentación


Código y documentación almacenados en GitHub.

README.md con:

Descripción del proyecto

Instrucciones para reproducir el análisis

Listado de dependencias

Resultados principales

