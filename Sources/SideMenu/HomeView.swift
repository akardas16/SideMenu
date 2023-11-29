//
//  HomeView.swift
//  Created by Abdullah Kardas on 20.08.2022.
//

import SwiftUI
import SideMenu

@available(iOS 14.0, *)
struct HomeView: View {
    @State private var isMenuOpen: Bool = true
    @State private var selectedTab: MenuTabModel = MenuTabModel(title: "Home", imageName: "house", individuaLinkColor: .red)
    @State private var backColor = Color.white
    

     
    
    
    @available(iOS 14.0, *)
    var body: some View {
        
        let tabs = [
            MenuTabModel(title: "Home", imageName: "house", individuaLinkColor: .orange),
            MenuTabModel(title: "Profile", imageName: "person", individuaLinkColor: .blue),
            MenuTabModel(title: "Settings", imageName: "gear", individuaLinkColor: .pink),
            MenuTabModel(title: "Logout", imageName: "lock", individuaLinkColor: .pink)
        ]
        
        ZStack {
           
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
                )  
            }
        }
    }


@available(iOS 14.0, *)
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

@available(iOS 14.0, *)
struct TabView: View {
    @Binding var isMenuOpen: Bool
    @Binding var backColor: Color
    var text: String
    var bgColor: Color
    
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Button(action: { isMenuOpen.toggle() }) {
                    Image(systemName: "line.3.horizontal")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding(.top, 12)
                .padding(.leading, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            
            Spacer()
            
            Text(text)
                .foregroundColor(.white)
                .font(.title)
                .onTapGesture {
                    print("something")
                }
        }
        .onAppear {
            backColor = bgColor
        }
    }
}
