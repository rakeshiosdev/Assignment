# TechAssignment app with Clean Architecture and SwiftUI


📖 Overview  

This project is developed in SwiftUI using Clean Architecture principles. It demonstrates separation of concerns across layers (Domain, Data, Presentation), following MVVM design pattern and async/await for modern concurrency.

The app fetches and displays a list of users from a JSON API. It includes:

* DTOs and domain models

* Mappers for data transformation

* Use cases to encapsulate business logic

* Dependency Injection and Dependency Inversion for testability

* Unit tests for ViewModel, UseCase, and Repository layers    

🔹 Features  

* **Clean Architecture:** Separation between Domain, Data, and Presentation.

* **MVVM Pattern:** ViewModel handles business logic, View handles UI rendering.

* **Modern Concurrency:** Uses async/await for networking.

* **Network Layer:** Generic NetworkManager for making API calls.

* **DTO & Mapper:** Converts API JSON to domain entities.
  
* **Unit Testing:** Tests for business logic and data transformations.


🛠 Technologies Used
  
* **Language:** Swift 5+

* **UI Framework:** SwiftUI

* **Architecture:** Clean Architecture + MVVM

* **Networking:** URLSession + async/await

* **Testing:** XCTest

📷 Screenshots  

<p align="center">
<img width="300" height="600" alt="image" src="https://github.com/user-attachments/assets/66817981-13bc-4f0a-9897-673e33162645" />  
<img width="300" height="600" alt="image" src="https://github.com/user-attachments/assets/ed80615d-416f-401b-970b-76cba3d10d8d" />
</p>



