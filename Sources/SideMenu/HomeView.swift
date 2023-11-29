//
//  HomeView.swift
//  Created by Abdullah Kardas on 20.08.2022.
//

import SwiftUI
import SideMenu

struct HomeView: View {
    @State var isMenuOpen:Bool = true
    let tabs = [MenuTabModel(title: "Home", imageName: "house"),MenuTabModel(title: "Profile", imageName: "person"),MenuTabModel( title: "Settings", imageName: "gear")]

    @State var selectedTab:MenuTabModel = MenuTabModel(title: "Home", imageName: "house")
    @State var backColor = Color.white
    
    
    var body: some View {
        ZStack {
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
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TabOne: View {
    @Binding var isMenuOpen:Bool
    @Binding var backColor:Color
    var body: some View {
        ZStack {//Your content is here
            backColor.ignoresSafeArea().cornerRadius(isMenuOpen ? 12:0)
            VStack(alignment:.leading) {
                Button(action: { isMenuOpen.toggle() }) {
                    Image(systemName: "line.3.horizontal").font(.title).foregroundColor(.white)
                    
                }.padding(.top, 12).padding(.leading, 12).frame(maxWidth: .infinity,alignment: .leading)
                Spacer()
            }
            Spacer()
            Text("Tab 1").foregroundColor(.white).font(.title2).onTapGesture {
                print("something")
            }
        }.onAppear{
            backColor = .pink
        }
    }
}
struct TabTwo: View {
    @Binding var isMenuOpen:Bool
    @Binding var backColor:Color
    var body: some View {
        ZStack {//Your content is here
            backColor.ignoresSafeArea().cornerRadius(isMenuOpen ? 12:0)
            VStack(alignment:.leading) {
                Button(action: { isMenuOpen.toggle() }) {
                    Image(systemName: "line.3.horizontal").font(.title).foregroundColor(.white)
                    
                }.padding(.top, 12).padding(.leading, 12).frame(maxWidth: .infinity,alignment: .leading)
                Spacer()
            }
            Spacer()
            Text("Tab 2").foregroundColor(.white).font(.title2).onTapGesture {
                print("something")
            }
        }.onAppear {
            backColor = .green
        }
    }
}
struct TabThree: View {
    @Binding var isMenuOpen:Bool
    @Binding var backColor:Color
    var body: some View {
        ZStack {//Your content is here
            backColor.ignoresSafeArea().cornerRadius(isMenuOpen ? 12:0)
            VStack(alignment:.leading) {
                Button(action: { isMenuOpen.toggle() }) {
                    Image(systemName: "line.3.horizontal").font(.title).foregroundColor(.white)
                    
                }.padding(.top, 12).padding(.leading, 12).frame(maxWidth: .infinity,alignment: .leading)
                Spacer()
            }
            Spacer()
            Text("Tab 3").foregroundColor(.white).font(.title2).onTapGesture {
                print("something")
            }
        }.onAppear {
            backColor = .purple
        }
    }
}
