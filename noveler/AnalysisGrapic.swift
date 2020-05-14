//
//  AnalysisGrapic.swift
//  noveler
//
//  Created by User06 on 2020/5/14.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI

struct AnalysisGrapic: View {
    
    @ObservedObject var novelsData = NovelsData()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AnalysisGrapic_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisGrapic()
    }
}
