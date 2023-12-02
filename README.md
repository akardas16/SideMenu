# iOS SwiftUI SideMenu 📱

[![Swift Version](https://img.shields.io/badge/swift-5.0-orange.svg)](https://swift.org/)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Preview 🖼️

![Preview Image 1](https://github.com/xartistax/xArtistaxSideMenu/assets/119945844/025ee141-80cc-4cbf-ae14-097690635189)
![Preview Image 2](https://github.com/xartistax/xArtistaxSideMenu/assets/119945844/743e8cfc-af48-49ed-9c62-ccf52693d176)


iosSwiftUISideMenu is an intuitive SwiftUI package designed to streamline navigation and enhance user experience within your iOS applications. 📱✨


## Features 🌟

- **Effortless Navigation:** Seamlessly navigate through different views and sections with a user-friendly side menu.
- **Customizable Interface:** Tailor the menu appearance, animations, and functionalities to match your app's aesthetics and requirements.
- **SwiftUI Integration:** Leverage the power of SwiftUI for a smooth and native integration within your iOS app.



## Installation 🛠️

### Swift Package Manager

1. Open `Xcode`.
2. Go to `File -> Swift Packages -> Add Package Dependency`.
3. Enter `https://github.com/xartistax/iosSwiftUISideMenu.git` as Branch `main`.
4. Import the package using `import iosSwiftUISideMenu`.

## Usage 🚀

Initialize `SideMenuView` with the available parameters:


```Swift

    struct ContentView: View, TabItemView {
    
    @State private var isMenuOpen: Bool = true
    @State private var selectedTab: MenuTabModel?
    
    var tabs: [MenuTabModel] {
    return [
        
        MenuTabModel(
            title: "SubView",
            subtitle: nil,
            imageName: "lock",
            view: SubView(isMenuOpen: $isMenuOpen))
        
    ]
    
}
    
    var body: some View {
       
            
        SideMenuView (
            isMenuOpen: $isMenuOpen,
            selectedTab: $selectedTab,
            selectedMenuView: .roundIcons,
            rootView: RootView(isMenuOpen: $isMenuOpen),
            tabs: tabs
        )
    }
}

```

## Available Parameters

```Swift
SideMenuView (
    isMenuOpen: <#T##Binding<Bool>#>,
    selectedTab: <#T##Binding<MenuTabModel?>#>,
    offset: <#T##CGFloat#>,
    menuOverlayOpacity: <#T##CGFloat#>,
    blurRadius: <#T##CGFloat#>,
    enable3D: <#T##Bool#>,
    backImage: <#T##String#>,
    iconColor: <#T##Color#>,
    iconBg: <#T##Color#>,
    bgColor: <#T##Color#>,
    selectionColor: <#T##Color#>,
    menuOverlayColor: <#T##Color#>,
    avatar: <#T##AvatarView?#>,
    selectedMenuView: <#T##MenuViewType#>,
    rootView: <#T##RootView#>,
    tabs: <#T##[MenuTabModel]#>
        )
         
```

## SubViews

```Swift
struct SubView: View , TabItemView {
    
    @Binding var isMenuOpen: Bool
    
    var body: some View {
        VStack {
            Text("SubView")
            Button(action: {
                isMenuOpen.toggle()
            }, label: {
                Text("Close Button")
            })
        }
    }
}
```


