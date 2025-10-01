# Olist Data Visualization Project

This project connects to a PostgreSQL database containing the Olist e-commerce dataset and generates different visualizations (Pie, Bar, Histogram, Scatter, Line, Interactive Plotly) to analyze customer behavior, seller revenue, product characteristics, and sales trends.  

The results are:
- Saved as PNG charts in the `charts/` folder
- Exported as Excel reports with conditional formatting in the `exports/` folder
- Displayed interactively using Plotly (with range slider support)

---

## Features
- **Pie Chart** – Distribution of clients by payment type  
- **Bar Chart** – Top 10 cities by number of unique customers with orders  
- **Horizontal Bar Chart** – Top 10 sellers ranked by revenue  
- **Line Chart** – Monthly total sales trend  
- **Histogram** – Distribution of product description length  
- **Scatter Plot** – Price vs freight value (colored by product category)  
- **Interactive Plotly Chart** – Monthly sales by top 5 product categories  

pip install -r requirements.txt

