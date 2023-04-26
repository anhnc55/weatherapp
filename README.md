# Weather App use the WeatherKit
**Clone Apple Weather App using the WeatherKit on iOS 16**

|       |         |
| ----- | ------- |
|![Simulator Screen Shot - iPhone 13 - 2022-06-26 at 16 27 03](https://user-images.githubusercontent.com/7624652/175808443-dc9be768-5cdf-4549-8099-e579519ed4bd.png) | ![Simulator Screen Shot - iPhone 13 - 2022-06-26 at 16 27 11](https://user-images.githubusercontent.com/7624652/175808439-a42b12bc-95ae-42b0-812f-bd514949145b.png) |

# Configure the sample code project
Before you run the sample code project in Xcode:

1. Download, install, and launch the latest version of Xcode 14.

2. In Safari, visit the Certificates, Identifiers, and Profiles section of the developer Apple website.

3. Select Identifiers and click the Add button to create a new App ID for the App. Follow the steps until you reach the Register an App ID page.

4. For the Bundle ID, select Explicit, and enter a unique bundle identifier. Use a reverse-DNS format for your identifier, as Preparing Your App for Distribution describes.

5. Click the App Services tab, and select the WeatherKit checkbox.

6. Complete the App ID creation process.

7. Wait 30 minutes while the service registers your app’s bundle ID.

8. In Xcode, from the Project navigator, select the FlightPlanner project and click the Signing & Capabilities tab.

9. Enter the unique bundle ID from step 4 in the Bundle Identifier field of the FlightPlanner target.

10. From the scheme pop-up menu, select a run destination.

11. If necessary, click Register Device on the Signing & Capabilities tab to create the provisioning profile.

12. On the toolbar, click Run, or choose Product > Run.

# Environment
* Xcode 14
* Swift 5.7

## TODO
* Add charts for daily forecast
