# financial-crime-analytics
A collection of SQL-driven fraud analytics projects simulating real-world financial crime scenarios across fintech, payments, and digital banking environments.
Each project focuses on pattern recognition, risk investigation, fraud detection logic, and data-driven decision-making — the exact skills required for Fraud Operations, Decision Science, and Risk Analytics roles.

🔍 Project Index
1. Transaction Monitoring – Velocity & Structuring Detection

Identify suspicious patterns where users perform rapid in/out transactions, multiple small deposits, and fast withdrawals (high-velocity layering behavior).
Includes:
- SQL queries detecting structuring (smurfing)
- Velocity thresholds
- Heatmaps by hour/day
- Automated alert logic

📁 /velocity-structuring-detection/

2. Behavioral Anomaly Detection (Clustering Normal vs Abnormal Users)

Simulated dataset for clustering "normal behavior" vs "anomalies" using SQL-based segmentation.

Includes:
- Baseline user profiling
- Outlier flagging
- Session behavior anomalies
- Device/IP mismatch patterns

📁 /anomaly-detection/

3. Multi-Source Funnel Account Detection

(aka payment clustering / money mule detection)
Detect accounts receiving funds from many users with varied amounts and immediately moving money to external accounts.

Includes:
- Source-to-destination mapping
- Transaction concentration analysis
- Rapid movement (velocity)
- Beneficiary risk score

📁 /payment-cluster-analysis/

4. Fraud KPI Dashboard: Risk, Alerts, Losses

SQL output designed for Tableau / Looker dashboards.

Includes:
- Alert volumes
- False positives
- Losses by category
- Fraud patterns by product
- Workflow SLA breakdown

📁 /fraud-kpi-dashboard/

5. Case Investigation Simulations

A library of SQL-based investigations that mirror real AML / fraud workflows.

Includes:
- Case narratives
- Red flags
- KYC mismatch logic
- Watchlist/negative media simulation

📁 /case-investigations/

🧰 Tech Stack

- SQL (PostgreSQL / MySQL)
- Python (optional later) – for visualization + ML extensions
- Tableau / Looker / Power BI (dashboards)
- GitHub version control


📌 Status

Currently building projects — updates weekly.
Follow to get notified.
