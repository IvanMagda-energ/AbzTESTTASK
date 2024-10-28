# Table of Contents
1. [Description](#description)
2. [Getting started](#getting-started)
3. [Usage](#usage)
4. [Arhitecture](#arhitecture)
5. [Structure](#structure)
6. [Running the tests](#running-the-tests)
7. [Dependencies](#dependencies)
8. [Design](#design)
9. [API](#api)

# AbzTESTTASK
A test project to assess the skills of a candidate for the iOS developer position.

# Description
<p>
  This is a simple project designed to demonstrate the developer's skills in working with internet requests<br>
  (specifically, the main types of requests), building a user interface according to design specifications,<br> 
  writing business logic, and structuring the project effectively.<br>

  The app can display a list of users and register new users. All fields are validated during form completion in the registration process. 
  Any errors are handled appropriately and displayed on the screen.<br>
  The app also monitors the internet connection status.<br>
  It supports two localizations: Ukrainian and English.<br>

  All code is formatted correctly according to SwiftLint guidelines.
  </p>

# Getting started
<p>
1. The app requires a minimum deployment target of iOS 17, so ensure your Xcode version supports this target to proceed with the build and testing.<br>
2. Download the AbzTESTTASK project files from the repository.<br>
3. No additional packages or pods are required for this app.<br>
4. Open the project files in Xcode.<br>
5. Run the active scheme.<br>
6. Ensure that you have an active internet connection; if not, an appropriate screen should be displayed.<br>
  
You should first see the splash screen, followed by the main view on the tab displaying the list of all registered users.<br>

Now you can explore how this app works.<br>
</p>

# Usage
<p>
On the first tab, you can see a list of all registered users sorted by registration date.<br> 
The second tab opens a form for registering a new user, which must be filled out completely,<br> 
including adding a photo, before submitting the registration. All form fields undergo validation to ensure correct input,<br> 
and each field is required.<br>

If all fields are correctly filled, a success notification will appear on the screen,<br> 
indicating that the user has been successfully registered. The new user will also appear at the top of the registered users list.<br> 
If the user is already registered, an appropriate notification will appear on the screen. For photo addition,<br> 
two sources are implemented: the photo gallery and the phone camera.<br>

The app supports two localizations: Ukrainian and English.<br> 
All potential errors that may occur during usage are properly handled, with relevant notifications displayed.<br> 
Additionally, the app monitors the internet connection status and notifies the user if it is unavailable.
</p>

# Architecture
* AbzTESTTASK project is implemented using the <strong>Model-View-ViewModel (MVVM)</strong> architecture pattern.
* The network layer is responsible for retrieving all necessary data from the API.
* The view models implement the logic related to preparing data for display and provide the data handling logic associated with user interaction on the screen.
* The views are responsible for displaying data on the screen. They react to changes in the view models and update the screen accordingly.
* The project does not have a database. You can see all users only when the app is online.<br><br>
* Utility classes help enhance the user experience.
* For previews, mock data is used.

# Structure 
* "Extensions": Files that extend native classes with additional functionality.
* "Data": Data source: This includes code for making HTTP requests to a web server, parsing responses, handling any errors that may occur, and providing mock data for previews.
* "Domain": It includes all necessary models for making API requests.
* "Localization" It includes two languages: Ukrainian and English.
* "Preview Content": Any content for previews.
* "Resources": Non-code files that are used by the project. These include images, colors, and other types of assets.
* "Utils": Utility files and classes.
* "Views": Views are used to display data and additional view models.
* "ViewStyles" Files that help enhance custom styles for views.

# Running the tests
<p>The app does not implement any tests.</p>

# Dependencies
<p>The app has no dependencies.</p>

# Design 
* Link to the design is [here](https://www.figma.com/design/Ip7bsgTfPlzszIEyIwXzUa/Testtask---App?node-id=0-1&node-type=canvas&t=aEFCAlIeyaOBEt13-0) <br>

# API 
* We are using a REST API
* API documentation is [here](https://openapi_apidocs.abz.dev/frontend-test-assignment-v1)
* For HTTP networking we are using URLSession
