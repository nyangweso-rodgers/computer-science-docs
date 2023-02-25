# Parallelism

* __Parallelism__, meanwhile, is the ability to run multiple tasks at the same time across multiple __CPU__ cores.

* _Remarks_:
    * Though they can increase the speed of your application, __concurrency__ and __parallelism__ should not be used everywhere. The use case depends on whether the task is __CPU-bound__ or __IO-bound__.

    * Tasks that are limited by the CPU are CPU-bound. For example, mathematical computations are __CPU-bound__ since computational power increases as the number of computer processors increases. __Parallelism__ is for __CPU-bound__ tasks. In theory, If a task is divided into n-subtasks, each of these n-tasks can run in parallel to effectively reduce the time to 1/n of the original non-parallel task. 

    * __Concurrency__ is preferred for __IO-bound__ tasks, as you can do something else while the IO resources are being fetched.

    * The best example of __CPU-bound__ tasks is in _data science_. Data Scientists deal with huge chunks of data. For data preprocessing, they can split the data into multiple batches and run them in parallel, effectively decreasing the total time to process. Increasing the number of cores results in faster processing.
    
    * _Web scraping_ is __IO-bound__. Because the task has little effect on the CPU since most of the time is spent on reading from and writing to the network. Other common __IO-bound__ tasks include _database calls_ and _reading_ and _writing files to disk_. Web applications, like _Django_ and _Flask_, are __IO-bound__ applications.