# About
A simple application which can fetch data from open api and show it on the application. 

# Tools & Tech Stack
<li> XCode 15
<li> iOS Deployment target - 17.0

# Features and Architecture
<li> Jailbreak device detections
<li> Unit tests
<li> MVVM architecture

# Reusable components
<li> Profile image

# Frameworks used 
<li> Foundation
<li> SwiftUI
<li> Combine
<li> XCTest

# App flow 
<li> Launch the app.
<li> If the device is jail broken, user can't use the app. 
  <li> User can exit the application by tapping on the `Exit` button on the alert displayed
<li> If the device is not jail broken, 
  <li> List of Marvel heros from web api is shown on the screen. 
  <li> While loading user can notice Progress indicator
  <li> Tapping on any list row will navigate to next screen 
  <li> On detail screen, user can see the details of the selected hero

# App Screenshots
  ## App flow
 <img src="https://github.com/sravanpabolu/MarvelHero/assets/10293689/09f03038-6c90-4fdb-a98b-1f7696f1a41f" width="25%" height="25%">
 <img src="https://github.com/sravanpabolu/MarvelHero/assets/10293689/92f2d576-16b0-4f84-ba69-fd866e1327f5" width="25%" height="25%">
 <img src="https://github.com/sravanpabolu/MarvelHero/assets/10293689/5cfeda54-e1a6-42cd-be8a-733a5ed01e7f" width="25%" height="25%">
 <img src="https://github.com/sravanpabolu/MarvelHero/assets/10293689/0bf4bce5-7e76-4c2f-8752-57e60abdfeba" width="25%" height="25%">
 <img src="https://github.com/sravanpabolu/MarvelHero/assets/10293689/a3e7e644-111c-4f51-8c46-862d490b6150" width="25%" height="25%">
 <img src="https://github.com/sravanpabolu/MarvelHero/assets/10293689/fc64125e-eb27-40e3-86ab-63b66f777347" width="25%" height="25%">
 <img src="https://github.com/sravanpabolu/MarvelHero/assets/10293689/9fb0d18c-32bc-4c16-b01e-d8019894e353" width="25%" height="25%">
 
 ## Jail broken support
 <img src="https://github.com/sravanpabolu/MarvelHero/assets/10293689/c4b4f143-849e-466c-8a78-d09a3c6af2d6" width="25%" height="25%">
 <img src="https://github.com/sravanpabolu/MarvelHero/assets/10293689/14c5fddf-66b5-476b-a73e-1430b5149842" width="25%" height="25%">

