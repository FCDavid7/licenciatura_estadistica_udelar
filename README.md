# Licenciatura en Estadística – Proyectos académicos

Repositorio central con trabajos prácticos, parciales y proyectos finales realizados durante la **Licenciatura en Estadística (Universidad de la República – UdelaR)**.

El repositorio reúne proyectos orientados al análisis estadístico, modelado predictivo, síntesis de evidencia y métodos computacionales, desarrollados íntegramente en R y documentados mediante informes académicos.

---

## Contenidos

El repositorio incluye proyectos correspondientes a las siguientes áreas de estudio:

* **[Predicción de Rendimiento Estudiantil (Machine Learning & Dashboards)](./Prediccion_Rendimiento_Estudiantil)**
  * Análisis de factores socioeconómicos, demográficos y académicos.
  * Implementación de árboles de decisión (Recursive Partitioning) para identificar perfiles de riesgo.
  * Desarrollo de una aplicación web interactiva en Shiny para la exploración visual de datos y apoyo en la toma de decisiones educativas.

* **[Meta-análisis (Efecto Pigmalión)](./Proyecto_Meta_Analisis)**
  * Síntesis de evidencia sobre la influencia de las expectativas docentes en el desempeño de los alumnos (basado en datos de Raudenbush, 1985).
  * Evaluación de heterogeneidad (modelos de efectos fijos y aleatorios), análisis de subgrupos e influencia de valores atípicos (outliers).
  * Análisis de sesgo de publicación (Funnel plots) y cálculos de potencia estadística (power analysis).

* **[Demografía & Modelado Poblacional](./Proyecto_Demografia)**
  * **Análisis Prospectivo y Dinámica Demográfica:** Estimación de estructura poblacional, patrones de fecundidad y tasas de mortalidad a partir de microdatos.
  * **Modelado Matricial & Pronósticos:** Implementación de tablas de vida (análisis de supervivencia) y matrices de Leslie para la proyección de cohortes y escenarios futuros de crecimiento.
  * **Impacto & Aplicación:** Generación de insumos cuantitativos clave para la planificación estratégica, evaluación de sostenibilidad sociodemográfica y políticas públicas.
  
---

## Estructura del repositorio

Cada proyecto se encuentra alojado en una carpeta independiente, la cual incluye por regla general:

* **Informe final (PDF):** Documento académico detallando el marco teórico y las conclusiones.
* **Código fuente:** Scripts en R, documentos `.Rmd` o archivos de Quarto (`.qmd`).
* **Imágenes y gráficos:** Visualizaciones exportadas y utilizadas en los reportes.
* **README.md específico:** Cada carpeta contiene un archivo explicativo con:
  * Descripción del problema.
  * Metodología aplicada.
  * Origen de los datos utilizados.
  * Resultados principales.
  * Instrucciones para reproducir el código localmente.

---

## Tecnologías y herramientas

* **Lenguaje:** R
* **Entornos:** RStudio
* **Documentación y Reportes:** R Markdown / Quarto
* **Desarrollo Web (Apps):** Shiny, shinydashboard
* **Paquetes estadísticos principales:** `tidyverse`, `rpart` (Árboles de decisión), `meta`, `metafor`, `dmetar`, `metapower` (Meta-análisis), `ggplot2`, entre otros.

---

## Estado del repositorio

*Repositorio activo y en constante expansión.* Utilizado actualmente como:
* Portafolio académico profesional.
* Respaldo estructurado de trabajos de curso.
* Base metodológica y de código para proyectos futuros en análisis de datos y modelado.