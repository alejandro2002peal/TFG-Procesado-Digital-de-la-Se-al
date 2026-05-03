# Procesado Digital de la Señal Aplicado a la Música

Autor: Alejandro Aranda Martínez  
Titulación: Grado en Ingeniería de Sistemas de Telecomunicación  
Universidad: Escuela Técnica Superior de Ingeniería de Telecomunicación (Universidad de Málaga)  
Año: 2026  

---

##  Descripcion del proyecto.

Este repositorio contiene el código fuente íntegro desarrollado para mi Trabajo de Fin de Grado. El proyecto implementa una arquitectura algorítmica de Procesado Digital de Señales (DSP) orientada al análisis, mejora y parametrización de señales musicales en el plano tiempo-frecuencia. 

Para demostrar el dominio del procesado digital a bajo nivel, he programado los algoritmos críticos (Transformada de Fourier, extracción de descriptores, limpieza de ruido, separación de fuentes) matemáticamente desde cero en el entorno MATLAB. El código se divide en cuatro módulos principales: 1_Preprocesado, 2_Restauracion, 3_Transcripcion y 4_Separacion_Ciega.

---

## Índice de Scripts

A continuación, detallo los 17 scripts autoejecutables que generan las gráficas presentadas en la memoria, ordenados cronológicamente según el Índice de Figuras del documento. Se indica la carpeta donde se encuentra alojado cada archivo.

### Capítulo 2: Fundamentos del Procesado de Señales Musicales
- Figura 2.1: Preprocesado/figura_2_1_muestreo_cuantificacion.m - Proceso de digitalización: muestreo y cuantificación de una señal analógica.
- Figura 2.2: Preprocesado/figura_2_2_acorde_tiempo_frecuencia.m - Comparativa de un acorde en el dominio temporal vs. dominio frecuencial (FFT).
- Figura 2.3: Preprocesado/figura_2_3_sintesis_fourier.m - Demostración visual de la síntesis de Fourier (armónicos impares).
- Figura 2.4: Transcripcion/figura_2_4_stft_espectrograma.m - Análisis de una secuencia musical en el plano tiempo-frecuencia (STFT).
- Figura 2.5: Transcripcion/figura_2_5_analisis_cepstral.m - Análisis cepstral: separación de la envolvente del timbre y el pitch de la nota.
- Figura 2.6: Transcripcion/figura_2_6_banco_filtros_mel.m - Banco de 20 filtros triangulares Mel distribuidos a lo largo del espectro.
- Figura 2.7: Transcripcion/figura_2_7_envolvente_adsr.m - Modelo de envolvente temporal dinámica (Ataque, Decaimiento, Sostenido, Relajación).

### Capítulo 3: Técnicas de Procesado Aplicadas a Señales Musicales
- Figura 3.1: Preprocesado/figura_3_1_conversion_adc.m - Representación conceptual del proceso de conversión analógica-digital.
- Figura 3.2: Preprocesado/figura_3_2_enventanado_hamming.m - Comparativa temporal: truncamiento abrupto frente a suavizado con ventana de Hamming.
- Figura 3.3: Preprocesado/figura_3_3_respuesta_filtros.m - Respuesta en frecuencia de filtros LTI IIR (Butterworth paso bajo, banda y alto).
- Figura 3.4: Restauracion/figura_3_4_compresion_dinamica.m - Característica de transferencia estática de un compresor dinámico.
- Figura 3.5: figura_3_5_vocoder_fase.m - Simulación STFT del efecto de Vocoder de Fase (Pitch Shifting sin alterar el tiempo).
- Figura 3.6: Transcripcion/figura_3_6_cromagrama_pcp.m - Extracción de energía armónica agrupada en las 12 clases de tono (PCP).
- Figura 3.7: Transcripcion/figura_3_7_piano_roll_matriz.m - Matriz de transcripción simbólica pasando de análisis monofónico a polifónico.
- Figura 3.8: Separacion_Ciega/figura_3_8_separacion_fuentes_ica.m - Resultados de Separación Ciega combinando blanqueamiento PCA y punto fijo FastICA.

### Capítulo 4: Implementación Práctica y Resultados
- Figura 4.1: Restauracion/figura_4_1_restauracion_audio.m - Limpieza de señal ruidosa mediante filtro de mediana temporal y Sustracción Espectral paramétrica.
- Figura 4.2: Transcripcion/figura_4_2_transcripcion_completa.m - Segmentación temporal por Flujo Espectral y estimación tonal YIN exportada a Piano Roll.

---

## Requisitos y Ejecución
- Software: MATLAB R2023a o superior.
- Instrucciones: Cada archivo .m incluye internamente la síntesis matemática de la señal analizada. Basta con abrir el script en el entorno MATLAB y ejecutarlo para que el algoritmo calcule los parámetros y despliegue las figuras exactas incluidas en el documento del TFG.
