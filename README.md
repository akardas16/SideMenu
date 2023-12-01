# xArtistaxSideMenu - SwiftUI 

## Preview

<img src="https://github.com/xartistax/xArtistaxSideMenu/assets/119945844/025ee141-80cc-4cbf-ae14-097690635189" width="25%" >
<img src="https://github.com/xartistax/xArtistaxSideMenu/assets/119945844/743e8cfc-af48-49ed-9c62-ccf52693d176" width="25%" >



## Install

### Swift Package Manager

Open `Xcode`, go to `File -> Swift Packages -> Add Package Dependency` and enter `https://github.com/xartistax/xArtistaxSideMenu.git` as Branch `main`

You need to add `import xArtistaxSideMenu` 

## Usage


* initilize `SideMenuView` with available parameters


```Swift

    struct ContentView: View, TabItemView {
    
    @State private var isMenuOpen: Bool = true
    @State private var selectedTab: MenuTabModel?
    
    var tabs: [MenuTabModel] {
    return [
        
        MenuTabModel(
            title: "Logout",
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

### Credits to 

[@akardas16] (https://www.github.com/akardas16)
