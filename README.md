# CostaCoffee
Basic demo project

Public access to the project -> https://github.com/ddkdimitrov/CostaCoffee

Goals:

1. Trying following MVVM + C architect desigh pattern. 
2. Trying practicing my skills using Coordinators + dependancy injections. 
3. Trying to use async/await and throws errors.
4. Used Generics 
5. Used Delegates and closures for binding between Services/Coordinators and Controllers

I could create the project with other options like:

1. MVVM + Combine | MVVM + RxSwift (UIkit)
2. SwiftUI + MVVM + Combine
3. Swift UI + MVVM
4. MVVM + C without storyboard (UIkit)
5. MVVM (UIkit)
6. MVC + C (UIkit)

Basically dont use MVP and VIPER. 

For that example it was much easier to do that without Reactive. Need to invest few days practicing with reactive before to create some example project witn Combine/RxSwift :) 


Warrning:

1. In that short demo I didint make Token/password storing to Keychain. Basically I had 2 days to create the project. Working mainly on 6.09 and 8.09. Cus some ot the things were newer for me like (MVVM + C) and had some delay-time with it. Didnt want to make it just MVVM :) 
2. I also didint add Error alerts for that short-term project.
3. I could progress more the Unit testing, the point is clear but didint have a time to finish it. Mainly said: Unit testing allows us to check for foundamental methods that we use in the life cycle in the app and to prevent different kind erros if someone else tries to modify some method. 


File separation:

1. I separated every kind files in different folder.
In a big and complex project im gonna separate the files in other way for easier work as: One folder: (viewModel/viewcontroller/ApiService/cells/views) based on the screen that im working. 


NOTES:

1. I could extend the project more by using some Setup classes for styling the CSS of the app, texts and t.n.t
2. I could make different Targets based on the API Version if we have Development/Production environment. 
3. I could use open-closed solid principle to the classes that can be extendable in the future with a new futures. 
4. I used mostly Singleton in the API client/error/decode managers but could use and Dependancy Injection instead a Singleton. Everything depends on the programmer style of coding too :) 
5. I could make the process even more complex if I had a lot of data in one ViewController, making everything more complex and separating one screen to many viewcontrollers using the same conceptions like MVC/MVVM/MVVM+C. Mainly said when we have multiple separation of one screen(to many view controllers), even MVC is enough if we are working with that pattern correctly!!! 



Regardless of your conclusion, please give me a feedback on how I did and if there is something I need to improve.

I think there are and other things I could mentione, but at that stage, thats all. Thank you for your time and sorry for the spam! :) 





