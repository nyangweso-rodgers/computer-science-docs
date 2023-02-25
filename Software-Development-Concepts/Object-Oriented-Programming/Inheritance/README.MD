# Inheritance

* __Inheritance__: allows objects to derive _attributes_ and _functionality_ from other objects, creating a hierarchy moving from more general objects to more specific. 

* For example, a Car and a Boat are both specific types of Vehicles. Objects can inherit their behavior from a single parent object or multiple parent objects, and are referred to as __child objects__ when they do.

* Languages without classes like __Golang__ and __Rust__ provide _encapsulation_ and _abstraction_ features. In fact, almost every language does. __Inheritance__, on the other hand, tends to be unique to class-based languages like Python, JavaScript, Java, and Ruby.

# When should I use inheritance?
* Inheritance is a powerful tool, but it is a really bad idea to try to overuse it. You should only use inheritance when every instance of the child class can also be considered the same type as the parent class.

* When a child class inherits from a parent, it inherits everything. If you only want to share some functionality, inheritance probably is not the best answer. In that case you would probably just want to share some functions, or maybe make a new parent class that both classes inherit from.

# Inheritance hierarchy
* There is no limit to how deeply we can nest an inheritance tree. For example, a __Cat__ can inherit from __Animal__ which inherits from __LivingThing__.