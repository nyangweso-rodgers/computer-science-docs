# Microsoft Fabric

## Table Of Contents

# What is Microsoft Fabric?

- **Microsoft Fabric** is an end-to-end analytics platform that unifies data movement, data processing, ingestion, transformation, real-time event routing, and report building.
- It supports these **capabilities** with integrated services like:

  1. Data Engineering
  2. Data Factory
  3. Data Science
  4. Real-Time Intelligence
  5. Data Warehouse, and
  6. Databases.

- **Capabilities of Fabric**:

  1. **Role-specific workloads**: Customized solutions for various roles within an organization, providing each user with the necessary tools.
  2. **OneLake**: A unified data lake that simplifies data management and access.
  3. **Copilot support**: AI-driven features that assist users by providing intelligent suggestions and automating tasks.
  4. **Integration with Microsoft 365**: Seamless integration with **Microsoft 365 tools**, enhancing collaboration and productivity across the organization.
  5. **Azure AI Foundry**: Utilizes Azure AI Foundry for advanced AI and machine learning capabilities, enabling users to build and deploy AI models efficiently.
  6. **Unified data management**: Centralized data discovery that simplifies governance, sharing, and access.

# Key Concepts

## 1. OneLake

- A **data lake** is the foundation for all **Fabric** workloads. In **Microsoft Fabric**, this lake is called **OneLake**. It's built into the platform and serves as a single store for all organizational data.
- **OneLake** is built on **ADLS** (**Azure Data Lake Storage**) **Gen2**. It provides a single SaaS experience and a tenant-wide store for data that serves both professional and citizen developers.
- **Fabric** includes **OneLake** by default, so no upfront provisioning is needed.
- Each **tenant** gets one unified **OneLake** with single file-system namespace that spans users, regions, and clouds. **OneLake** organizes data into **containers** for easy handling. The **tenant** maps to the root of **OneLake** and is at the top level of the hierarchy. You can create multiple workspaces (which are like folders) within a tenant.
- Every developer and business unit in the **tenant** can create their own workspaces in **OneLake**. They can ingest data into **lakehouses** and start processing, analyzing, and collaborating on that data—similar to using **OneDrive** in **Microsoft Office**.

## 2. Fabric Compute Engines

- All **Microsoft Fabric** compute experiences come preconfigured with **OneLake**, much like Office apps automatically use organizational **OneDrive**. The experiences such as **Data Engineering**, **Data Warehouse**, **Data Factory**, **Power BI**, and **Real-Time Intelligence** etc. use **OneLake** as their native store without extra setup.

## 3. Real-Time hub: the unification of data streams

- The **Real-Time hub** is a foundational location for data in motion. It provides a unified SaaS experience and tenant-wide **logical place** for **streaming data**. It lists data from every source, allowing users to discover, ingest, manage, and react to it. It contains both **streams** and **KQL database** tables. **Streams** include **Data streams**, **Microsoft sources** (such as **Azure Event Hubs**, **Azure IoT Hub**, **Azure SQL DB Change Data Capture** (**CDC**), **Azure Cosmos DB CDC**, **Azure Data Explorer**, and **PostgreSQL DB CDC**), **Fabric events** (**workspace item events**, **OneLake events**, and **Job events**), and **Azure events**, including **Azure Blob Storage events** and external events from Microsoft 365 or other clouds services.
- The **Real-Time hub** makes it easy discover, ingest, manage, and consume data-in-motion from a wide variety of sources to collaborate and develop streaming applications in one place.

# Components of Microsoft Fabric

## 1. PowerBi

- **Power BI** lets you easily connect to your data sources, visualize, and discover what's important, and share that with anyone or everyone you want. This integrated experience allows business owners to access all data in Fabric quickly and intuitively and to make better decisions with data.

## 2. Databases

- **Databases** in **Microsoft Fabric** are a developer-friendly transactional database such as **Azure SQL Database**, which allows you to easily create your operational database in **Fabric**. Using the mirroring capability, you can bring data from various systems together into **OneLake**. You can continuously replicate your existing data estate directly into **Fabric's OneLake**, including data from **Azure SQL Database**, **Azure Cosmos DB**, **Azure Databricks**, **Snowflake**, and **Fabric SQL database**.

## 3. Data Factory

- **Data Factory** provides a modern data integration experience to ingest, prepare, and transform data from a rich set of data sources. It incorporates the simplicity of Power Query, and you can use more than 200 native connectors to connect to data sources on-premises and in the cloud.

## 4. Industry Solutions

- **Fabric** provides industry-specific data solutions that address unique industry needs and challenges, and include **data management**, **analytics**, and **decision-making**.

## 5. Real-Time Intelligence

- **Real-time Intelligence** is an end-to-end solution for event-driven scenarios, streaming data, and data logs. It enables the extraction of insights, visualization, and action on data in motion by handling data ingestion, transformation, storage, modeling, analytics, visualization, tracking, AI, and real-time actions. The **Real-Time hub** in **Real-Time Intelligence** provides a wide variety of no-code connectors, converging into a catalog of organizational data that is protected, governed, and integrated across Fabric.

## 6. Data Engineering

- **Fabric Data Engineering** provides a **Spark platform** with great authoring experiences. It enables you to create, manage, and optimize infrastructures for collecting, storing, processing, and analyzing vast data volumes. **Fabric Spark's** integration with **Data Factory** allows you to schedule and orchestrate notebooks and **Spark jobs**.

## 7. Fabric Data Science

- **Fabric Data Science** enables you to build, deploy, and operationalize machine learning models from **Fabric**. It integrates with **Azure Machine Learning** to provide built-in experiment tracking and model registry. Data scientists can enrich organizational data with predictions and business analysts can integrate those predictions into their BI reports, allowing a shift from descriptive to predictive insights.

## 8. Fabric Data Warehouse

- **Fabric Data Warehouse** provides industry leading SQL performance and scale. It separates **compute** from storage, enabling independent scaling of both components. Additionally, it natively stores data in the open **Delta Lake** format.
- **Fabric Data Warehouse** is a next-generation **data warehousing** solution within **Microsoft Fabric**.
- **Benefits of the Data Warehouse**:

  1.  **Data stored in Delta-parquet** format enables **ACID** transactions and interoperability with other Fabric workloads means you don't need multiple copies of data.
  2.  **Cross database queries** can use multiple data sources for fast insights with zero data duplication.
  3.  **Easily ingest, load and transform data** at scale through **Pipelines**, **Dataflows**, **cross database query** or the COPY INTO command.
  4.  **Autonomous workload management** with industry-leading distributed query processing engine means no knobs to turn to achieve best in class performance.
  5.  **Scale near instantaneously** to meet business demands. Storage and compute are separated.
  6.  **Reduced time to insights** with an easily consumable, always connected semantic model that is integrated with Power BI in Direct Lake mode. Reports always have the most recent data for analysis and reporting.
  7.  Built for any skill level, from the citizen developer to DBA or data engineer.

- **Data warehousing items**

  - **Fabric Data Warehouse** is a lake warehouse that supports two distinct warehosuing items:
    1. The Fabric Data Warehouse
    2. SQL Analytics Endpoint
  - **Fabric Data Warehouse**
    - In a **Microsoft Fabric workspace**, a **Fabric warehouse** is labeled as **Warehouse** in the **Type** column. When you need the full power and transactional capabilities (DDL and DML query support) of a data warehouse, this is the fast and simple solution for you.
    - The warehouse can be populated by any one of the supported data ingestion methods such as `COPY INTO`, `Pipelines`, `Dataflows`, or cross database ingestion options such as `CREATE TABLE AS SELECT (CTAS)`, `INSERT`..`SELECT`, or `SELECT INTO`.
  - **SQL Anaytics Endpoint of the Lakehouse**
    - In a **Microsoft Fabric workspace**, each **Lakehouse** has an autogenerated "**SQL analytics endpoint**" which can be used to transition from the "Lake" view of the Lakehouse (which supports data engineering and Apache Spark) to the "SQL" view of the same Lakehouse to create views, functions, stored procedures, and apply SQL security.

- **Remarks**:

  - With the flexibility offered by **Fabric**, you can implement either **lakehouse** or **data warehouse** architectures or combine them together to get the best of both with simple implementation.

- **Setup**:

  1. **Step 1**: Sign in to your Power BI account and sign up for the free [Microsoft Fabric trial](https://learn.microsoft.com/en-us/fabric/fundamentals/fabric-trial). If you don't have a Power BI license, [sign up for a Fabric free license](https://app.fabric.microsoft.com/singleSignOn?pbi_source=learn-data-engineering-tutorial-lakehouse-introduction&ru=https%3A%2F%2Fapp.fabric.microsoft.com%2F%3Fpbi_source%3Dlearn-data-engineering-tutorial-lakehouse-introduction%26noSignUpCheck%3D1) and then you can start the Fabric trial.

  2. **Step 2**: Build and implement an end-to-end lakehouse for your organization:

     - [Create a Fabric workspace.](https://learn.microsoft.com/en-us/fabric/data-engineering/tutorial-lakehouse-get-started)
     - [Create a lakehouse.](https://learn.microsoft.com/en-us/fabric/data-engineering/tutorial-build-lakehouse)
     - [Ingest data](https://learn.microsoft.com/en-us/fabric/data-engineering/tutorial-lakehouse-data-ingestion), [transform data](https://learn.microsoft.com/en-us/fabric/data-engineering/tutorial-lakehouse-data-preparation), and load it into the **lakehouse**. You can also explore the **OneLake**, one copy of your data across lakehouse mode and SQL analytics endpoint mode.
     - Connect to your lakehouse using the SQL analytics endpoint and [Create a Power BI report using DirectLake](https://learn.microsoft.com/en-us/fabric/data-engineering/tutorial-lakehouse-build-report) to analyze sales data across different dimensions.
     - Optionally, you can orchestrate and schedule data ingestion and transformation flow with a pipeline.

  3. **Step 3**: [Clean up resources](https://learn.microsoft.com/en-us/fabric/data-engineering/tutorial-lakehouse-clean-up) by deleting the workspace and other items.

# Resources and Further Reading

1. [learn.microsoft.com - microsoft fabric](https://learn.microsoft.com/en-us/fabric/fundamentals/microsoft-fabric-overview)
2. [learn.microsoft.com - What is data warehousing in Microsoft Fabric?](https://learn.microsoft.com/en-us/fabric/data-warehouse/data-warehousing)
3. [learn.microsoft.com - Lakehouse end-to-end scenario: overview and architecture](https://learn.microsoft.com/en-us/fabric/data-engineering/tutorial-lakehouse-introduction)
