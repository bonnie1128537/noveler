//
//  NovelList.swift
//  noveler
//
//  Created by User06 on 2020/5/14.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI

struct NovelList: View {
    
    @ObservedObject var novelsData = NovelsData()
    @State private var showEditNovel = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(novelsData.novels.indices, id: \.self) { (index) in
                    NavigationLink(destination: NovelEditor(novelsData: self.novelsData, editNovelIndex: index)) {
                        NovelRow(novel: self.novelsData.novels[index])
                    }
                }
                .onMove { (indexSet, index) in
                    self.novelsData.novels.move(fromOffsets: indexSet,
                                    toOffset: index)
                }
                .onDelete { (indexSet) in
                    self.novelsData.novels.remove(atOffsets: indexSet)
                }
                
            }
            .navigationBarTitle("小說列表")
            .navigationBarItems(leading: EditButton() , trailing: Button(action: {
                self.showEditNovel = true
            }) {
                Image(systemName: "plus.circle.fill")
            })
                .sheet(isPresented: $showEditNovel) {
                    NavigationView {
                        NovelEditor(novelsData: self.novelsData)

                    }
            }
        }
    }
}

struct NovelList_Previews: PreviewProvider {
    static var previews: some View {
        NovelList()
    }
}
