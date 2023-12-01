//
//  SideMenuView.swift
//
//
//  Created by Demian Füglistaler on 30.11.2023.
//


import SwiftUI








@available(iOS 14.0, *)
public struct SideMenuView <RootView: View>: View  {
    
    @Binding private var isMenuOpen: Bool
    @Binding var selectedTab: MenuTabModel?
    @State private var selectedView: AnyView?
    @State private var currentSelectedTab: MenuTabModel?

    
    public var offset:CGFloat
    public var menuOverlayOpacity : CGFloat
    public var blurRadius:CGFloat
    public var enable3D:Bool
    public var backImage:String
    public var iconColor: Color
    public var iconBg: Color
    public var bgColor: Color
    public var selectionColor:Color
    public var menuOverlayColor : Color
    public var avatar: AvatarView?
    public var selectedMenuView: MenuViewType
    public var rootView: RootView
    public var tabs:[MenuTabModel]

    


    
    public init(
        
        isMenuOpen: Binding<Bool>,
        selectedTab: Binding<MenuTabModel?>,
        offset: CGFloat = 0.95,
        menuOverlayOpacity : CGFloat =  0.75,
        blurRadius:CGFloat = 12,
        enable3D:Bool = false,
        backImage:String = "menuBG",
        iconColor: Color = .white,
        iconBg: Color = .gray.opacity(0.5),
        bgColor: Color = .white,
        selectionColor:Color = .gray,
        menuOverlayColor : Color = .black,
        avatar:AvatarView? = nil,
        selectedMenuView: MenuViewType,
        rootView: RootView,
        tabs:[MenuTabModel]
    ) {
        _isMenuOpen = isMenuOpen
        _selectedTab = selectedTab
        _selectedView = State(initialValue: nil)
        
        self.offset = offset
        self.menuOverlayOpacity = menuOverlayOpacity
        self.blurRadius = blurRadius
        self.enable3D = enable3D
        self.backImage = backImage
        self.iconColor = iconColor
        self.bgColor = bgColor
        self.iconBg = iconBg
        self.selectionColor = selectionColor
        self.menuOverlayColor = menuOverlayColor
        self.selectedMenuView = selectedMenuView
        self.rootView = rootView
        self.tabs = tabs
        self.avatar = avatar
    }

   
    public var body: some View {

        ZStack {
            MenuBackgroundView(
                
                isMenuOpen: $isMenuOpen,
                selectedTab: $selectedTab,
                selectionColor : selectionColor,
                backImage: backImage,
                iconColor:iconColor,
                iconBg:iconBg,
                blurRadius: blurRadius,
                avatar:avatar,
                tabs: tabs,
                selectedMenuView: selectedMenuView,
                menuOverlay: menuOverlayOpacity,
                menuOverlayColor : menuOverlayColor
            )
            
            ZStack {
                RoundedRectangle(cornerRadius: isMenuOpen ? 24 : 0)
                    .foregroundColor(bgColor)
                    .shadow(color: .black.opacity(0.6), radius: isMenuOpen ? 14 : 0)
                
                
                selectedView
                    .padding(24)
                
                
                
                
            }
            
            .offset(x: isMenuOpen ? (window()?.bounds.width ??  UIScreen.main.bounds.width) * offset : 0)
            .scaleEffect(isMenuOpen ? 0.8 : 1)
            .rotation3DEffect(.degrees(isMenuOpen && enable3D ? -32:0), axis: (x: 0, y: 1, z: 0))
            .animation(.linear(duration: 0.24), value: isMenuOpen)
            .ignoresSafeArea(edges: isMenuOpen ? []:[.all])
            .onAppear { selectedView = AnyView(rootView) }
            
            .gesture(
                TapGesture().onEnded {
                    isMenuOpen = false
                }
            )
            
            .onReceive(selectedTab.publisher) { newTab in
                            if currentSelectedTab != newTab {
                                currentSelectedTab = newTab
                                updateSelectedView(newTab)
                            }
                        }
            
         
        }
        
        
        
    }
    
  
  
    private func updateSelectedView(_ tab: MenuTabModel?) {
                if let tab = tab {
                    selectedView = AnyView(tab.view)
                    
                } else {
                    selectedView = nil
                }
            }
    
    
    func closeMenuWithDly(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            isMenuOpen.toggle()
        })
    }
    func window() -> UIWindow?{
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
              let window = windowSceneDelegate.window else {
            return nil
        }
        return window
    }
}




@available(iOS 14.0, *)
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}

