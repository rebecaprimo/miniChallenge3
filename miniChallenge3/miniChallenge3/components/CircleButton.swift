//
//  ButtonTabBar.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 21/03/23.
//

import SwiftUI

struct CircleButton: View {
    
    private var icon: String
    @Binding private var selectedTab: String 
    @Binding private var tabPoint: [CGFloat]
    @Namespace var animation
    
    init(icon: String, selectedTab: Binding<String>, tabPoint: Binding<[CGFloat]>) {
        self.icon = icon
        self._selectedTab = selectedTab
        self._tabPoint = tabPoint
    }
    
    var body: some View {
        
        //Implementar a tabView
        
        
        GeometryReader { reader -> AnyView in
            
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                if tabPoint.count <= 4{
                    tabPoint.append(midX)
                }
            }
            
            return AnyView (
                Button(action: {withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.5)) {
                    withAnimation{selectedTab = icon}
                }}) {
                    Image(systemName: icon)
                        .foregroundColor(DataColor.colorTextWhite)
                        .frame(width: 60, height: 60)
                        .background(DataColor.colorButton.opacity(selectedTab == icon ? 1 : 0))
                        .clipShape(Circle())
                        .offset(y: selectedTab == icon ? -50 : 0)
                        .matchedGeometryEffect(id: icon, in: animation)
                        .font(.system(size: 25))
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
