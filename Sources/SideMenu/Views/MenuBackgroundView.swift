//
//  MenuBackgroundView.swift
//
//
//  Created by Demian Füglistaler on 30.11.2023.
//

import SwiftUI

@available(iOS 14.0, *)
struct MenuBackgroundView: View {
    

    
    @Binding var isMenuOpen: Bool
    @Binding var selectedTab: MenuTabModel?
    public var selectionColor : Color
    public var backImage:String
    
    public var iconColor: Color
    public var iconBg: Color
    
    public var blurRadius:CGFloat
    public var avatar: AvatarView?
    public var tabs: [MenuTabModel]
    public var selectedMenuView: MenuViewType
    public var menuOverlay : CGFloat
    public var menuOverlayColor : Color
    
    
    
    public init(
  
        
        isMenuOpen: Binding<Bool>,
        selectedTab: Binding<MenuTabModel?>,
        selectionColor : Color,
        backImage:String,
        iconColor: Color,
        iconBg: Color,
        blurRadius:CGFloat,
        avatar: AvatarView?,
        tabs: [MenuTabModel],
        selectedMenuView: MenuViewType,
        menuOverlay : CGFloat,
        menuOverlayColor : Color
        
        
    ) {
        _isMenuOpen = isMenuOpen
        _selectedTab = selectedTab
        self.selectionColor = selectionColor
        self.backImage = backImage
        
        self.iconColor = iconColor
        self.iconBg = iconBg
        
        self.blurRadius = blurRadius
        self.avatar = avatar
        self.tabs = tabs
        self.selectedMenuView = selectedMenuView
        self.menuOverlay = menuOverlay
        self.menuOverlayColor = menuOverlayColor
        
 
    }
    
    
    
    
    func closeMenuWithDly(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            _isMenuOpen.wrappedValue.toggle()
        })
    }
    
    
    @available(iOS 14.0, *)
    var body: some View {
        
        ZStack(alignment:.init(horizontal: .leading, vertical: .center)){
  
            
            Color.pink.ignoresSafeArea().overlay(
                
                backImage.isEmpty ? nil :
                                Image(uiImage: UIImage(named: backImage, in: .module, with: nil) ?? UIImage())
                                    .scaledToFill()
                                    .ignoresSafeArea()
                                    .blur(radius: blurRadius)
                
            )
            
            menuOverlayColor.opacity(menuOverlay).ignoresSafeArea()
            
            
            
            VStack(alignment:.leading) {
                
                Spacer()
                
                
                
                    
                if let unwrappedAvatar = avatar {
                    VStack (alignment: .leading) {
                        AvatarView(
                            imageName: unwrappedAvatar.imageName ,
                            size: unwrappedAvatar.size,
                            stroke: unwrappedAvatar.stroke,
                            shadowRadius: unwrappedAvatar.shadowRadius,
                            username: unwrappedAvatar.username,
                            email: unwrappedAvatar.email
                        )
                        .frame(maxWidth: .infinity) // This will allow the AvatarView to expand
                        
                        .multilineTextAlignment(.leading)
                        
                    }
                    .padding(.bottom,48)
                }
                    
                
                

                
                ForEach(tabs) { tab in
                    
                    
                    switch selectedMenuView {
          
                    case .roundIcons:
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: tab.imageName)
                                    .frame(maxWidth: 48, minHeight: 48)
                                    .background(
                                        selectedTab?.title == tab.title ? selectionColor : iconBg
                                    )
                                    .foregroundColor(iconColor)
                                    .cornerRadius(99)

                                VStack(alignment: .leading) {
                                    Text(tab.title)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(tab.subtitle ?? "")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding(.trailing, 70)
                                      
                                        
                                        
                                }
                                .padding(.leading, 8)
                            }
                            .padding(.vertical) 
                            .gesture(
                                TapGesture().onEnded {
                                    
                                        isMenuOpen.toggle()
                                    selectedTab = tab
                                        print("Taped Link")
                                    
                                    
                                }
                                
                            )
                            
                        }

                    }
                }
                Spacer()
                
           
                
                
            }.padding(.leading,50)
        }
        
    }
}


