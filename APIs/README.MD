# Application Programming Interface (API)

## API Concepts
- [Characterics of APIs](##Characteristics-of-APIs)
- [Classification of APIs](##Classification-of-APIs)
    - [External API](###External-API)
    - [Partner API](###Partner-API)
    - [Internal API](###Internal-API)

- [Rate Limiting](##Rate-Limiting)

- [REST API](##REST-API)

## Characteristics of APIs
1. __APIs__ form a bridge for interactions between services e.g., mainframe and databases and customer-facing services. __APIs__ enable organizations to share information with external developers, business associates, and other teams within the organization.

2. __APIs__ allow you to expose some functions of a program. __APIs__ providers can share positions of their code with developers but do not have to release everything for new applications and services to be developed. __APIs__ from different providers can be combined by developers to create new applications.

3. A high-quality __API__ facilitates the development of applications by allowing different functionalites to be created independently while offering a complete set of capabilities for development.

## Classification of APIs
__APIs__ are classified as follows based on how they are consumed:
- External(public)
- Partner(Protected)
- Internal (Private)

### External API
Present the API provider or business an opportunity to share certain data sets, services, and capabilities with developers. This capability enables the use of business's assets to develop innovative, new applications and allows  for existing applications and services to be modified.

They help foster relationships between internal and external developers and drive the creation of new application and services that are not possible without the business publicly sharing some of it's data and services.

### Partner API
These __APIs__ are open to select business partners of a company. They are specifically designed for partners to be able to access business functions in context to the business relationship e.g., online catalog, ordering, and recommendation.

In this type of __API__, typically the companies want to control who has access to the data they are exposing and want to have a greater control over how the data is used.

### Internal API
Organizations use API internally or privately to develop new ways of operating and managing their businesses. These internal __APIs__ can be developed to more efficiently process internal documents, manage process, share information, account for assests, and other business processes in order to drive increased productivity.


## Rate Limiting
__Rate limiting__ is a technique which restricts the number of requests that users can make in a given time frame. Some APIs may actually block your IP or API keys if you go over the defined rate limit too often. 

__Remark__:_Be careful not to exceed the limits set by the API developers. Otherwise, you might have to wait a while before calling that API again._

## REST API
__Representational State Transfer (REST) API__ is an architectural style for building resources on web. Examples of resources for websites include: _HTML documentation_, _images_, and _script files_.

## References
1. https://realpython.com/python-api/#learning-advanced-api-concepts