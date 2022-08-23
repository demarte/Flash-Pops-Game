# Flash Pops Game
#### Video Demo:  <https://www.youtube.com/watch?v=zxn1yEWZDjA>
#### Description:

##### What is Flash Pops Game?

- Flash Pops is a Game written in [Swift](https://www.swift.org) for macOS platforms. The Game is quite simple, your task is to guess the name of a specific movie when you are listening to a remarkable song about that movie (or tv show). For each right answer, you earn 1 point and your total score will increase by 1. If your answer is wrong, you'll not lose any point! Achieving a specific number of points, you'll be able to play the next level (more challenges will come).

#### About technical decisions

- Programming Language: 100% Swift. For macOS platforms, you need to choose between Swift and Objective-C. So, I decided to use Swift because is more modern, and Apple recommends it.
- Frameworks: [SwiftUI](https://developer.apple.com/xcode/swiftui/). SwiftUI is a new Apple framework to help you build complex interfaces across all Apple platforms. SwiftUI uses a declarative syntax and maintains a great principle, The Single Source of Truth. This behavior helps you to keep updated with your data and your UI across all parts of your app.
- Structural Design Pattern: MVVM (Model-View-View-Model). A pretty common design pattern for mobile development.
- Developer Tools and IDE: Xcode (recommended).

#### Initial flows

- The app has 2 initial flows. The first flow occurs when the user never played before. In this case, the data is loaded from a JSON file. The second flow occurs when the user made 1 point at least. In this case, the data will be loaded from [UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults), a simple key-value pair database. For each new point, the app database (UserDefaults) will be updated. 

#### Project Folders

- Source: Contains all the source code files
- Resources: Contains all the resources such as images, JSON, and the about text.
- Components: All the reusable views come here, like CardView.
- Screens: All the screens come here, like DetailScreen
- Model: The game logic model.
- Store: The game source of truth
- Utilities: Network requests, database connection, and image cache service.

#### Project Files

- Store: Controls the game flow. Decides if data will be loaded from JSON or database. Provides the data through the app publishing every change. Conforms to ObservableObject protocol.
- Networker: Creates a request and fetches the data from the URL.
- Localizable: The app supports English and Portuguese, so Localizable manages which file will be loaded according to the user's language. Loads English by default.
- Views: Every View file behaves like a View protocol. Each view is a piece of screen UI, like a LEGO block.

<img width="1291" alt="Screen Shot 2022-08-23 at 1 57 22 PM" src="https://user-images.githubusercontent.com/19983507/186218402-7763c00a-f674-45de-a4c2-66a55e163d58.png">
