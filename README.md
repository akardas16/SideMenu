# SideMenu - SwiftUI 

## Install

### Swift Package Manager

Open `Xcode`, go to `File -> Swift Packages -> Add Package Dependency` and enter `https://github.com/akardas16/SideMenu.git`

You need to add `import SideMenu` 

## Usage
Without 3D effect<img src="https://user-images.githubusercontent.com/28716129/185779303-b833211b-07e0-4bc5-b01a-723352ccf49b.gif" width="20%" >
With 3D effect<img src="https://user-images.githubusercontent.com/28716129/185779405-1de7d9da-36fe-4aee-a3a5-13e67b9cf566.gif" width="20%" >

* initilize SideMenuView with available parameters


```Swift
SideMenuView(
    isMenuOpen: $isMenuOpen,
    tabs: tabs, // add your [MenuTabModel]
    selectedTab: $selectedTab, //initial selectedTab
    backColor: $backColor,     //acces view placeholder background
    backImage: "airplane",     //add your background image! Default value is airplane
    selectionColor: .purple,
    blurRadius: 32,            // add blur radius for image default value is 32
    enable3D: true //enable/disable 3D effect
) {
    if selectedTab.title == "Home" {
        TabOne(isMenuOpen: $isMenuOpen, backColor: $backColor)
    }else if selectedTab.title == "Profile" {
        TabTwo(isMenuOpen: $isMenuOpen, backColor: $backColor)
    }else if selectedTab.title == "Settings" {
        TabThree(isMenuOpen: $isMenuOpen, backColor: $backColor)
    }
}
```

* Example tabs array

```Swift
let tabs = [MenuTabModel(title: "Home", imageName: "house"),MenuTabModel(title: "Profile", imageName: "person"),MenuTabModel( title: "Settings", imageName: "gear")]
```

```Swift
@State var isMenuOpen:Bool = true
@State var selectedTab:MenuTabModel = MenuTabModel(title: "Home", imageName: "house")
@State var backColor = Color.pink
```
### Want to try library quickly?
* Paste HomeView.swift file to your project and see UI on preview
