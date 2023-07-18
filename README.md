# Space Stroll 

Space Stroll is a mobile application that provides a platform for space enthusiasts to explore the latest space developments and access real information based on current data. It offers a variety of features for users who are interested in space and want to stay up-to-date with the latest updates and discoveries.

## Features

- **Daily Astronomy Picture:** Get a daily update of a captivating astronomy picture along with its description.
- **Updates:** Stay informed about the latest developments in space through continuously updated messages. Clicking on a message takes you to the official news source for detailed information.
- **Live Streams:** Access live streams on various topics, including NASA TV, SpaceX launches, and live footage from the ISS.
- **Upcoming and Previous Launches:** View information about upcoming and past space launches, including launch times, success status, and detailed descriptions.
- **Space Events:** Stay updated on space-related events and activities happening in real-time.
- **Mars Rover Perseverance:** Explore Mars through the latest photos captured by the Perseverance rover.
- **Space News and Blogs:** Access the latest space news, blog articles written by experts, and daily summaries of developments captured by the ISS camera.
- **Space Programs:** Learn about space programs from the past to the present, including their goals and achievements.
- **1995-Present Photos:** Discover a collection of random space photos taken between 1995 and the present, accompanied by brief descriptions.

  
## Design Pattern
- MVVM (Model-View-ViewModel)

## API
- https://api.nasa.gov/
- https://ll.thespacedevs.com/

## Third Party Libraries:

- Alamofire: A popular networking library used for handling network operations and making HTTP requests in Swift.
- Kingfisher: A powerful image loading and caching library used for displaying high-quality images in the application.
- Lottie-ios: A library for adding beautiful and customizable animations to the app's user interface.
- Parchment: A library for creating smooth and interactive page transitions, used for navigating between different sections in the app.
- Youtube-ios-player-helper: A library for integrating YouTube videos into the application and providing a seamless viewing experience.

## Getting Started

To get started with Space Stroll, follow these steps:

1. Clone the repository: git@github.com:utkucetinkaya/SpaceStroll.git
2. Install the required dependencies using CocoaPods:
   cd SpaceStroll-main
   pod install
4. Open the `SpaceStroll.xcworkspace` file in Xcode.
5. Get an Api Key at https://api.nasa.gov/. Paste it into 'DEMO_API' in the ApiRouter file in the Networking folder.
6. Build and run the app on your desired simulator or device.
7. Explore the various features and enjoy your space journey!

## Contributions

Contributions to Space Stroll are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue on the GitHub repository.

## Screens 
 <table>
  <tr>
    <td>Splash Screen </td>
    <td>Home</td>
    <td>APOD</td>   
  </tr>
  
  <tr>
    <td><img width="314" alt="Splash" src="https://github.com/utkucetinkaya/SpaceStroll/assets/61903359/0f7e638d-5f92-41d0-a0f8-15c376760f18"></td>
    <td><img width="315" alt="Home" src="https://github.com/utkucetinkaya/SpaceStroll/assets/61903359/c250fe02-067c-40d5-a2b2-48d1d93b7151"></td>
    <td><img width="315" alt="Apod" src="https://github.com/utkucetinkaya/SpaceStroll/assets/61903359/f3252aab-e64a-4cc0-83cf-99a4c764ea26"></td>
  </tr>
 </table>


 <table>
  <tr>
    <td>Live Stream</td>
    <td>Explore</td>
    <td>Launches</td>
  </tr>

  <tr>
    <td><img width="315" alt="LiveStream" src="https://github.com/utkucetinkaya/SpaceStroll/assets/61903359/22e014b3-375b-4d43-b6fb-f6d6dd957913"></td>
    <td><img width="315" alt="Explore" src="https://github.com/utkucetinkaya/SpaceStroll/assets/61903359/1552aa18-f88d-459d-aa5a-c9d143d9c78b"></td>
    <td><img width="315" alt="Launches" src="https://github.com/utkucetinkaya/SpaceStroll/assets/61903359/8c872980-7fca-4396-b5e5-121582b0f262"></td>

  </tr>
 </table>


  <table>
  <tr>
    <td>MarsPhotos</td>
    <td>Events</td>
    <td>Articles</td>
  </tr>
  
  <tr>
    <td><img width="315" alt="MarsPhotos" src="https://github.com/utkucetinkaya/SpaceStroll/assets/61903359/ab01e998-cc15-4df7-87ec-adaa3941cdcc"></td>
    <td><img width="315" alt="Events" src="https://github.com/utkucetinkaya/SpaceStroll/assets/61903359/50c51d67-1a55-4d2f-8814-296a4fc726b8"></td>
    <td><img width="315" alt="Articles" src="https://github.com/utkucetinkaya/SpaceStroll/assets/61903359/8e75575d-210f-4aa2-88b7-acc910cf7944"></td>
    
  </tr>
 </table>


  <table>
  <tr>
    <td>Astronomy Pictures Of Days</td>
    <td>Space Programs</td>
  </tr>
  
  <tr>
    <td><img width="315" alt="AstronomyPod" src="https://github.com/utkucetinkaya/SpaceStroll/assets/61903359/ca1fcf0c-af1e-40ab-a2d2-d318eded5226"></td>
    <td><img width="271" alt="space programs" src="https://github.com/utkucetinkaya/SpaceStroll/assets/61903359/f890f474-6ea7-4de2-bf4f-b725221df32b"></td>
    
  </tr>
 </table>
