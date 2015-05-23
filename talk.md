Complexity with Rails - Augmenting MVC



----
Skinny Controller / Skinny Model

* Service Objects
* Hexagonal Architecture 



----
What is a Service Object?

[o] http://martinfowler.com/eaaCatalog/serviceLayer.html

A Service Layer defines an application's boundary and its set of available operations from the perspective of interfacing client layers. 

It encapsulates the application's business logic, controlling transactions and coor-dinating responses in the implementation of its operations.

^ sounds a lot like a controller in MVC



----
DDD Service Object

http://martinfowler.com/bliki/EvansClassification.html

Service: A standalone operation within the context of your domain.

Services are usually accesses to external resources like Database Connection, Messaging Gateway, Repository, Product Factory.



----
Service Objects in Rails

[o] http://railscasts.com/episodes/398-service-objects?view=asciicast#Refactoring%20With%20%Services

Controller interacts with Service object - "action-related behaviour" 


----
Service Object == PORO



----
Live coding... 

* new rails app
* scaffold a Post title, body, published_at
* callback complexity



----
Live coding... Service object

* move 'logic' out of callback into Service object



----
Live coding... Hexagonal 'use case' object

* tell the controller, don't ask


--------------
Resources: 

Matt Wynne: https://www.youtube.com/watch?v=CGN4RFkhH2M
Jim Weirich: https://www.youtube.com/watch?v=tg5RFeSfBM4
