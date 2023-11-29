# SideMenu - SwiftUI 

## Install

### Swift Package Manager

Open `Xcode`, go to `File -> Swift Packages -> Add Package Dependency` and enter `https://github.com/xartistax/SideMenu.git` as Branch `main`

You need to add `import SideMenu` 

## Usage
Without 3D effect<img src="https://user-images.githubusercontent.com/28716129/185779303-b833211b-07e0-4bc5-b01a-723352ccf49b.gif" width="25%" >
With 3D effect<img src="https://user-images.githubusercontent.com/28716129/185779405-1de7d9da-36fe-4aee-a3a5-13e67b9cf566.gif" width="25%" >

* initilize `SideMenuView` with available parameters


```Swift


    @State private var isMenuOpen: Bool = true
    @State private var selectedTab: MenuTabModel = MenuTabModel(title: "Home", imageName: "house", individuaLinkColor: .red)
    @State private var backColor = Color.white
    
    
    let tabs = [
            MenuTabModel(title: "Home", imageName: "house", individuaLinkColor: .orange),
            MenuTabModel(title: "Profile", imageName: "person", individuaLinkColor: .blue),
            MenuTabModel(title: "Settings", imageName: "gear", individuaLinkColor: .pink),
            MenuTabModel(title: "Logout", imageName: "lock", individuaLinkColor: .pink)
        ]


                SideMenuView( 
                    offset: 0.95, 
                    isIndividualLinkColor: false,
                    isMenuOpen: $isMenuOpen,
                    tabs: tabs,
                    selectedTab: $selectedTab, 
                    backColor: $backColor,
                    backImage: "menuBG",
                    avatar: 
                        
                        AvatarView(
                            imageName: "Avatar",
                            size: 120,
                            stroke: 0,
                            shadowRadius: 16,
                            username: "Philipp Smith",
                            email: "p.smith@gmail.com"
                        ),
                    overlay: 0.5,
                    
                    selectionColor: .purple,
                    blurRadius: 24,
                    enable3D: false,
                    selectedMenuView: .roundIcons,
                    content:
                        {
                            switch selectedTab.title {
                            case "Home":
                                TabView(
                                    isMenuOpen:
                                        $isMenuOpen,
                                    backColor: $backColor,
                                   
                                    text: "Tab 1",
                                    bgColor: .pink)
                            case "Profile":
                                TabView(
                                    isMenuOpen: $isMenuOpen, 
                                    backColor: $backColor,
                                    
                                    text: "Tab 2",
                                    bgColor: .green)
                            case "Settings":
                                TabView(
                                    isMenuOpen: $isMenuOpen,
                                    backColor: $backColor,
                                   
                                    text: "Tab 3",
                                    bgColor: .purple)
                            default:
                                EmptyView()
                            }
                        }
                



```

* Example tabs array

```Swift
    let tabs = [
            MenuTabModel(title: "Home", imageName: "house", individuaLinkColor: .orange),
            MenuTabModel(title: "Profile", imageName: "person", individuaLinkColor: .blue),
            MenuTabModel(title: "Settings", imageName: "gear", individuaLinkColor: .pink),
            MenuTabModel(title: "Logout", imageName: "lock", individuaLinkColor: .pink)
        ]
```

```Swift
    @State private var isMenuOpen: Bool = true
    @State private var selectedTab: MenuTabModel = MenuTabModel(title: "Home", imageName: "house", individuaLinkColor: .red)
    @State private var backColor = Color.white
```
### Want to try library quickly?
* Paste `HomeView.swift` file to your project and see UI on preview


### Credits to
[@akardas16] (https://www.github.com/akardas16)
