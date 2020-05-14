//
//  AppView.swift
//  noveler
//
//  Created by User06 on 2020/5/14.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var novelsData = NovelsData()
    var body: some View {
        TabView{
            NovelList(novelsData: self.novelsData).tabItem {
                Image(systemName: "text.aligncenter")
                Text("列表")
            }
            AnalysisGrapic(novelsData: self.novelsData).tabItem {
                Image(systemName: "rectangle.expand.vertical")
                Text("分析")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
