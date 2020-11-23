# WHAT IS AN API (Application Programming Interface)

An __application programming interface__ (API) is a _computing interface which defines interactions between multiple software intermediaries_. It defines: 
* the kinds of calls or requests that can be made, 
* how to make them, 
* the data formats that should be used, 
* the conventions to follow, etc.

## wwww and remote servers:
Every page on the internet is stored somewhere on a remote server (a part of a remotely located computer that is optimized to process request). _Example:_ when you type into your browser, a request goes out to Facebook remote server. Once your browser receives the response, it interprets the code and displays the page. To the browser (also known as the _client_), Facebook's server is an API --> every time you visit a page on a web, you interact with some remote server's API.

## REMARK: 
An API isn't the same as remote server - rather it's the part of the server that receives requests and sends requests.

### Example
I can have a movie API, which returns me names of drama movies when I pass the “animation” genre as input. __The advantage of using such a sort of mechanism is that the API user doesn’t get access to the whole dataset or source code and yet they can get all the information they need__. This is how many services on the internet like __Amazon Rekognition__, which is an image and video API, or __Google Natural Language__ API, which is an NLP API works. They _provide us access to some great functions without letting us have the source code, which is often valuable and kept hidden_. For example, I can send an image to Amazon Rekognition API, and it can provide me with Face detection and Analysis.

For __example__, here is a free __API__ floated by Open Movie DB, which lets us search for movies using parameters: http://www.omdbapi.com/?i=tt3896198&apikey=9ea43e94

Here I provided the IMDB id for the movie Guardians of the Galaxy 2, using the i parameter for the API. If you open this link in your browser, you will see the whole information of the movie as per the Open Movie Database.

## Definitions of Terms
1. __Endpoint__: In the above API call, the endpoint is : http://www.omdbapi.com/ . Simply this is the _location of where the function code is running_.
2. __API Access Key__: Most of the public APIs will have some access key, which you can request. For OMDB API, I had to register and get the API key which is __9ea43e94__.
3. __? Operator__: This operator is used to specify the parameters we want to send to the API or our “online function.” Here we give two params to our API i.e., IMDB movie ID and API Access Key using the ? operator. Since there are multiple inputs, we use & operator also.




## References
1. https://towardsdatascience.com/a-layman-guide-for-data-scientists-to-create-apis-in-minutes-31e6f451cd2f