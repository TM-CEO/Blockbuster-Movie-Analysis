# 🎬 Blockbuster Movie Analysis using Clustering (R)

This project analyzes a dataset of blockbuster films using clustering techniques like **Hierarchical Clustering** and **K-Means Clustering**. It helps uncover patterns among blockbuster movies based on factors like **IMDB ratings**, **worldwide gross income**, and more.

## 📂 Project Structure

- **Dataset**: `Filmxx.xlsx` (must be provided separately)
- **R Script**: `finalclus.R`

## 🛠️ Methods and Techniques

- **Data Preparation**
  - Importing Excel data using `readxl`
  - Data exploration: `summary()`, `str()`, `head()`, `tail()`
  - Normalization of numeric features
- **Visualization**
  - Scatter plots (e.g., IMDb Rating vs Worldwide Income)
  - Distance matrix visualization (`fviz_dist`)
- **Clustering**
  - **Hierarchical Clustering** with dendrograms (`hclust`, `rect.hclust`)
  - **K-Means Clustering** with 3 clusters (`kmeans`, `fviz_cluster`)
- **Cluster Tendency Analysis**
  - Hopkins Statistic to evaluate clustering tendency (`get_clust_tendency`)
  - WSS (Within-cluster Sum of Squares) method to determine optimal number of clusters (`fviz_nbclust`)

## 📦 Libraries Used

- `readxl` – For importing Excel files
- `cluster` – For clustering and cluster plotting
- `factoextra` – For advanced cluster visualization
- `stats` – For scaling and distance computation

## 📋 Requirements

Install the necessary R packages before running:

```R
install.packages("readxl")
install.packages("cluster")
install.packages("factoextra")
```

## 🚀 How to Run

1. Clone this repository.
2. Place the `Filmxx.xlsx` file in your working directory.
3. Open `finalclus.R` in RStudio or your preferred R environment.
4. Run the script step-by-step to perform data exploration, normalization, clustering, and visualization.

## 📊 Key Insights

- Identification of clusters based on movie financial and rating metrics.
- Visualization of movie groupings using clustering algorithms.
- Evaluation of clustering validity using statistical techniques.

## ✨ Notes

- **Update the `setwd()` path** in `finalclus.R` to match your local directory.
- The dataset `Filmxx.xlsx` is **required** but not included.

---

Feel free to fork and improve the clustering methodology or extend the analysis to include more features!

