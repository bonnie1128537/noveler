//
//  NovelEditor.swift
//  noveler
//
//  Created by User06 on 2020/5/14.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI

struct NovelEditor: View {
    
    @Environment(\.presentationMode) var presentationMode
    var novelsData: NovelsData
    @State private var title = ""
    @State private var author = ""
    @State private var category = 0
    @State private var read = true
    let categories=["兒童文學","奇幻文學","驚悚懸疑","推理解謎","言情小說"]
    @State private var showBlankAlert = false
    var editNovelIndex: Int?

    var body: some View {
        Form {
                TextField("書名", text: $title)
                TextField("作者", text: $author)
                categoryType(category: self.$category)
                Toggle("已讀", isOn: $read)
            }
            .navigationBarTitle("新增作品")
            .navigationBarItems(trailing: Button("儲存") {
                
                let novel = Novel(title: self.title, author: self.author, category: self.category, read: self.read)
                
                if let editNovelIndex = self.editNovelIndex {
                    
                    self.novelsData.novels[editNovelIndex] = novel
                } else {
                    self.novelsData.novels.insert(novel, at: 0)
                }

                
                self.presentationMode.wrappedValue.dismiss()
            })
                .onAppear {
                    
                    if let editNovelIndex = self.editNovelIndex {
                        let editNovel = self.novelsData.novels[editNovelIndex]
                        self.title = editNovel.title
                        self.author = editNovel.author
                        self.category = editNovel.category
                        self.read = editNovel.read
                    }
        }
    }
}

struct NovelEditor_Previews: PreviewProvider {
    static var previews: some View {
        NovelEditor(novelsData: NovelsData())
    }
}

struct categoryType: View
{
    @Binding var category: Int
    var categories=["兒童文學","奇幻文學","驚悚懸疑","推理解謎","言情小說"]
    var body: some View
    {
        Picker(selection: $category, label: Text("類別")){
            ForEach(0..<categories.count) { (idx) in
                Text(self.categories[idx])
            }
        }.pickerStyle(WheelPickerStyle())
    }
}
