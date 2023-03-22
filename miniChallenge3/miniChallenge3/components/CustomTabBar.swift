//
//  CustomTabBar.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 21/03/23.
//
import SwiftUI

struct CustomTabBar: View {
    let icons = ["house", "heart", "message","bookmark"]
    @State var tabPoint: [CGFloat] = []
    @Binding private var selectedTab: String
    
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(icons, id: \.self) { icon in
                ButtonTabBar(icon: icon, selectedTab: $selectedTab, tabPoint: $tabPoint)
            }

        }
        .background(Color.white.clipShape(CustomShape(tabPoint: getCurvePoint())))
        
    }
    
    func getCurvePoint() -> CGFloat {
        if tabPoint.isEmpty{
            return 3
        } else {
            switch selectedTab{
            case "house":
                return tabPoint[0]
            case "heart":
                return tabPoint[1]
            case "message":
                return tabPoint[2]
            default:
                return tabPoint[3]
            }
        }
    }
    
}

struct CustomShape: Shape{
    
    private var tabPoint: CGFloat
    
    var animatableData: CGFloat{
        get {return tabPoint}
        set {tabPoint = newValue}
    }
    
    init(tabPoint: CGFloat) {
        self.tabPoint = tabPoint
    }
    
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            
            path.move(to: CGPoint(x: 0, y: 0) )
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = tabPoint
            
            path.move(to: CGPoint(x: center - 50, y: 0))
            
            let to1 = CGPoint(x: center, y: 35)
            let control1 = CGPoint(x: center - 25, y: 0)
            let control2 = CGPoint(x: center - 25, y: 35)
            
            let to2 = CGPoint(x: center + 50, y: 0)
            let control3 = CGPoint(x: center + 25, y: 35)
            let control4 = CGPoint(x: center + 25, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
            
            
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
