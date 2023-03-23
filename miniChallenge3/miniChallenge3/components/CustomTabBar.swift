//
//  CustomTabBar.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 21/03/23.
//
import SwiftUI

struct CustomTabBar: View {
    
    private let iconHome = "house"
    private let iconHistory = "heart"
    private let iconSetting = "message"
    
    let icons: [String]
    @State var tabPoint: [CGFloat] = []
    @Binding private var selectedTab: String
    
    init(selectedTab: Binding<String>) {
        UITabBar.appearance().isHidden = true
        self._selectedTab = selectedTab
        icons = [iconHome, iconHistory, iconSetting]
    }

    var body: some View {

        TabView(selection: $selectedTab){
            ConsultasView()
                .tag(iconHome)
            
            HistoricoView()
                .tag(iconHistory)
            
            InfoView()
                .tag(iconSetting)
            
        }
        
        HStack(spacing: 0) {
 
            ForEach(icons, id: \.self) { icon in
                ButtonTabBar(icon: icon, selectedTab: $selectedTab, tabPoint: $tabPoint)
            }
            
        }
        .background(Color.gray.clipShape(CustomShape(tabPoint: getCurvePoint())))
        
    }
    
    func getCurvePoint() -> CGFloat {
        if tabPoint.isEmpty{
            return 0
        } else {
            switch selectedTab{
            case iconHome:
                return tabPoint[0]
            case iconHistory:
                return tabPoint[1]
            case iconSetting:
                return tabPoint[2]
            default:
                return tabPoint[0]
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
            
            path.move(to: CGPoint(x: center - 40, y: 0))
            
//            let to1 = CGPoint(x: center - 40, y: 15)
//            let control1 = CGPoint(x: center - 40, y: 0)
//            let control2 = CGPoint(x: center - 40, y: 0)
//
//            let to2 = CGPoint(x: center, y: 0)
//            let control3 = CGPoint(x: center, y: 0)
//            let control4 = CGPoint(x: center, y: 0)

//            let to3 = CGPoint(x: center, y: 35)
//            let control5 = CGPoint(x: center - 35, y: 35)
//            let control6 = CGPoint(x: center, y: 35)
            let to3 = CGPoint(x: center + 40, y: 0)
            let control5 = CGPoint(x: center - 40, y: 50)
            let control6 = CGPoint(x: center + 40, y: 50)
            
            
//            let to3 = CGPoint(x: center + 40, y: 0)
//            let control5 = CGPoint(x: center - 40, y: 50)
//            let control6 = CGPoint(x: center + 40, y: 50)
//
//            path.addCurve(to: to1, control1: control1, control2: control2)
//            path.addCurve(to: to2, control1: control3, control2: control4)
            
            
            path.addCurve(to: to3, control1: control5, control2: control6)
            
            
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
