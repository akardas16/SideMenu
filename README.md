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
            
            MenuTabModel(
                title: "Edit Profile",
                subtitle: nil,
                imageName: "house",
                view: TestViewProfile(isMenuOpen: $isMenuOpen)),
            
            MenuTabModel(
                title: "Application",
                subtitle: nil,
                imageName: "person",
                view: TestViewApplications(isMenuOpen: $isMenuOpen) ) ,
            
            MenuTabModel(
                title: "Logout",
                subtitle: nil,
                imageName: "lock",
                view: TestViewLogout(isMenuOpen: $isMenuOpen))
            
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



### Credits to
[@akardas16] (https://www.github.com/akardas16)
