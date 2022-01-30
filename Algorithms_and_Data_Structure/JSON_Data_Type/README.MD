# JSON

## Contents
- [What is JSON](#What-is-JSON?)
- [JSON Syntax](#JSON-Syntax)
- [Data Types in JSON](#Data-Types-in-JSON)
- [Why JSON](#Why-JSON)
- [How to send or receive JSON data in JavaScript?]()

# What is JSON?
* __JSON__ stands for __JavaScript Object Notation__. It's a lightweight format for storing and transporting data similar to __XML__ or __YAML__. 
* It is used widely across the internet for almost every single __API__ as well as for config files and many other places.
* __JSON__ is based on a subset of the __JavaScript__ Programming Language Standard originally specified by __Douglas Crockford__, the writer of "JavaScript : The Good Parts"
* It is easy to read and write compared to something like __XML__ because it has a much cleaner syntax.
* __JSON__ is a text format that is completely language-independent but uses conventions that are familiar to programmers of the C-family of languages, including C, C++, C#, Java, JavaScript, Perl, Python, etc.,
* Code for parsing JSON exists in many languages.

# JSON Syntax
* Data is in name/value pairs
* Data is seperated by commas
* Curly braces hold objects
* Square brackets hold arrays
* Key and stringvalues should be wrapped in double quotes

```json
{
"id": 27,
"name": "rodgers",
"isVerified": true
}
```

# Data Types in JSON
* Number
* String
* Null
* Object (JSON Object)
* Boolean
* Array

__JSON__ values cannot be one of the following data types:
* Function
* Date
* undefined

# Why JSON
__JSON__ has eclipsed __XML__ as the preferred data interchange format for web applications and web services. Here is why:
1. Easy mapping into data structures
2. Almost all programming languages have libraries or functions that can read and write structures of JSON
3. Simple and compact
4. It was made to be user-friendly for both people and computers
5. It's flexible

Look at the example below that how a common __JSON__ object looks like vs its __XML markup__:

__NOTE__: _XML is a markup language much like HTML but it was designed to store and transport data_

```
json
{
    "id": 27,
    "name": "rodgers",
    "isVerified": true
}
```

```
XML
<user>
    <id>27</id>
    <name>rodgers</name>
    <isVerified>true</isVerified>
</user>
```

# How to parse received JSON data?
When receiving data from __API__, that data is always a string. In order to use it, you should parse the data with the `JSON.parse` method and the data becomes a __JavaScript object__.

# How to send JSON data to an API?
When sending data to an API or web server\, the data has to be a string. You can convert a JavaScript object using the `JSON.stringfy` method into a string in order to send it to an API or a web server.

# References