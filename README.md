# Installing Dependencies

Now we're going to integrate our libraries into the Xcode project.

- Close Xcode Project
- Open Terminal
- Enter command `cd ~/path/to/your/project`
- Enter command `pod install`

> Wait for this to finish, depending on the requirements of the `Podfile`, particularly with new projects, this may take a minute or two.  Just leave it.

When cocoapods is done installing libraries, you will get a terminal readout that says:

>[!] From now on use `<#Your Project#>.xcworkspace`.

Follow this instruction and henceforth, **use the workspace** instead of your project.

#Test task for the position of an iOS Developer

You need to develop an app on Swift for iOS, “Interesting facts about numbers”. The application should allow the user to enter the number about which he wants to know an interesting fact, as well as - to randomly generate a number and get a fact about it. Application must contain 2 screens.

Main screen
It should be divided into two parts, the upper part is a field for entering a number, the button "Get fact" and the button "Get fact about random number", the lower part - display the history of user requests, each history element should show the number the user searched for and fact preview (everything that fits in one line), clicking on the element should open the 2nd screen.

2nd screen
Must display to the user the number and full text of the fact about the previously selected number. It should also be possible to return to the previous screen.

Task description
- To get information about the number - use api http://numbersapi.com
- For example, for the number "10" - the query http://numbersapi.com/10
- To get the fact about the random number - http://numbersapi.com/random/math

Main requirements
programming language: Swift, IDE - Xcode, SPM, iOS 14+;
code must be stored on github, public link should be given;
Queries to api must occur asynchronously (use Swift Concurrency);
Use Realm to store data (fact search history);
SwiftUI, exact UI of the application is free, it is not a criterion for evaluating a test task;

