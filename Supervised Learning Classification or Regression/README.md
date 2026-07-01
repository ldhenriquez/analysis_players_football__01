# Taller 05 — Aprendizaje Supervisado: Clasificación y Regresión

Solución del Taller 05 del Bootcamp de Data Science. Se resolvieron **ambos** casos de negocio
(el taller solo exige uno; el segundo se incluye como práctica personal).

## Contenido del repositorio

| Archivo | Descripción |
|---------|-------------|
| `Clasificacion_Envios_Ecommerce.ipynb` | Clasificación binaria: predecir si un envío de e-commerce llega tarde. |
| `Regresion_Precio_Autos.ipynb` | Regresión: estimar el precio de venta de autos usados. |
| `Train.csv` | Dataset de envíos (E-Commerce Shipping Data). |
| `CAR DETAILS.csv` | Dataset de autos usados (Car Price Prediction). |

## Resumen de resultados

### Clasificación — Envíos a tiempo
Se entrenaron Regresión Logística, Árbol de Decisión y Random Forest.

| Modelo | Accuracy |
|--------|----------|
| **Árbol de Decisión (mejor)** | **0.685** |
| Random Forest | 0.655 |
| Regresión Logística | 0.640 |

Las variables más determinantes del retraso son `Discount_offered` y `Weight_in_gms`.

### Regresión — Precio de autos usados
Se entrenaron Regresión Lineal, Random Forest y Gradient Boosting.

| Modelo | R² | RMSE |
|--------|-----|------|
| **Gradient Boosting (mejor)** | **0.961** | 154,888 |
| Random Forest | 0.960 | 157,430 |
| Regresión Lineal | 0.675 | 449,957 |

Las variables más importantes para el precio son `year`, `max_power` y `engine`.

## Cómo ejecutar

```bash
pip install pandas numpy matplotlib seaborn scikit-learn jupyter
jupyter notebook
```

Abrir cada `.ipynb` y ejecutar todas las celdas (los notebooks ya vienen con las celdas
ejecutadas y sus salidas visibles).

## Fuentes de datos
- E-Commerce Shipping Data: https://www.kaggle.com/datasets/prachi13/customer-analytics
- Car Price Prediction Dataset: https://www.kaggle.com/datasets/sukhmandeepsinghbrar/car-price-prediction-dataset
