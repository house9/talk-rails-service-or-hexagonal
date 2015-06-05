Complexity with Rails - Augmenting MVC


----
Skinny Controller / Fat Model

* Works great for smallish code bases
* ActiveRecord Models quickly become litered with seemingly random methods



----
Skinny Controller / Skinny Model

* Service Objects
* Hexagonal Architecture



----
What is a Service Object?

[o] http://martinfowler.com/eaaCatalog/serviceLayer.html

A Service Layer defines an application's boundary and its set of available operations from the perspective of interfacing client layers.

It encapsulates the application's business logic, controlling transactions and coordinating responses in the implementation of its operations.

^ sounds a lot like a controller in MVC



----
DDD Service Object

http://martinfowler.com/bliki/EvansClassification.html

Service: A standalone operation within the context of your domain.

Services are usually accesses to external resources like Database Connection, Messaging Gateway, Repository, Product Factory.



----
Service Objects in Rails

[o] http://railscasts.com/episodes/398-service-objects?view=asciicast#Refactoring%20With%20%Services

Controller interacts with Service object - "action-related behaviour" (context)


----
Service Object == PORO



----
Code samples: initial rails app

258b23d2d6da1f91df51c8e9cdd1e9e047f3f1e3 new app
5d4a1ae90e780ec7f31ebf27863c0fbd33c3954a callback

* new rails app
* scaffold a Post title, body, published_at
* post publishing logic
  * private controller methods (boo)
  * model callback
    * ok when there are very few
    * complexity grows quickly
    * test friction



----
Code samples: Service object

service-1 branch

* move 'logic' out of callback into Service object


----
Discuss:

* controller asks questions of the service object
* there is no defined structure, what should service objects methods return?
  * ActiveRecord models
  * booleans
  * validation errors


----
Code samples: Hexagonal 'use case' object

* tell the controller, don't ask


----
Review previous discourse hacks

look at master and then go through commits
https://github.com/house9/discourse/compare/master...house9:spike-hexagonal-1



--------------
Resources:

Matt Wynne: https://www.youtube.com/watch?v=CGN4RFkhH2M
Jim Weirich: https://www.youtube.com/watch?v=tg5RFeSfBM4
