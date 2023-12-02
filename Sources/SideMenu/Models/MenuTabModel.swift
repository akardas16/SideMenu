//
//  File.swift
//  
//
//  Created by Demian Füglistaler on 30.11.2023.
//


import SwiftUI
import Combine

@available(iOS 13.0, *)


public protocol TabItemView: View {
    // Define any required properties or methods
}

@available(iOS 13.0, *)
public class MenuTabModel: ObservableObject, Identifiable, Equatable {
    
    public static func == (lhs: MenuTabModel, rhs: MenuTabModel) -> Bool {
            return lhs.id == rhs.id // Compare using the ID or any other property that uniquely identifies a MenuTabModel
        }
    
    
    
    public var id: UUID = UUID()

    // Use @Published to automatically publish changes to selectedTab
    @Published public var selectedTab: MenuTabModel? {
        didSet {
            objectWillChange.send() // Manually trigger objectWillChange
        }
    }
    
    public var title: String
    public var subtitle: String?
    public var imageName: String
    public var view: any TabItemView
   

    public init(
        id: UUID = UUID(),
        title: String,
        subtitle: String?,
        imageName: String,
        view: any TabItemView
        
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.view = view
        
    }
}
