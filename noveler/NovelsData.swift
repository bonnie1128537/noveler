//
//  NovelsData.swift
//  noveler
//
//  Created by User06 on 2020/5/14.
//  Copyright © 2020 bc. All rights reserved.
//

import Foundation

class NovelsData: ObservableObject {
    @Published var novels = [Novel](){
        didSet{
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(novels){
                UserDefaults.standard.set(data, forKey:"novels")
            }
        }
    }
    
    init(){
        if let data =
            UserDefaults.standard.data(forKey:"novels"){
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Novel].self, from:data){
                novels = decodedData
            }
        }
    }
}
