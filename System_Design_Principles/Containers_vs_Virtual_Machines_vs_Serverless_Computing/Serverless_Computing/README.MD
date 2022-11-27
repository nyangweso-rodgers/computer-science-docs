# Serverless Computing

## Table of Contents
- [What is serverless computing?](#What-is-serverless-computing?)

- [Containers vs Serverless](#Containers-vs-Serverless)

- [References]()
    - []()

# What is serverless computing?
* __Serverless computing__ lets you _run application code without creating, configuring, or maintaining a server_. The core idea is that your application is broken into separate functions that run when triggered by some action. This is ideal for automated tasks - for example, you can build a serverless process that automatically sends an email confirmation after a customer makes an online purchase.

* The __serverless__ model differs from __VMs__ and __containers__ in that you _only pay for the processing time used by each function as it executes_. __VMs__ and __containers__ are _charged while they're running_ - even if the applications on them are idle. This architecture doesn't work for every app - but when the app logic can be separated to independent units, you can test them separately, update them separately, and launch them in microseconds, making this approach the fastest option for deployment.

# Containers vs Serverless
* With __serverless__, developers don't even have to worry about when and how their application gets executed, which __containers__ they ought to put it in, or how many compute resources it will consume. They still need to write applications, of course, but after they've uploaded it to their AWS Lambda, Aurora, or CloudFront, they can call it a day. Their code will then lie dormant until it gets executed. You only pay for the machine-time that you really used, which makes the whole thing pretty economic. In contrast, you need to pay a monthly fee for __Docker__, and a __per-cluster-per-hour__ fee for Kubernetes, regardless of how much you use it.

* That doesn't mean serverless is king. It's fairly a new technology, and at the moments there are still are limits wherever you go