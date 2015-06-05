Complexity with Rails - Augmenting MVC

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

----
Skinny Controller / Fat Model

* Works great for smallish code bases
* ActiveRecord Models quickly become litered with seemingly random methods

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

----
Skinny Controller / Skinny Model

* Service Objects
* Hexagonal Architecture

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


----
What is a Service Object?

[http://martinfowler.com/eaaCatalog/serviceLayer.html](http://martinfowler.com/eaaCatalog/serviceLayer.html)

> A Service Layer defines an application's boundary and its set of available operations from the perspective of interfacing client layers.

> It encapsulates the application's business logic, controlling transactions and coordinating responses in the implementation of its operations.

^ sounds a lot like a controller in MVC

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


----
DDD Service Object

[http://martinfowler.com/bliki/EvansClassification.html](http://martinfowler.com/bliki/EvansClassification.html)

> Service: A standalone operation within the context of your domain.

> Services are usually accesses to external resources like Database Connection, Messaging Gateway, Repository, Product Factory.

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


----
Service Objects in Rails

* [http://railscasts.com/episodes/398-service-objects?view=asciicast#Refactoring%20With%20%Services](http://railscasts.com/episodes/398-service-objects?view=asciicast#Refactoring%20With%20%Services)

Controller interacts with Service object - "action-related behaviour" (context)

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

----
Service Object == PORO

* there are no guidelines
* there are no rules

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


----
Code samples: initial rails app

* new rails app
* scaffold a Post title, body, published_at
* post publishing logic
  * private controller methods
    * avoid if possible
  * model callback
    * [5d4a1ae90e780ec7f31ebf27863c0fbd33c3954a](https://github.com/house9/talk-rails-service-or-hexagonal/commit/5d4a1ae90e780ec7f31ebf27863c0fbd33c3954a)
    * ok when there are very few
    * complexity grows quickly
    * test friction


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


----
Code samples: Service object

service-1 branch: [3e1f5e1fb03d13e6d9e2f7548e912015ce08f9a7](https://github.com/house9/talk-rails-service-or-hexagonal/commit/3e1f5e1fb03d13e6d9e2f7548e912015ce08f9a7)

* move 'logic' out of callback into Service object

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


----
Discuss:

* controller asks questions of the service object
* there is no defined structure, what should service objects methods return?
  * ActiveRecord models
  * booleans
  * validation errors

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


----
Code samples: Hexagonal 'use case' object

usecase-1 branch

* add success and failure methods for each action
  * [49e272aa3fb973225302200edbd8c3e9648052e8](https://github.com/house9/talk-rails-service-or-hexagonal/commit/49e272aa3fb973225302200edbd8c3e9648052e8)
* move 'logic' out of callback into UseCase object
  * [93b03d40a654c2bf851f640efc72384589f8b575](https://github.com/house9/talk-rails-service-or-hexagonal/commit/93b03d40a654c2bf851f640efc72384589f8b575)
* UseCase object tells the controller, the controller does not ask


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


----
Review previous discourse hacks

look at master and then go through commits
[https://github.com/house9/discourse/compare/master...house9:spike-hexagonal-1](https://github.com/house9/discourse/compare/master...house9:spike-hexagonal-1)

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>



--------------
Resources:

* Matt Wynne: [https://www.youtube.com/watch?v=CGN4RFkhH2M](https://www.youtube.com/watch?v=CGN4RFkhH2M)
* Jim Weirich: [https://www.youtube.com/watch?v=tg5RFeSfBM4](https://www.youtube.com/watch?v=tg5RFeSfBM4)

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
