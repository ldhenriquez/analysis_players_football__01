# Proyecto Final · Machine Learning
## Segmentación de jugadores de fútbol por perfil técnico
### Aprendizaje No Supervisado — PCA + Clustering

---

## Planteamiento

Un departamento de scouting necesita identificar **perfiles de jugador** dentro de una base de
casi 17.000 futbolistas descritos por 28 atributos técnicos. La pregunta:

> ¿Existen arquetipos naturales de jugador que emerjan de los datos, **sin decirle al modelo en
> qué posición juega cada uno**?

La posición real nunca entra al modelo: se reserva para **validar** los grupos al final.

## Contenido

| Archivo | Descripción |
|---------|-------------|
| `Football_Players_Clustering.ipynb` | Notebook completo con celdas ejecutadas |
| `players_21.csv` | Dataset FIFA 21 (18.944 jugadores, 106 columnas) |

## Metodología

1. **EDA** — distribuciones y matriz de correlación (justifica el uso de PCA)
2. **Preprocesamiento** — exclusión de porteros, selección de 28 atributos técnicos, `StandardScaler`
3. **PCA** — reducción de 28 → 3 dimensiones e interpretación de los componentes
4. **Selección de k** — método del codo + coeficiente de silhouette
5. **Modelado** — 3 algoritmos de familias distintas
6. **Evaluación** — Silhouette, Davies-Bouldin y Calinski-Harabasz
7. **Interpretación** — perfiles de cluster y validación contra posiciones reales

## Resultados

### Componentes principales (71% de varianza con 3 componentes)

| Componente | Varianza | Interpretación futbolística |
|-----------|----------|----------------------------|
| PC1 | 41.0% | Defensa ↔ creación (destructores vs. constructores) |
| PC2 | 20.0% | Velocidad/definición ↔ agresividad defensiva |
| PC3 | 10.1% | Físico/aéreo ↔ agilidad |

### Comparación de modelos

| Modelo | Silhouette ↑ | Davies-Bouldin ↓ | Calinski-Harabasz ↑ |
|--------|-------------|------------------|---------------------|
| **K-Means (mejor)** | **0.298** | **1.072** | **9.228** |
| Gaussian Mixture | 0.238 | 1.232 | 6.920 |
| Jerárquico (Ward) | 0.237 | 1.200 | 7.213 |

K-Means gana en las tres métricas simultáneamente.

### Los 4 arquetipos encontrados

El modelo descubrió una estructura **2×2** que combina rol y nivel de consolidación:

| | En desarrollo | Consolidados |
|---|---|---|
| **Perfil defensivo** | Cluster 0 — 3.525 jug., overall 61.6 (CB, LB, RB) | Cluster 3 — 4.761 jug., overall 67.0 (Koulibaly, Chiellini, Varane) |
| **Perfil creativo/ofensivo** | Cluster 1 — 4.460 jug., overall 61.5 (ST, RM, LM) | Cluster 2 — 4.114 jug., overall 72.8 (Messi, De Bruyne, Mbappé) |

Este hallazgo justifica haber elegido k=4 en lugar de k=3: con tres grupos solo se recuperaba
la división por posición, ya conocida de antemano.

### Aplicación práctica

El notebook incluye la función `jugadores_similares()`, que dado un jugador devuelve los de
huella técnica más parecida. Ejemplo con K. De Bruyne:

> Bruno Fernandes · A. Griezmann · Roberto Firmino · L. Modrić · S. Mané · T. Kroos · P. Pogba

## Cómo ejecutar

```bash
pip install pandas numpy matplotlib seaborn scikit-learn scipy jupyter
jupyter notebook
```

Abrir el `.ipynb` y ejecutar todas las celdas (ya vienen ejecutadas con sus salidas).

## Fuente de datos

[FIFA 21 Complete Player Dataset](https://www.kaggle.com/datasets/stefanoleone992/fifa-21-complete-player-dataset) — Kaggle
