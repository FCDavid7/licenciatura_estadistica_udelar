# Meta-análisis: El Efecto Pigmalión y las expectativas docentes (dataset dat.raudenbush1985)

## Descripción

Este proyecto realiza un meta-análisis sobre el "Efecto Pigmalión" en el ámbito educativo, analizando si las expectativas de los docentes influyen causalmente en el rendimiento intelectual (CI) de los estudiantes. Se utiliza el dataset `dat.raudenbush1985`, el cual reúne la evidencia de diversos estudios experimentales independientes con resultados contradictorios, aplicando técnicas de síntesis cuantitativa para llegar a una conclusión unificada.

## Objetivos

* Estimar el tamaño del efecto promedio de las expectativas docentes sobre el CI.
* Cuantificar y evaluar la heterogeneidad entre los diferentes estudios analizados.
* Identificar estudios influyentes y valores atípicos (*outliers*) que impacten en la varianza global.
* Examinar posibles sesgos de publicación y evaluar la robustez de los hallazgos mediante simulación de datos faltantes.
* Realizar un análisis de potencia estadística retrospectivo para la muestra global.

## Datos

* **Dataset:** `dat.raudenbush1985` (disponible en el ecosistema de paquetes de meta-análisis de R).
* **Efectos:** Diferencia de Medias Estandarizada (SMD) sobre el Cociente Intelectual.
* **Tamaño:** 19 tamaños de efecto provenientes de 19 estudios independientes.
* **Variables disponibles (por muestra):**
  * `study`: identificador numérico del estudio
  * `author`: autor y año de publicación
  * `yi`: tamaño del efecto observado (SMD)
  * `vi`: varianza del tamaño del efecto
  * `n1i` / `n2i`: tamaños muestrales de los grupos experimental y control
* **Nota:** el dataset proviene de una fuente pública del ecosistema de R (paquete `metadat` / `metafor`).

## Metodología

* **Transformación de tamaños de efecto:** cálculo del error estándar (`seTE`) a partir de la varianza para los modelos de diferencias estandarizadas (SMD).
* **Modelo principal:** modelo de efectos aleatorios utilizando el estimador REML (*Restricted Maximum Likelihood*) para estimar el efecto promedio.
* **Heterogeneidad:** evaluación de heterogeneidad total entre estudios (estadístico $Q$ de Cochrane e índice $I^2$).
* **Sensibilidad e Influencia:** análisis exploratorio de valores atípicos (*Leave-One-Out*, gráficos de Baujat y GOSH) mediante `dmetar`.
* **Sesgo de publicación y robustez:** * Prueba de regresión de Egger y método de *Trim-and-Fill*.
  * Simulación de 4 escenarios de datos faltantes (aleatorios y fijos).
  * Análisis de potencia estadística retrospectivo utilizando `metapower`.

## Resultados principales (resumen)

* Las expectativas de los docentes muestran un leve efecto positivo aunque no estadísticamente significativo sobre el rendimiento intelectual de los estudiantes.
* Se observa una heterogeneidad sustancial entre estudios ($I^2 \approx 50\%$), sugiriendo que el tamaño del efecto varía según el contexto de cada experimento.
* La remoción de estudios atípicos específicos (identificados en el análisis de influencia) estabiliza fuertemente la varianza no explicada ($\tau^2$).
* Los análisis complementarios (simulación de datos faltantes, sesgo de publicación y potencia estadística) apoyan la robustez de la conclusión general, descartando que el efecto sea un mero artefacto de estudios no publicados.

## Cómo reproducir

1. Clonar el repositorio.
2. Abrir el proyecto en RStudio.
3. Instalar las dependencias de R (`meta`, `metafor`, `metapower`, y `dmetar` vía GitHub).
4. Ejecutar el script principal o compilar el informe:
   * **Informe_MetaAnalisis.qmd** para generar el PDF (Quarto).
   * **script_metaanalisis.R** para ejecutar el código de limpieza, modelado y gráficos.

## Estructura del proyecto

```text
/MetaAnalisis_Efecto_Pigmalion
 ├── README.md                  # Este archivo
 ├── Informe_MetaAnalisis.qmd   # Informe (Quarto / R Markdown)
 ├── Informe_MetaAnalisis.pdf   # Salida / Informe académico compilado
 └── script_metaanalisis.R      # Scripts de análisis, simulación y modelado

## Autoría
* **Autores:** David Fernández & Franco Vicario
* **Institución:** Facultad de Ciencias / Licenciatura en Estadística – Universidad de la República (UdelaR)

---
