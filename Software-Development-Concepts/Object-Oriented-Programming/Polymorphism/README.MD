# Polymorphism

* While inheritance is the most unique trait that object-oriented languages make claim to, polymorphism is probably the most powerful.

* Polymorphism is the ability of a variable, function, or object to take on multiple forms. For example, in a programming language that supports inheritance, classes in the same hierarchical tree may have methods with the same name but different behaviors.

* __Polymorphism__: allows two or more objects to behave like one another, which allows them to be used interchangeably. For example, if a method or function knows how to paint a Vehicle object, then it can also paint a Car or Boat object, since they inherit their data and behavior from the Vehicle.

# Classic Example
* A classic example is a __Shape__ class that __Rectangle__, __Circle__, and __Triangle__ can inherit from.

* With polymorphism, each of these classes will have different underlying data. The circle needs a center and radius. The rectangle needs two co-ordinates for the top left and bottom right corners. The triangle needs coordinates for the corners.

* By making each class responsible for its data and its code, you can achieve polymorphism.

* In this example, each class would have its own __Draw()__ method. This allows the code that uses the different shapes to be simple and easy, and more importantly, it can treat shapes as the same even though they are different. It hides the complexities of the difference behind a clean abstraction.

    ```py
        # python
        shapes = [Circle(5, 10), Rectangle(1, 3, 5, 6)]
        for shape in shapes:
            print(shape.Draw())
    ```

* This is in contrast to the functional way of doing things where you would have had separate functions that have different function signatures, like draw_rectangle(x1, y1, x2, y2) and draw_circle(center, radius).