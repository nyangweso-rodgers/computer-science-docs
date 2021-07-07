## Django
With Django, you can build applications much more quickly without sacrificing features. The developer experience is also quite good – and not just because Python is awesome. It's also because there are good debugging tools, logging is already set up, and there's a server that automatically restarts with file changes.

### Features of Django
#### 1. Django's Admin Interface
So many clients need to have a view into their application so they can manage users, data, or content on pages. Usually, the client will not be technical or have time enough to dive into the actual code and make changes.

Django's admin interface is a great solution. Without any extra configuration, you get a powerful, fully-customizable, login-protected admin area that displays all of your application's data.

#### 2. Django has Built-in Auth
Django comes with built-in authentication via sessions. What if you want to use tokens? Just install the Django REST Framework (DRF) library which comes with token auth.
Any authentication system you use in a Django project will also use the ORM.

#### 3. ORM
Have you ever tried to manually set up an ORM to connect your database to your application? For example, SQLAlchemy, TypeORM, or Sequelize. Even with good documentation, it's not easy. You have to get different types of queries to work, as well as migrations, seeding, and so much more.

Django provides all of that for you out of the box. Just plug in the credentials of your favorite database - Postgres, MySQL, Mongo, and so on - and Django handles the rest. You create models and interact with them via the same Python interface no matter what database you choose.

__REMARK:__ _All of the features listed so far are not exclusive to Python's Django alone. The difference is that most frameworks let you set up your own ORM, Authentication, and so on. Django does all of this with very little effort. This means that you can ship features, MVPs, and applications more quickly._

#### References
1. https://www.freecodecamp.org/news/10-reasons-to-try-django-for-client-projects/