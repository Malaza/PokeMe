# Installation
The project has two dependencies, namely Lottie for animating loading views, and Alamofire for network calls. I would usually write networking layer using URLRequest, but I saw in the spec there was a requirement to use a library for the network calls, and because iOS doesn't have Retrofit, I used Alamofire.
These dependencies do not need you to run terminal commands like Cocoapods, as I used Swift Package manager to install them.

# Architecture
I used the VIPER architecture in the project. I created views, table views as well as custom views to drive the layout. The presenter and interactor are pretty straightforward in what they do. The router is responsible for creating, as well as navigating to/from view controllers.

# Testing
Because of time constraints, I didn't prioritize the testing functionality, although I added the Cuckoo testing framework into the project.

# Design
The design and color scheme on the project is inspired by this Dribbble project: https://dribbble.com/shots/8899481-My-Bar-Cocktail-app-Full-flow/attachments/1069490?mode=media

# Security
On the function private func getAuthHeaders() -> [String: String], I have left the X-RapidAPI-Key openly exposed, without encrypting it, Github even flagged it as a vulnerability in the project, because of the disposable nature of this project, I didn't take steps to secure/encrypt the key, but I understand the importance of doing so, one way I would have done that, is by keeping the key in the Keychain.

# Whats missing?
There are some items I intentionally left out, because it wasn't priority or its negligible functionality.
