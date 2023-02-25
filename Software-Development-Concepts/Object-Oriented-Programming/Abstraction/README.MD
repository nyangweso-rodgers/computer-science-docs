# Abstraction in OOP

* __Abstraction__ and __encapsulation__ typically go hand in hand, and if we aren't careful with our definitions, they can seem like the same thing.

* The goal of __abstraction__ is to handle complexity by hiding unnecessary details.

# Abstraction vs encapsulation
* While definitions are always changing, I like to think about abstraction and encapsulation in the following way.

    - Abstraction is a technique that helps us identify what information and behavior should be encapsulated, and what should be exposed.

    - Encapsulation is the technique for organizing the code to encapsulate what should be hidden, and make visible what is intended to be visible.

# So are we encapsulating or abstracting our code when we make things private?
* Both. We are almost always doing both. The process of using the double underscore is a form of encapsulation. The process of deciding which data deserves to be hidden behind the double underscore is abstraction.