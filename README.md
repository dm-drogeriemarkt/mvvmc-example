# MVVMC-Example

[<img src="https://opensourcelogos.aws.dmtech.cloud/dmTECH_opensource_logo.svg" height="20" width="130">](https://dmtech.de/)

> This project is an example that shows how MVVM-C can be used to structure iOS apps that consist of multiple views.

For more information about the MVVM-C pattern, please watch the excellent talk ["MVVM-C In Practice" by Steve Scott](https://www.youtube.com/watch?v=9VojuJpUuE8).

![Example app](Screenshot.png)

This example project uses plain Swift to create an app with a tab bar and some transitions. It shows how the different views of an app can be separated into modules, how to wire up the transitions and how to pass data between the views.

## How to build

### Requirements
* Xcode 10
* Swift 4

Open the project file `HelloMVVMC.xcodeproj` with Xcode and hit CMD + R to run the example. No third party dependencies required.

## App Structure
The app consists of an UITabBarController with two tabs, each one containing a transition to another view.

![App structure](Structure.png)

The blue view contains a button that will show the yellow view modally. The green view pushes the red view onto the navigation stack and demonstrates how you can pass paratemers from one view to another.