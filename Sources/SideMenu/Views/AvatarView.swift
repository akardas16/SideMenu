//
//  SwiftUIView.swift
//  
//
//  Created by Demian Füglistaler on 29.11.2023.
//

import SwiftUI

public struct AvatarView: View {
    
    public var imageName: String
    public var size: CGFloat
    public var stroke: CGFloat
    public var shadowRadius : CGFloat
    public var username : String?
    public var email : String?
    
    
    public init(imageName: String, size: CGFloat, stroke: CGFloat, shadowRadius: CGFloat, username: String?, email: String?) {
        self.imageName = imageName
        self.size = size
        self.stroke = stroke
        self.shadowRadius = shadowRadius
        self.username = username
        self.email = email
    }
    
    
    
    @available(iOS 13.0, *)
    public var body: some View {
        
        
        VStack (alignment:.leading) {
            
            
            
            VStack (alignment:.leading){
                HStack {
                    
                    Image(uiImage: UIImage(named: imageName, in: .module, with: nil)!).resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size, height: size) // Adjust image size
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: stroke)) // Add border if desired
                        .shadow(radius: shadowRadius ) // Add shadow if desired
                    
                    Spacer()
                    
                }
                
                
                if let unwrappedUsername = username, let unwrappedEmail = email {
                    VStack (alignment:.leading) {
                        Text(unwrappedUsername)
                            .font(.largeTitle)
                        Text(unwrappedEmail)
                    }
                    .padding(.top,16)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 9, x: 6, y: 6)
                }
                
            }
        }
        
        
    }
}


