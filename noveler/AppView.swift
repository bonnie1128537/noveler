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
                Image(systemName: "rectangle.fill.on.rectangle.angled.fill")
                Text("列表")
            }
            AnalysisGrapic(novelsData: self.novelsData).tabItem {
                Image(systemName: "chart.bar.fill")
                Text("統計")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
