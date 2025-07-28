# Project Updates

This file will be used to document the updates of the project.

---

## Ultimas actualizaciones

**28/07/2025**

Se ha entrenado un nuevo modelo de Support Vector Machine (SVM) para predecir la PLA. Se han comparado los resultados de los tres modelos (Random Forest, GBM y SVM) y se han generado nuevos gráficos de comparación de métricas.

- Comparación de métricas R2, RMSE y MAE entre los tres modelos:
  <img src="../images/R2_gbm_rf_svm.png" />
  <img src="../images/RMSE_gbm_rf_svm.png" />
  <img src="../images/MAE_gbm_rf_svm.png" />

Además, se han generado Partial Dependence Plots (PDPs) para analizar la influencia de las variables más importantes en las predicciones del modelo Random Forest.

- Partial Dependence Plots:
  <img src="../images/PDPs.png" />

---

**22/07/2025**

Se ha generado un nuevo gráfico de dispersión para visualizar la relación entre los valores de PLA predichos y los observados. Este gráfico ayuda a evaluar la precisión del modelo de Random Forest.

- Gráfico de dispersión de valores predichos vs. observados:
  <img src="../images/dispersion_observado_predicho.png" />

---

**18/07/2025**

Se han entrenado dos modelos de machine learning, Gradient Boosting (con XGBoost) y Random Forest, para predecir la profundidad de la lámina de agua (PLA). Los modelos fueron evaluados y comparados, y se generaron las siguientes visualizaciones:

- Mapa de las predicciones del modelo Random Forest en comparación con los valores reales:
  <img src="../images/mapa_predicciones_PLA.png" />

- Mapa del error absoluto de las predicciones:
  <img src="../images/mapa_error_absoluto.png" />

El modelo Random Forest mostró un rendimiento superior y fue guardado para futuras predicciones. Los datos de las predicciones y los valores reales se guardaron en `mapa_PLA_real_predicho.csv`.

- Comparación de métricas R2, RMSE y MAE entre los dos modelos:
  <img src="../images/R2_gbm_rf.png" />
  <img src="../images/RMSE_gbm_rf.png" />
  <img src="../images/MAE_gbm_rf.png" />


---

**17/07/2025**

Se transformaron los datos para prepararlos para el modelado. Las variables numéricas fueron escaladas utilizando `MinMaxScaler` de `sklearn` y las variables categóricas (`CUS` y `OC`) fueron codificadas con `OneHotEncoder` de `sklearn` . El conjunto de datos transformado se guardó como `data_fin.csv`.

---

**14/07/2025**

Tras observar valores atípicos en los boxplots, se observaron los mapas de las variables A y P, siendo los siguientes.

Mapa con los datos obtenidos de Altitud del terreno:

<img src="../images/Altitud.png" />


Mapa con los datos obtenidos de Pendiente del terreno:

<img src="../images/Pendiente.png" />


Estos datos han sido corregidos, y a continuación se muestran los mapas nuevos para estas variables:


Mapa con los datos obtenidos de Altitud del terreno:

<img src="../images/Altitud.png" />


Mapa con los datos obtenidos de Pendiente del terreno:

<img src="../images/Pendiente.png" />




A partir de estos datos, los nuevos histogramas y boxplots son así:

<img src="../images/histogramas_analisis_exploratorio.png" />

<img src="../images/boxplot_analisis_exploratorio.png" />


Y el heatmap que muestra la correlación de variables numéricas es el siguiente:


<img src="../images/heatmap_correlacion.png" />


**10/07/2025**

Se llevó a cabo un análisis exploratorio de los datos. Se generaron histogramas y boxplots para visualizar la distribución de las variables numéricas e identificar valores atípicos.

- Histogramas de las variables:

<img src="../archivos_viejos/histogramas_analisis_exploratorio_viejo.png" />


- Boxplots de las variables:

<img src="../archivos_viejos/boxplot_analisis_exploratorio_viejo.png" />


Se realizó un análisis de correlación entre las variables. Se generó un heatmap para visualizar la correlación entre las variables numéricas, y se realizaron tests de Cramer's V y Kruskal-Wallis para analizar la asociación entre variables categóricas y entre variables categóricas y numéricas.

- Heatmap de correlación:

<img src="../archivos_viejos/heatmap_correlacion_viejo.png" />


Para variables categóricas se hizo el test de Cramer's V, obteniendo una asociación moderada, y para variables categóricas con respecto a variables numéricas se hizo el test de Kruskall Wallis, que indicó que todas las variables tienen una asociación significativa entre ellas.



**1-10/07/2025**

Se realizó la limpieza de los datos. Se eliminaron filas y columnas innecesarias, se transformaron variables categóricas a numéricas y se guardó el conjunto de datos limpio como `data_stored.csv`.
