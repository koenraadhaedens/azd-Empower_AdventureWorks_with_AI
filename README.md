
✅ Infrastructure Overview
We'll prepare the following Azure resources:


Azure SQL Server + AdventureWorks DB

Azure OpenAI or Cognitive Services (depending on use case)

App Service Plan + Web App (for hosting frontend/chatbot/demo)

(Optional) Azure ML workspace or Cognitive Search



🧱 Architecture Overview


Browser (React/Next.js)
   ↓
Node.js API (Express)
   ↓
Azure OpenAI (for SQL generation or Q&A)
   ↓
AdventureWorks SQL DB (hosted in Azure)


⚡ Hackathon Theme: “Empower AdventureWorks with AI”
🕒 Duration: 2 hours
🧠 Goal:
Use Azure AI services to extract insights, automate tasks, or enhance user experience based on data from the AdventureWorks database.

🔧 Prerequisites
Ensure participants have:

Access to a SQL Server with AdventureWorks database

An Azure subscription

A deployed Azure OpenAI resource or Cognitive Services

Access to Azure Machine Learning Studio (optional)

💡 Challenge Options (Choose One or Let Them Pick)
1. Sales Insights with Azure OpenAI
Generate a natural language Q&A interface over AdventureWorks sales data.

Use Azure OpenAI + your AdventureWorks schema to let users ask:

“What was our best-selling product in 2023?”

“How did sales in Europe compare to North America?”

Tip: Use Function Calling or SQL generation with GPT

2. Product Recommendations with Azure Machine Learning
Build a basic recommender model using historical purchase data.

Train a model in Azure ML (or fake it with sample logic)

Expose via a simple endpoint

Optional: visualize recommendations with Power BI or Streamlit

3. Customer Sentiment Analysis
Feed customer reviews (you may need to mock this data) into Text Analytics.

Detect sentiment and key phrases per review

Create a sentiment dashboard or alert system

Bonus: link to specific products

4. AI-Powered Assistant for Sales Team
Create a Copilot-style chatbot for the sales team using Azure OpenAI + Data

Example questions:

“Give me the top 5 customers by revenue.”

“What is the current inventory for road bikes?”

Optionally embed knowledge of sales policy PDFs using Azure Cognitive Search

📦 Provided Assets (You prepare in advance)
Pre-loaded AdventureWorks DB (hosted or via SQL Server)

Dummy customer reviews CSV (for sentiment analysis)

Connection strings / Azure credentials in a shared OneNote or doc

Instructions on how to use Azure AI Studio or Azure ML