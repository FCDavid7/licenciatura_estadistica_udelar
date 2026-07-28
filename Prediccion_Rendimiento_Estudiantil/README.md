# Proyecto Final – Análisis y Predicción del Rendimiento Estudiantil (Portugal)

## Descripción
Este proyecto implementa tres componentes principales orientados al análisis de datos educativos y Machine Learning:

1) **Análisis exploratorio y procesamiento de datos (Data Wrangling)** de bases de datos relacionales de estudiantes de secundaria (asignaturas Matemática y Portugués), evaluando factores demográficos, socioeconómicos y académicos.
2) **Modelado predictivo (Machine Learning)** mediante algoritmos de partición recursiva (Árboles de decisión) para identificar variables clave que influyen en las calificaciones y detectar perfiles de riesgo de desaprobación.
3) **Desarrollo de un producto de datos interactivo** (Dashboard en Shiny) para la exploración visual del rendimiento académico y apoyo en la toma de decisiones.

Caso de estudio: **Estudiantes de secundaria en Portugal** (escuelas Gabriel Pereira y Mousinho da Silveira), utilizando el *Student Performance Data Set* (UCI Machine Learning Repository).

## Objetivos
- Explorar la distribución demográfica y socioeconómica de los estudiantes.
- Identificar los factores personales, familiares y académicos con mayor influencia en la calificación final (G3).
- Entrenar un modelo de clasificación algorítmica (Árboles de decisión) para predecir el riesgo de fracaso escolar.
- Desarrollar una aplicación web interactiva que permita a usuarios no técnicos visualizar métricas y simular perfiles estudiantiles.

## Metodología

### Parte 1 — Procesamiento de datos y Análisis Exploratorio (EDA)
- Integración de los conjuntos de datos de Matemática y Portugués mediante uniones relacionales (`left_join`).
- Limpieza, recodificación de variables (hábitos de estudio, ausentismo) y resolución de discrepancias en los registros.

### Parte 2 — Modelado Predictivo
- Implementación de árboles de decisión (Recursive Partitioning) con el paquete `rpart`.
- Visualización de las reglas de clasificación y nodos de segmentación de alumnos mediante `rpart.plot`.

### Parte 3 — Aplicación Interactiva (Dashboard)
- Creación de un Dashboard utilizando `shiny` y `shinydashboard` para dinamizar la exploración de los perfiles de riesgo y cruzar variables en tiempo real.

## Herramientas y tecnologías
- Lenguaje: **R**
- Paquetes principales: `tidyverse`, `rpart`, `rpart.plot`, `shiny`, `shinydashboard`
- Formato de informe: **Quarto (.qmd) → PDF**

## Estructura del proyecto
/report
  Informe_Rendimiento_Estudiantil.qmd    # Informe principal (código fuente en Quarto)
  Informe_Rendimiento_Estudiantil.pdf    # Informe académico renderizado
/data
  student-mat.csv       # Dataset de Matemática
  student-por.csv       # Dataset de Portugués
/app
  app.R                 # Código de la aplicación interactiva (Shiny)

## Resultados principales (resumen)
- Se identificaron las variables socioeconómicas e institucionales que más impactan en la calificación final (G3).
- El modelo de árbol de decisión logró segmentar exitosamente a los estudiantes en grupos de alto y bajo riesgo de desaprobación, generando reglas fácilmente interpretables.
- El Dashboard interactivo demostró ser una herramienta útil para que autoridades educativas puedan tomar decisiones basadas en evidencia (Data-Driven) y aplicar apoyo temprano de manera focalizada.

##  Requisitos y Reproducción

### Requisitos previos
Para ejecutar el código y renderizar el informe es necesario contar con **R** y **RStudio**, además de tener instalados los siguientes paquetes:

```r
install.packages(c("tidyverse", "rpart", "rpart.plot", "vip", "parsnip", "ranger", "shiny", "shinydashboard"))

## Autoría
* **Autores:** David Fernández & Franco Vicario
* **Institución:** Facultad de Ciencias / Licenciatura en Estadística – Universidad de la República (UdelaR)

---