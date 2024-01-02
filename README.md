# GitRepos
A simple iOS application that retrieves data from an API, presents it in a table view, and incorporates the principles of clean architecture.


<video width="300" height="600" controls>
    <source src="https://github.com/Abdullah8888/GitRepos/blob/main/GitRepos/Resources/sample_video.mp4" type="video/mp4">
</video>

## API
- https://api.github.com/repositories

## Dependencies
The project used SPM to install the follwowing dependencies:-
- RxSwift
- SDWebImage
- Realm
- Alomofire


## Design Pattern
- MVVM-C

## Features
The project consist of two features:-
- Onboarding
- User
    - UserListing
    - UserDetails
    
## Functionalites
The project consist of the functionalities:-
- Added App icon.
- Pull-to-refresh functionality to refresh the list of items.
- Caching to store the fetched data locally and provide offline
support.
- Proper error handling and provide appropriate UI feedback if
the API request fails.
- Provide a clean and user-friendly UI design.
- Fetch and display a list of items, also display more information about the selected item

