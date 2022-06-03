# Webhooks
## Table of Contents
- [APIs vs Webhooks](#APIs-vs-Webhooks)
- [How Webhooks Work](#How-Webhooks-Work)
- [When to use Webhhoks](#When-to-use-Webhhoks)
- [Webhook Maturity](#Webhook-Maturity)

# Introduction to Webhooks
__Webhooks__ allow third-party services to send data to an application in real-time. __Webhooks__ are another way apps communicate and exchange data, just like __APIs__, but a little different. i.e., there is no __request__ and __response__ system ,just an __event__ and __automatic response__.

# How Webhooks Work
When a specified event occurs, a __webhook__ makes an __HTTP request__ to a designated __URL__. This allows you to push data to your application the moment a particular event happens. i.e.,
1. A set event or action triggers webhooks
2. Once triggered, the server sends and HTTP POST response


# When to use Webhhoks
* __Webhooks__ are commonly used when real-time data is required, but the data changes relatively infrequently. Instead of sending repeated __API requests__ to get live data, a __webhook__ can be triggered every time there is an update. This will ensure you have accurate data without having to make frequent __API requests__, which can be costly or use a lot of bandwidth.
* __Webhooks__ are also used to created notifications that are triggered by specific  events, making them very common for e-commerce, communication, social media and other platforms.

# Webhook Maturity
__Webhooks__ are the second most commonly used technology, right behind __REST APIs__. __Webhooks__ are also used by many of today's leading software companies including Twilio, Square, and MailChimp. 