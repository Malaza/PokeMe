# Installation
The project has two dependencies, namely Lottie for animating loading views, and Alamofire for network calls. I would usually write networking layer using URLRequest, but I saw in the spec there was a requirement to use a library for the network calls, and because iOS doesn't have Retrofit, I used Alamofire.
These dependencies do not need you to run terminal commands like Cocoapods, as I used Swift Package manager to install them.

# Architecture
I used the VIPER architecture in the project. I created views, table views as well as custom views to drive the layout. The presenter and interactor are pretty straightforward in what they do. The router is responsible for creating, as well as navigating to/from view controllers.

# Testing
I tested the core functionality in the application, in the presenters, and the interactors. I didn't test the views, or the routers.

# Design
The design of the project is inspired by a Pokedex I saw online, I did my best to not go too crazy with the user interface because of the requirement to keep the project simple, but I also wanted to add a bit of colour, to satisty the requirement.

# Security
The API doesn't implement any security tokens or basic authentication, so there is no security implementation in the project, and there are no tokens or access keys that I had to encrypt or store securely. The requests do not implement parameters anymore, instead I hardcode the query parameters in the request url string, as opposed to passing the "limit" parameter as a dictionary. This was done o further simplify the code base and ensure there is no over engineering

# My thinking
There are some items I intentionally left out, because it wasn't priority or its negligible functionality.

1. **Models:** My models do not transform every variable like for like, from response to model objects. I do this because I want the models to only consume what they use in the views, and nothing more. In a larger scale project the approach might be similar, or I would convert all the variables, depending on the needs.
2.
3. The presenter  
