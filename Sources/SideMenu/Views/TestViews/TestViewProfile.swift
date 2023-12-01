//
//  TestViewOne.swift
//  SideMenu
//
//  Created by Demian Füglistaler on 30.11.2023.
//

import SwiftUI

@available(iOS 13.0, *)
struct TestViewProfile: View {
    
    @Binding var isMenuOpen: Bool
    
    var body: some View {
        VStack {
            ZStack {
                VStack(alignment: .leading) {
                    Button(action: { isMenuOpen.toggle() }) {
                        Image(systemName: "line.3.horizontal")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    .padding(.top, 12)
                    .padding(.leading, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                }
            }
            Spacer()
            VStack {
                Text("Edit Profile")
            }
            Spacer()
        }
    }
}



@available(iOS 14.0, *)
struct TestViewOne_Previews: PreviewProvider {
    static var previews: some View {
        TestViewProfile(isMenuOpen: .constant(false))
    }
}
