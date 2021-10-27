# Test Driven Development (TDD)
__TDD__ means that you write tests before you write the code, which is why you cannot retroactively apply TDD to an existing project.

# TDD Rule
Prepare test cases before writing the actual code. i.e., writing code for the test before you write code for the application.

# Steps in TDD
1. Write a test that tests a specific part of the user story or feature you are developing
2. Run the test. It should fail right now, because you haven't written any code yet. If your test doesn't fail your existing code already behaves correctly or more likely your test doesn't test anything.
3. Make the simplest possible change to your code that ensures the test succeeds. It's important that you do not make changes that go beyond your test, even if you know that you're going to change that later. This ensures that you do not introduce behavior that is untested because in TDD your tests are a major part of your documentation. It is also important that you do not touch anything that is unrelated to the test your trying to satisfy.
4. Run your test again. It should now succeed. But if it fails go back to 1. Make sure that your test is actually correct before you try to find the problem in your code.
5. When your test is satisfied refactor your code. Since in step 3 you did not touch anything unrelated to the test you may have introduced code smells. But because all of your existing code is now fully covered by tests (one of the reasons why TDD would be used in the first place) you can now safely reorganize it, and as long as your tests still succeed you're doing it right.


# References
