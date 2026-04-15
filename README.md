# European Real Estate Dashboard

## 📊 Project Overview
This project presents a **multi-page interactive dashboard** analyzing European real estate data (2020–2024).  
It combines **market overview** (prices, rental trends, city comparisons, building types) with **property type analysis** (scatter plots, maps, amenities distribution).  

The goal is to deliver **manager-ready insights** for recruiters, clients, and academic presentations.

---
<img width="1419" height="793" alt="12" src="https://github.com/user-attachments/assets/657c0e3c-9074-4019-8e0c-dd4a9c591650" />
<img width="1416" height="796" alt="13" src="https://github.com/user-attachments/assets/7504b4db-1122-4910-b6a0-e94437bfcc41" />
<img width="1420" height="796" alt="14" src="https://github.com/user-attachments/assets/2edd2dc9-bad5-4ec9-a655-fb91f938e2b9" />

---

## 🛠️ Tools & Technologies
- **SQL** → Data extraction, cleaning, and relational queries  
- **Python** → Data preprocessing, transformation, and workflow automation  
- **Power BI** → Dashboard design, DAX logic, and interactive visualizations  

---

## 🧩 Workflow
1. **Data Collection**: SQL queries to extract structured property datasets  
2. **Data Cleaning**: Python scripts for handling missing values, formatting, and transformations  
3. **Modeling**: Power BI relationships, calculated columns, and DAX measures  
4. **Visualization**: Multi-page dashboard with consistent branding and layout  
5. **Storytelling**: Market overview (Page 1) → Property type & amenities analysis (Page 2)  

---
## Question 1 : How do property prices and price per square meter vary across countries and cities?

<img width="543" height="194" alt="Screenshot 2026-04-15 081453" src="https://github.com/user-attachments/assets/bb15c04f-9475-42e2-a13d-2e0c7dc557bb" />

**Explanation:**
This query aggregates property data by country and city, calculating the average property sale price and average price per square meter.

**Answer:**  
- Paris and Amsterdam stand out with the highest property values and cost per square meter.  
- Berlin, Rome, and Brussels show mid-range values, reflecting balanced markets.  
- Cities like Lisbon and Warsaw present more affordable opportunities, with lower average prices and cost per square meter.  

This comparison highlights how market dynamics differ across Europe, helping investors and analysts identify both luxury hubs and emerging affordable markets.

## Question 2 : Which locations and property types have the highest average listing values?

<img width="759" height="163" alt="Screenshot 2026-04-15 082350" src="https://github.com/user-attachments/assets/e3a290d9-4991-4453-a2aa-13ff1c372b61" />

**Explanation:**
This query ranks property types by average listing value across citie

**Answer:**
- Townhouses consistently show the highest values.  
- Villas follow as luxury options.  
- Apartments rank third, offering more affordable opportunities.  

This breakdown helps investors understand which property categories dominate value in each city.

---

## 📈 Key Features
- **Dynamic Filters**: Furnishing status, listing type, year, country, property type  
- **KPIs**: Total units, median listing price, rental price, mean square meters, price per meter  
- **Visualizations**:
  - Property price & rental fluctuations (monthly trends)  
  - Highest cities by property price  
  - Scatter plot: Price vs. Square meters by property type  
  - Map of European property distribution  
  - Amenities distribution (Swimming pool, Parking, Gym)  
  - Construction century & building type breakdown  

---

## 🚀 How to Use
- Open the `.pbix` file in **Power BI Desktop**  
- Connect to the provided SQL dataset or CSV export  
- Explore the dashboard using filters and interactive visuals  

---
