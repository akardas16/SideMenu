# xArtistaxSideMenu - SwiftUI 

## Install

### Swift Package Manager

Open `Xcode`, go to `File -> Swift Packages -> Add Package Dependency` and enter `https://github.com/xartistax/xArtistaxSideMenu.git` as Branch `main`

You need to add `import xArtistaxSideMenu` 

## Usage


* initilize `SideMenuView` with available parameters


```Swift
    import SwiftUI
    import xArtistaxSideMenu

    @State private var isMenuOpen: Bool = true
    @State private var selectedTab: MenuTabModel?
    
    
    var tabs: [MenuTabModel] {
        return [
            MenuTabModel(title: "Edit Profile", subtitle: nil, imageName: "house", view: AnyView(TestViewProfile(isMenuOpen: $isMenuOpen))),
            MenuTabModel(title: "Application", subtitle: nil, imageName: "person", view: AnyView(TestViewProfile(isMenuOpen: $isMenuOpen))) ,
            MenuTabModel(title: "Logout", subtitle: nil, imageName: "lock", view: AnyView(TestViewProfile(isMenuOpen: $isMenuOpen)))
        ]
    }
    
    SideMenuView (
                isMenuOpen: $isMenuOpen,
                selectedTab: $selectedTab,
                selectedMenuView: .roundIcons,
                rootView: TestViewHome(isMenuOpen: $isMenuOpen),
                tabs: tabs
            )

```

### Want to try library quickly?
* Paste `Example.swift` file to your project and see UI on preview


### Credits to
[@akardas16] (https://www.github.com/akardas16)
