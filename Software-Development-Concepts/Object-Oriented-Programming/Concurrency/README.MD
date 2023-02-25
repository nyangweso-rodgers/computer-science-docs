# Concurrency

*  __Concurrency__ is when multiple instructions execute at the same time(concurrently). __Concurrency__ is the ability to run multiple tasks on the __CPU__ at the same time. Tasks can start, run, and complete in overlapping time periods. In the case of a single __CPU__, multiple tasks are run with the help of context switching, where the state of a process is stored so that it can be called and executed later. Situations for __Concurrency__ are as below:
    - __Multiple Threads__
        - multiple threads executing within a single process
        - Example_: Multi-threaded .NET application accessing a shared collection

    - __Multiple Processes__
        - Several processes executing on a single computer system
        - _Example_: Multiple applications accessing a common file

    - __Multiple Systems__
        - Several systems, each accessing a common resource
        - _Example_: Multiple processes accessing a common database table.