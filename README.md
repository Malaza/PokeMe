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
The API doesn't implement any security tokens or basic authentication, so there is no security implementation in the project, and there are no tokens or access keys that I had to encrypt or store securely. The requests do not implement parameters anymore, instead I hardcode the query parameters in the request url string, as opposed to passing the "limit" parameter as a dictionary. This was done o further simplify the code base and ensure there is no over-engineering.

# My thinking
There are some items I intentionally left out, because it wasn't priority or its negligible functionality.

1. **Models:** My models do not transform every variable like for like, from response to model objects. I do this because I want the models to only consume what they use in the views, and nothing more. In a larger scale project the approach might be similar, or I would convert all the variables, depending on the needs.
2. **Extensions:** These classes are used to assist in simplifying the implementation, as well as avoid code reuse by writing once, and using at various places.
3. **Views:** I used the attributedStringForTitle: method to circumvent using two labels instead of one, for the heading and the content. On the tableViewCell in the **configureWith(model: PokemonItemModel, index: Int)** method, I used an index to pass to the url so I can retrieve the correct image for the correct Pokemon, because the Pokemon response returns the Pokemon in ascending order from 1 to 100. This was done because the service that lists pokemon, does not return any other information, except for a Pokemon name and url to retrieve more information related to the Pokemon, but we need to display the Pokemon thumbnail, without having to run another service call on the dashboard for the sprites. Even if we had taken the aapproach to call the url retrieved with the Pokemon name, that would have been a very expensive operation, attempting to call for every Pokemon info and parsing all of that, converting it and returning it to the cell, and there was definitely going to be heavy lag on the tableviewcells.
4. ****
5. **Presenter:** The presenter should use wrapper/transform classes, which do the heavy lifting of the transformation of data from response to view model objects, as opposed to transforming data inside the presenter
