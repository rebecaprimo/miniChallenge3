//
//  ButtonTabBar.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 21/03/23.
//

import SwiftUI

struct ButtonTabBar: View {
    
    private var icon: String
    @Binding private var selectedTab: String 
    @Binding private var tabPoint: [CGFloat]
    @Namespace var animation
    
    init(icon: String, selectedTab: Binding<String>, tabPoint: Binding<[CGFloat]>) {
        self.icon = icon
        self._selectedTab = selectedTab
        self._tabPoint = tabPoint
    }
    
    var body: some View{
        
        //Implementar a tabView
        
        
        GeometryReader { reader -> AnyView in
            
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                if tabPoint.count <= 4{
                    tabPoint.append(midX)
                }
            }
            
            return AnyView (
                Button(action: {withAnimation{selectedTab = icon}}) {
                    Image(systemName: icon)
                        .frame(width: 40, height: 40)
                        .background(Color.white.opacity(selectedTab == icon ? 1 : 0))
                        .clipShape(Circle())
                        .matchedGeometryEffect(id: icon, in: animation)
                        .font(.system(size: 25))
                        .offset(y: selectedTab == icon ? -40 : 0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
        .frame(height: 40)
        .padding()
        
        
    }
}

struct ButtonTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
