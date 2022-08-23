# Flash Pops Game
#### Video Demo:  <URL HERE>
#### Description:

##### What is Flash Pops Game?

- Flash Pops is a Game written in [Swift](https://www.swift.org) for macOS platforms. The Game is quite simple, your task is guess the name of an specific movie when you are listening a remarkable song about that movie (or tv show). For each right answer, you earn 1 point and your total score will increase by 1. If your answer is wrong, you'll not loose any point! Achiving an specific number of points, you'll be able to play the next level (more challenges will come).

#### About technical decisions

- Programming Language: 100% Swift. For macOS platforms you need to choose between Swift and Objective-C. So, I decided to use Swift because is more modern and Apple recomends for new applications.
- Frameworks: [SwiftUI](https://developer.apple.com/xcode/swiftui/). SwiftUI is a new Apple's framework to helps you build complex interfaces accross all Apple platforms. SwiftUI uses declatative syntax and mainteins a great principle, The Single Source of Thruth. This behavor helps you to keep updated your data and your UI across all parts of your app.
- Structural Design Pattern: MVVM (Model-View-View-Model). A pretty comum design pattern for mobile development.
- Develper Tools and IDE: Xcode (recomended).

#### Intial flows

The app has 2 initial flows. The first flow, when the user never played before. In this case the data is loaded from a JSON file. The second flow occours when the user made 1 point at least. In this case the data will be loaded from [UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults), a simple key-value pair database.

