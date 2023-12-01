//
//  HomeView.swift
//  Created by Abdullah Kardas on 20.08.2022.
//

import SwiftUI
import xArtistaxSideMenu
  
@available(iOS 14.0, *)
struct ExampleView: View {
    
    @State private var isMenuOpen: Bool = true
    @State private var selectedTab: MenuTabModel?
    
    
    var tabs: [MenuTabModel] {
        return [
            MenuTabModel(title: "Edit Profile", subtitle: nil, imageName: "house", view: AnyView(TestViewProfile(isMenuOpen: $isMenuOpen))),
            MenuTabModel(title: "Application", subtitle: nil, imageName: "person", view: AnyView(TestViewProfile(isMenuOpen: $isMenuOpen))) ,
            MenuTabModel(title: "Logout", subtitle: nil, imageName: "lock", view: AnyView(TestViewProfile(isMenuOpen: $isMenuOpen)))
        ]
    }
    
    
    @available(iOS 14.0, *)
    var body: some View {
        
        
        
        ZStack {
           
            
              
            SideMenuView (
                isMenuOpen: $isMenuOpen,
                selectedTab: $selectedTab,
                selectedMenuView: .roundIcons,
                rootView: TestViewHome(isMenuOpen: $isMenuOpen),
                tabs: tabs
            )
            }
        }
    } 


@available(iOS 14.0, *)
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}

