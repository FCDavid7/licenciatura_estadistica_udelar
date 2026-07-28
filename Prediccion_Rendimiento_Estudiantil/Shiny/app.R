library(shiny)
library(shinydashboard)
library(tidyverse)

# Cargar datos
student_total <- readRDS("student_total.rds")

# Crear columnas categóricas
orden_cal <- c("Insuficiente", "Suficiente", "Satisfactorio", "Bueno", "Excelente")

student_total <- student_total %>%
  mutate(
    calificacion_final_mat = case_when(
      G3_mat >= 16 ~ "Excelente",
      G3_mat >= 14 ~ "Bueno",
      G3_mat >= 12 ~ "Satisfactorio",
      G3_mat >= 10 ~ "Suficiente",
      TRUE ~ "Insuficiente"
    ),
    calificacion_final_por = case_when(
      G3_por >= 16 ~ "Excelente",
      G3_por >= 14 ~ "Bueno",
      G3_por >= 12 ~ "Satisfactorio",
      G3_por >= 10 ~ "Suficiente",
      TRUE ~ "Insuficiente"
    ),
    calificacion_final_mat = factor(calificacion_final_mat, levels = orden_cal),
    calificacion_final_por = factor(calificacion_final_por, levels = orden_cal)
  )

# UI
ui <- dashboardPage(
  dashboardHeader(title = "Rendimiento Académico"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Notas Finales", tabName = "notas", icon = icon("chart-bar")),
      br(),
      selectInput("escuela", "Escuela:",
                  choices = c("Todas", unique(student_total$school))),
      sliderInput("edad", "Edad:",
                  min = min(student_total$age),
                  max = max(student_total$age),
                  value = c(min(student_total$age), max(student_total$age))),
      selectInput("materia", "Materia:",
                  choices = c("Matemáticas", "Portugués")),
      selectInput("ocupacion_madre", "Ocupación de la Madre:",
                  choices = c("Todas", unique(student_total$Mjob))),
      selectInput("ocupacion_padre", "Ocupación del Padre:",
                  choices = c("Todas", unique(student_total$Fjob))),
      sliderInput("filtro_nivel_acad", "Nivel educativo del Padre/Madre:",
                  min = 1, max = 4, value = c(1, 4)),
      selectInput("parent_edu", "Nivel educativo de:", choices = c("Madre", "Padre")),
      selectInput("zona", "Zona de residencia:",
                  choices = c("Todas", "Urbana" = "U", "Rural" = "R")),
      selectInput("internet", "Acceso a Internet:",
                  choices = c("Todas", "Sí" = "yes", "No" = "no")),
      selectInput("schoolsup", "Apoyo escolar:",
                  choices = c("Todas", "Sí" = "yes", "No" = "no")),
      selectInput("famsup", "Apoyo familiar:",
                  choices = c("Todas", "Sí" = "yes", "No" = "no"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "notas",
              fluidRow(
                box(title = "Distribución de Notas Finales", width = 12, status = "primary",
                    solidHeader = TRUE, plotOutput("plotNotas")),
                box(title = "Resumen", width = 12, status = "info",
                    verbatimTextOutput("resumenNotas"))
              )
      )
    )
  )
)

# SERVER
server <- function(input, output) {
  
  datos_filtrados <- reactive({
    df <- student_total %>%
      filter(age >= input$edad[1], age <= input$edad[2])
    
    if (input$escuela != "Todas") df <- df %>% filter(school == input$escuela)
    if (input$zona != "Todas") df <- df %>% filter(address == input$zona)
    if (input$internet != "Todas") df <- df %>% filter(internet == input$internet)
    if (input$schoolsup != "Todas") df <- df %>% filter(schoolsup == input$schoolsup)
    if (input$famsup != "Todas") df <- df %>% filter(famsup == input$famsup)
    if (input$ocupacion_madre != "Todas") df <- df %>% filter(Mjob == input$ocupacion_madre)
    if (input$ocupacion_padre != "Todas") df <- df %>% filter(Fjob == input$ocupacion_padre)
    
    return(df)
  })
  
  output$plotNotas <- renderPlot({
    df <- datos_filtrados()
    
    if (input$parent_edu == "Madre") {
      df <- df %>% filter(Medu >= input$filtro_nivel_acad[1], Medu <= input$filtro_nivel_acad[2])
    } else {
      df <- df %>% filter(Fedu >= input$filtro_nivel_acad[1], Fedu <= input$filtro_nivel_acad[2])
    }
    
    if (nrow(df) == 0) {
      ggplot() + annotate("text", x = 1, y = 1, label = "No hay datos para los filtros seleccionados") + theme_void()
    } else if (input$materia == "Matemáticas") {
      ggplot(df, aes(x = calificacion_final_mat, fill = school)) +
        geom_bar(position = "dodge") +
        labs(x = "Categoría", y = "Cantidad", title = "Notas Finales - Matemáticas") +
        theme_minimal()
    } else {
      ggplot(df, aes(x = calificacion_final_por, fill = school)) +
        geom_bar(position = "dodge") +
        labs(x = "Categoría", y = "Cantidad", title = "Notas Finales - Portugués") +
        theme_minimal()
    }
  })
  
  output$resumenNotas <- renderText({
    df <- datos_filtrados()
    
    if (input$parent_edu == "Madre") {
      df <- df %>% filter(Medu >= input$filtro_nivel_acad[1], Medu <= input$filtro_nivel_acad[2])
      categorias <- df$calificacion_final_mat
    } else {
      df <- df %>% filter(Fedu >= input$filtro_nivel_acad[1], Fedu <= input$filtro_nivel_acad[2])
      categorias <- df$calificacion_final_por
    }
    
    n <- nrow(df)
    
    if (n == 0) return("No hay estudiantes que cumplan con los filtros seleccionados.")
    
    resumen <- df %>%
      count(Categoria = categorias) %>%
      mutate(porcentaje = round(n / sum(n) * 100, 1),
             texto = paste0(Categoria, ": ", porcentaje, "%")) %>%
      pull(texto)
    
    paste0("Cantidad de estudiantes filtrados: ", n, "\n",
           "Distribución porcentual: ", paste(resumen, collapse = " | "))
  })
}

# Ejecutar app
shinyApp(ui = ui, server = server)



