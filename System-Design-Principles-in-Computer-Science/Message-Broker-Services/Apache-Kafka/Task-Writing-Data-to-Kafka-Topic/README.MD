# Task - Writing Data to Kafka Topic

# General Definitions
1. Clients writing to Kafka are called __𝗣𝗿𝗼𝗱𝘂𝗰𝗲𝗿𝘀__, 
2. Clients reading the Data are called __𝗖𝗼𝗻𝘀𝘂𝗺𝗲𝗿𝘀__.
3. Data is written into __𝗧𝗼𝗽𝗶𝗰𝘀__ that can be compared to __𝗧𝗮𝗯𝗹𝗲𝘀__ 𝗶𝗻 __𝗗𝗮𝘁𝗮𝗯𝗮𝘀𝗲𝘀__.
4. __Messages__ sent to __Topics__ are called __𝗥𝗲𝗰𝗼𝗿𝗱𝘀__.
5. __Topics__ are composed of __𝗣𝗮𝗿𝘁𝗶𝘁𝗶𝗼𝗻𝘀__.
6. Each __Partition__ behaves like and is a set of __𝗪𝗿𝗶𝘁𝗲 𝗔𝗵𝗲𝗮𝗱 𝗟𝗼𝗴𝘀__.

# Steps - Writing Data 
* There are two types of records that can be sent to a Topic - __𝗖𝗼𝗻𝘁𝗮𝗶𝗻𝗶𝗻𝗴 𝗮 𝗞𝗲𝘆 𝗮𝗻𝗱 𝗪𝗶𝘁𝗵𝗼𝘂𝘁 𝗮 𝗞𝗲𝘆__.
* If there is no key, then records are written into Partitions in a __𝗥𝗼𝘂𝗻𝗱 𝗥𝗼𝗯𝗶𝗻 𝗳𝗮𝘀𝗵𝗶𝗼𝗻__.
* If there is a key, then records with the same keys will always be written to the __𝗦𝗮𝗺𝗲 𝗣𝗮𝗿𝘁𝗶𝘁𝗶𝗼𝗻__.
* Data is always written to the __𝗘𝗻𝗱 𝗼𝗳 𝘁𝗵𝗲 𝗣𝗮𝗿𝘁𝗶𝘁𝗶𝗼𝗻__.
* When written, a record gets an __𝗢𝗳𝗳𝘀𝗲𝘁__ assigned to it which denotes its __𝗢𝗿𝗱𝗲𝗿/𝗣𝗹𝗮𝗰𝗲 𝗶𝗻 𝘁𝗵𝗲 𝗣𝗮𝗿𝘁𝗶𝘁𝗶𝗼𝗻__.