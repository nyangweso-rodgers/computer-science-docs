# Artificial Intelligence

## Table Of Contents

- [Overview of AI](#Overview-of-AI)

# Overview of AI

- Field of Computer Science that aims to make computers achieve human-style intelligence. There are many approaches to reaching this goal, including **Machine Learning** & **Deep Learning**.

# AI Concepts

## Large Language Models (LLMs)

- These are the core engines behind **Retrieval-Augmented Generation** (**RAG**), responsible for understanding queries and generating coherent and contextual responses.
- Some common **LLM** options are:

  1. OpenAI GPT models
  2. Llama
  3. Claude
  4. Gemini
  5. Mistral
  6. DeepSeek
  7. Qwen 2.5
  8. Gemma, etc.

- **LLMs** are powerful but come with inherent **limitations**:
  1. **Limited knowledge**: **LLMs** can only generate responses based on their training data, which may be outdated or lack domain-specific information.
  2. **Hallucinations**: These models sometimes generate plausible-sounding but incorrect information.
  3. **Generic responses**: Without access to external sources, LLMs may provide vague or imprecise answers.
- **RAG** addresses these issues by allowing models to retrieve up-to-date and domain-specific information from structured and unstructured data sources, such as databases, documentation, and APIs.

## Model Context Protocol (MCP)

- **MCP** is a simple protocol that empowers **LLMs** and extends their capabilities.

## RAG (Retrieval Augmented Generation)

- Retrieval methods enhance **LLMs** by providing relevant context, making them more current, precise, and practical. You can grant **LLMs** access to internal data for processing and manipulation. This context allows the **LLM** to extract information, create summaries, and generate responses. **RAG** can also incorporate real-time information through the latest data retrieval.

- **Remarks**:

  - **RAG** is a technique that enhances **LLMs** by integrating them with external data sources. By combining the generative capabilities of models like GPT-4 with precise information retrieval mechanisms, RAG enables AI systems to produce more accurate and contextually relevant responses.

- **How Does RAG Work?**

  1. **Step 1**: **Data collection**

     - You must first gather all the data that is needed for your application. In the case of a customer support chatbot for an electronics company, this can include user manuals, a product database, and a list of FAQs.

  2. **Step 2**: **Data chunking**

     - **Data chunking** is the process of breaking your data down into smaller, more manageable pieces. For instance, if you have a lengthy 100-page user manual, you might break it down into different sections, each potentially answering different customer questions.
     - This way, each chunk of data is focused on a specific topic. When a piece of information is retrieved from the source dataset, it is more likely to be directly applicable to the user’s query, since we avoid including irrelevant information from entire documents.
     - This also improves efficiency, since the system can quickly obtain the most relevant pieces of information instead of processing entire documents.

  3. **Step 3**: **Document embeddings**

     - Now that the source data has been broken down into smaller parts, it needs to be converted into a **vector representation**. This involves transforming text data into **embeddings**, which are numeric representations that capture the semantic meaning behind text.
     - In simple words, document embeddings allow the system to understand user queries and match them with relevant information in the source dataset based on the meaning of the text, instead of a simple word-to-word comparison. This method ensures that the responses are relevant and aligned with the user’s query.
     - **Remarks**:
       - Learn more about how text data is converted into vector representations, explore [text embeddings with the OpenAI API](https://www.datacamp.com/tutorial/introduction-to-text-embeddings-with-the-open-ai-api)

  4. **Step 4**: **Handling user queries**

     - When a user query enters the system, it must also be converted into an embedding or vector representation. The same model must be used for both the document and query embedding to ensure uniformity between the two.
     - Once the query is converted into an embedding, the system compares the query embedding with the document embeddings. It identifies and retrieves chunks whose embeddings are most similar to the query embedding, using measures such as cosine similarity and Euclidean distance.
     - These chunks are considered to be the most relevant to the user’s query.

  5. **Step 5**: **Generating responses with an LLM**
     - The retrieved text chunks, along with the initial user query, are fed into a language model. The algorithm will use this information to generate a coherent response to the user’s questions through a chat interface.

- **Practical Applications of RAG**
  1. Text summarization
  2. Personalized recommendations
  3. Business intelligence

## AI Agent

- **AI Agents** are autonomous systems that **perceive**, **decide**, and **act**.
- **AI Agents** are systems that reason and make decisions independently. They break down tasks into steps, use external tools as needed, evaluate results, and determine the following actions: **whether to store results**, **request human input**, or **proceed to the next step**.

## Frameworks and Model Access

- These tools simplify the integration of **LLMs** into your applications by handling prompt orchestration, model switching, memory, chaining, and routing.
- Common tools are:
  1. Langchain
  2. LlamaIndex
  3. Haystack
  4. Ollama
  5. Hugging Face, and
  6. OpenRouter.

# Resources and Further Reading
