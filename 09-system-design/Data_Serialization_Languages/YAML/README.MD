# YAML - YAML Ain't Markup Language

## Table of Contents
1. [What is YAML?](#What-is-YAML?)
2. [Comparison of YAML, XML and JSON](#Comparison-of-YAML,-XML-and-JSON)
3. [Uses of YAML](#Uses-of-YAML)
4. [Benefits of YAML](#Benefits-of-YAML)
5. [Data Types in YAML](#Data-Types-in-YAML)
6. [Additional Points on YAML](#Additional-Points-on-YAML)
7. [References]()
    - [A Simplified Guide To YAML](https://kubesimplify.com/a-simplified-guide-to-yaml#comments-list)
    
# What is YAML?
* __YAML__ is a simple human readable language that can be used to represent data and works well with other programming languages. __YAML__ is neither a programming language nor a markup language. __YAML__ is a __Data Serialization language__.
* It was previously known as "__Yet Another Markup Language__" but now its called "__YAML Ain't Markup Language__". __Markup languages__ are used to store only documents. But __YAML__ can store __objects data__ along with __documents__. The two most popular markup languages are __HTML__ and __XML__.

# Comparison of YAML, XML and JSON
```xml
    <Servers>
        <Server>
            <name>Server1</name>
            <owner>Rodgers</owner>
            <created>31072022</created>
            <status>active</active>
        </Server>
    </Servers>
```
```json
    {
        Servers: [
            {
                name: Server1,
                owner: Rodgers,
                created: 31072022,
                status: active
            }
        ]
    }
```
```yaml
    ---
    # this is a comment in YAML
    Servers:
            - name: Server1
            owner: Rodgers
            created: 31072022
            status: active
```
_Remarks_:
* _So as YAML uses line separation and spaces with indentation instead of tags with angle brackets in XML and curly bracket in JSON. It’s a lot more easy to understand by others than XML or JSON._
* _That is why DevOps tools like (Docker, Kubernetes, Ansible, Prometheus, etc.) use YAML for writing configuration files._

# Uses of YAML
* Importing and exporting data to and from the server.
* Configuring files can be written in YAML.
* Transferring data between two different components of the application.
* Intermediate data storing.

# Benefits of YAML
* YAML is simple and easy to read.
* Easily convertible to JSON and XML files.
* Most programming languages use YAML for data serialization.
* You can only store data and not commands in YAML.
* YAML is more powerful when representing complex data.
* Parsing is Easy in YAML(parsing means reading the data).

# Data Types in YAML
* In __YAML__, there are three types of primitive datatypes:
    - __Scalars__: data which can be identified as a single value. The value of the scalar can be integer, float, Boolean, etc.
        ```yaml
            str1: this is a normal string
            chocolate: 39
            price: 12.5
            flag: no
        ```
    - __List__: In YAML, a list or collection of values can be represented in two ways, i.e., __block style__ or __flow style__
        ```yaml
            # block style
            lists:
                - first
                - second
                - third
        ```
        ```yaml
            # flow style
            lists: [first, second, third]
        ```
        Example of nested list
        ```yaml
             students:
                - 
                    name: Rodgers
                    roll: 03
                    subjects:
                        - computer science
                        - maths
                        - physics
                - 
                    name: Harvey
                    roll: 12
                    subjects:
                        - bioogy
                        - social science
                        - maths
        ```
    - __Mapping__ (Key-Value pairs): Mappings (or hashes, dictionaries) are unordered sequences of key/value pairs. __Keys__ in a dictionary must be unique. everything inside YAML is a member of a dictionary. __Example__:
        ```yaml
            character:
                name: Rodgers
                subject: computer science
        ```
        Above example can be also represented in the following way:
        ```yaml
            character: {name: Rodgers, subject: computer science}
        ```
        Here is an example of Primitive Data types in __YAML__:
        ```yaml
            first_name: Rodgers
            last_name: Nyangweso
            occupation: Software Engineer

            married: true
            spouse:
                name: Damaris
                occupation: Freelancer
                interest:
                    - Reading
                    - Cooking
            dog_count: 2
            dog_name: [Kin, Pap]
        ```
# Additional Points on YAML
* YAML is __case sensitive__.
* In YAML, we use __spaces__ for Identation and not tabs.
* File extensions must be __.yaml__ or __.yml__.
* There are no multi-line comments in YAML. (Only __single-line__ comments are available).
* The --- symbol mark represents the start of a document.
* The ... symbol mark represents the end of a document.

_Remarks_
* Below is an example of how YAML can be used in creating docker-compose.yaml file.
```yaml
    ---
    version: "3"

    services:
        my_service: 
            build: ./dockerProject
            volumes: 
                - ./dockerProject:/usr/src/app
            ports:
                - 5001:80
        website:
            image: php:apache
            volumes: 
                - ./website:/var/www/html
            ports:
                - 5000: 80
            depends_on: 
                - my_service
```