//
//  ButtonTabBar.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 21/03/23.
//


import SwiftUI

struct CircleButton: View {
    
    private var style = DataColor.shared
    private var icon: String
    private var action: () -> Void
    private var buttonTabBar: Bool
    @Binding private var selectedTab: String
    @Binding private var tabPoint: [CGFloat]?
    @Namespace var animation
    
    init(_ icon: String,buttonTabBar: Bool,_ selectedTab: Binding<String>?,_ tabPoint: Binding<[CGFloat]?>?, action: @escaping () -> Void) {
        self.icon = icon
        self.buttonTabBar = buttonTabBar
        self._selectedTab = selectedTab ?? Binding.constant("")
        self._tabPoint = tabPoint ?? Binding.constant(nil)
        self.action = action
    }
    
    var body: some View {
        GeometryReader { reader -> AnyView in
            if buttonTabBar{
                let midX = reader.frame(in: .global).midX
                DispatchQueue.main.async {
                    if tabPoint!.count <= 4{
                        tabPoint!.append(midX)
                    }
                }
                return AnyView(
                    Button(action: (action), label: {
                        Image(systemName: icon)
                            .foregroundColor((selectedTab == icon ? style.colorIconActive :style.colorIconInative))
                            .frame(width: 60, height: 60)
                            .background(style.componentsColor.opacity(selectedTab == icon ? 1 : 0))
                            .clipShape(Circle())
                            .offset(y: selectedTab == icon ? -50 : 0)
                            .matchedGeometryEffect(id: icon, in: animation)
                            .font(.system(size: 25))
                    })
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                )
            } else {
                
                return AnyView(
                    
                    Button(action: (action)) {
                        Image(systemName: icon)
                            .foregroundColor(style.colorIconActive)
                            .frame(width: 60, height: 60)
                            .background(style.componentsColor)
                            .clipShape(Circle())
                            .border(.white)
                            .font(.system(size: 25))
                    })
            }
        }
        .frame(height: 60)
        .padding()
    }
}
