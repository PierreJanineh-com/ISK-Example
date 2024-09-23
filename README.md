# ISK Example
This repository contains an example app showcasing how to use the `InfinityScrollKit` **Swift package** for implementing infinite scrolling in SwiftUI.

## Overview
The example demonstrates how to set up and customize an infinite scrolling list with custom item views, progress indicators, and loading new data as the user scrolls.

## Features
- **Infinite Scrolling**: Automatically loads more data when scrolling reaches the end of the list.
- **Custom Cell Views**: Customize how each item in the list is displayed.
- **Loading Indicator**: A progress indicator (or custom last cell view) is shown while data is being loaded.
- **Empty State Handling**: Displays a custom view when the data array is empty.
- **Dynamic Data Loading**: New data is loaded from a simulated API.

## Setup
1. **Clone the Repository**:
    ```bash
    $ git clone https://github.com/PierreJanineh-com/ISK-Example.git
    $ cd ISK-Example
    ```
2. **Install the Dependencies**:
The `InfinityScrollKit` is integrated into the example project using **Swift Package Manager**. After opening the project in Xcode, the package will automatically be resolved.
Alternatively, you can run:
    ```bash
    $ swift package resolve
    ```
3. **Open in Xcode**:
Open the `.xcodeproj` file and run the app on your preferred simulator or device.

## Licence
This project is licensed under the **MIT License**. See the **LICENSE** file for more details.
