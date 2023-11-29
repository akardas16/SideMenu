import SwiftUI



public enum MenuViewType {
    case capsule
    case roundIcons
}

public struct AvatarView: View {
    
    let imageName: String
    let size: CGFloat
    let stroke: CGFloat
    let shadowRadius : CGFloat
    let username : String?
    let email : String?
    
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


@available(iOS 14.0, *)
public struct SideMenuView<Content:View>: View {
    public var offset:CGFloat
    public var isIndividualLinkColor : Bool
    @Binding private var isMenuOpen: Bool
    public var tabs:[MenuTabModel]
    @Binding var selectedTab:MenuTabModel
    @Binding var backColor:Color
    public var backImage:String
    public var avatar: AvatarView?
    public var overlay : CGFloat
    public var selectionColor:Color = Color.blue
    public var blurRadius:CGFloat
    public var enable3D:Bool = true
    public var selectedMenuView: MenuViewType 
    public let content:Content
    
    
    
    
    
    
    
    
    
    public init(
        offset:CGFloat ,
        isIndividualLinkColor : Bool,
        isMenuOpen: Binding<Bool>,
        tabs: [MenuTabModel],
        selectedTab: Binding<MenuTabModel>,
        backColor: Binding<Color>,
        backImage: String,
        avatar: AvatarView?,
        overlay : CGFloat,
        selectionColor: Color = Color.blue,
        blurRadius: CGFloat ,
        enable3D: Bool = true,
        selectedMenuView: MenuViewType,
        @ViewBuilder content: () -> Content
        
    ) {
        self.offset = offset
        self.isIndividualLinkColor = isIndividualLinkColor
        self.tabs = tabs
        self.blurRadius = blurRadius
        self.enable3D = enable3D
        self.selectedMenuView = selectedMenuView
        self.selectionColor = selectionColor
        self.blurRadius = blurRadius
        self.avatar = avatar
        self.overlay = overlay
        self.backImage = backImage // Fixed assigning value to backImage parameter
        _isMenuOpen = isMenuOpen
        _selectedTab = selectedTab
        self.content = content()
        _backColor = backColor
 
    }

   
    public var body: some View {

        ZStack {
            menuBackgroundView
            ZStack {
                RoundedRectangle(cornerRadius: isMenuOpen ? 12 : 0)
                    .foregroundColor(backColor)
                    .shadow(color: .black.opacity(0.6), radius: isMenuOpen ? 14 : 0)
  
                 content
                .disabled(isMenuOpen)
                .padding(.top,isMenuOpen ? 0: window()?.safeAreaInsets.top)
                .padding(.bottom,isMenuOpen ? 0: window()?.safeAreaInsets.bottom)
            }
            .offset(x: isMenuOpen ? (window()?.bounds.width ?? UIScreen.main.bounds.width) * offset : 0)
            .scaleEffect(isMenuOpen ? 0.8 : 1)
            .rotation3DEffect(.degrees(isMenuOpen && enable3D ? -32:0), axis: (x: 0, y: 1, z: 0))
            .animation(.linear(duration: 0.24), value: isMenuOpen)
            .ignoresSafeArea(edges: isMenuOpen ? []:[.all])
            .onTapGesture {
                if isMenuOpen {
                    isMenuOpen.toggle()
                }
            }
         
        }
    } 
  
  
    public var menuBackgroundView:some View {
        
        ZStack(alignment:.init(horizontal: .leading, vertical: .center)){
  
            
            Color.pink.ignoresSafeArea().overlay(
                
                backImage.isEmpty ? nil :
                                Image(uiImage: UIImage(named: backImage, in: .module, with: nil) ?? UIImage())
                                    .scaledToFill()
                                    .ignoresSafeArea()
                                    .blur(radius: blurRadius)
                
            )
            
            Color.black.opacity(overlay).ignoresSafeArea()
            
            
            
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
                    case .capsule:
                        HStack {
                            Image(systemName: tab.imageName)
                            Text(tab.title)
                        }.font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal,4)
                            .background(
                                selectedTab.title == tab.title ? Capsule(style: .circular).fill(selectionColor) : Capsule(style: .circular).fill(Color.clear)
                                
                            ).onTapGesture {
                                selectedTab = tab
                                closeMenuWithDly()
                            }
                            .animation(.linear(duration: 0.24), value: selectedTab)
                    case .roundIcons:
                        HStack {
                            Image(systemName: tab.imageName)
                            
                                .frame(maxWidth: 48, minHeight: 48)
                                .background(isIndividualLinkColor ? tab.individuaLinkColor : backColor)
                                .foregroundColor(.white)
                                .cornerRadius(99)
                            
                            Text(tab.title)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .padding(.horizontal,4)
                        }
                        .padding(.vertical)
                        .onTapGesture {
                            selectedTab = tab
                            closeMenuWithDly()
                        }
                    }
                }
                Spacer()
                
           
                
                
            }.padding(.leading,50)
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
public struct MenuTabModel:Identifiable,Equatable {
   
    public var id: UUID = UUID()
    public var title:String
    public var imageName:String
    public var individuaLinkColor:Color?
    
    public init(id: UUID = UUID(), title: String, imageName: String, individuaLinkColor:Color) {
        self.id = id
        self.title = title
        self.imageName = imageName
        self.individuaLinkColor = individuaLinkColor

    }
}


@available(iOS 14.0, *)
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
