# Zomato Bangalore Market Entry - Advanced Database Architecture & Executive Business Intelligence

* **Project Purpose:** To demonstrate a comprehensive, end-to-end data intelligence project from unstructured raw data extraction and programmatic Python preprocessing to PostgreSQL storage and executive-level Power BI deployment.
* **Business Case:** To build a robust, production-ready marketing analysis framework that helps investors and restaurant groups successfully enter the hyper-competitive Bangalore restaurant ecosystem without risking capital blindly.
* **Goal:** To accurately identify high-performing market opportunities (the "Sweet Spot" quadrants) while flagging high-risk, over-congested neighborhood clusters to minimize market entry failure rates.
* **Deliverable:** An interactive, two-page executive Power BI analytics dashboard optimized with a Midnight Navy and Crimson Red corporate UI that connects seamlessly to a validated relational database backend.

---

## 📂 In This Repository
* **Data & Data Dictionary:** Raw Zomato Bangalore documentation mapping essential restaurant attributes.
* **ETL Pipeline & Engineering (`/scripts`):** Python/Pandas scripts for column parsing, textual manipulation, array splitting, and null value handling.
* **PostgreSQL Architecture (`/database`):** Production-grade relational database setup scripts featuring advanced SQL validation schema queries (CTEs, Window Functions, and Multi-table Joins).
* **Power BI Dashboard Build (`/dashboard`):** Fully interactive `.pbix` template file utilizing highly structured data models and customized DAX metrics.

---

## 📊 Results and Analytical Evaluation

From a business consulting perspective, we want to evaluate the market based on strict benchmark metrics to ensure that any capital deployed has the highest statistical probability of success. 

* **The Baseline Real-World Benchmark:** The database registers over 51,000 active listings across Bangalore with a strict market-wide average rating of **3.70 / 5.0**. This indicates a highly active customer base with demanding consumer expectations—confirming that a middle-of-the-road, un-optimized restaurant format will face high initial friction.
* **The Saturation Problem:** Micro-markets like **BTM Layout** (5K+ listings) and **HSR Layout** (4.3K+ listings) are heavily congested. Entering these territories without concrete spatial and feature differentiation exposes an investor to aggressive price wars.
* **The Convenience Lift (A True Core Metric):** The data explicitly evaluates core features against consumer satisfaction. Restaurants offering *both* Online Ordering and Table Booking capabilities see an immediate jump, pulling in a premium **4.25 average rating**. Meanwhile, establishments offering neither sink to a market low of **3.55**.

---

## 📈 Dashboard Layout & Visual Mechanics

### Page 1: The Executive Market Overview
* **High-Impact Metric Panel:** Houses three clean, borderless custom KPI cards tracking *Total Restaurants*, *Average Rating*, and *Average Cost for Two* to instantly anchor high-level context.
* **Neighborhood Saturation Index:** A specialized horizontal bar chart color-coded in Zomato Crimson (`#E23744`) against a dark slate background, designed with precise grid spacing to establish clean visual hierarchy.
* **Left Filter Panel:** Implements a localized sidebar layout with integrated dropdown slicers to let stakeholders instantly filter macro metrics down by specific neighborhoods or cuisine groups.

### Page 2: The Investor Interactive Simulator
* **Market Opportunity Matrix:** A high-density scatter plot mapping operational costs against customer ratings. This visually drives a recruiter or investor's focus straight to the **top-left quadrant—the market "Sweet Spot"** (establishments scoring ratings above 4.1 with lean operational costs below ₹500 for two).
* **Granular Micro-Market Filtering:** Enables stakeholders to dynamically isolate highly specific restaurant categories (e.g., Casual Cafes vs. Fine Dining) to map out precise real estate and deployment gaps.

---

## 💼 Business Impact

Hiring managers and end-users will be able to utilize this business intelligence asset to evaluate a real-world market entry approach dynamically. 
1. **Eliminating Guesswork:** Investors can choose any neighborhood in Bangalore and immediately view its exact competitive density and average check value.
2. **Predicting Feature Revenue:** Restaurant groups can determine if adding table booking or an online delivery layout is worth the operational overhead based on the distinct rating multipliers proven by the database data.
3. **Optimizing Operational Capital:** By targeting the identified market white spaces (high ratings but low local investment costs), developers can launch new concepts that capitalize on immediate consumer demand while maintaining a highly efficient, fast-ROI capital footprint.

---

## 📋 Next Steps
* **Continuous Integration:** Schedule automated pipeline runs to keep the PostgreSQL environment updated as updated Zomato transactional data becomes available.
* **Predictive Features:** Expand the repository to integrate predictive machine learning models to forecast restaurant closing probabilities based on initial location, pricing, and launch features.