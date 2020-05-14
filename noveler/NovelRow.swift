//
//  NovelRow.swift
//  noveler
//
//  Created by User06 on 2020/5/14.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI

struct NovelRow: View {
    
    var novel: Novel
    let categories=["兒童文學","奇幻文學","驚悚懸疑","推理解謎","言情小說"]

    var body: some View {
        HStack {
            Text("《"+novel.title+"》")
            VStack(alignment: .leading) {
                Text("作者："+novel.author)
                Text("類別：\(categories[novel.category])")
            }
            Spacer()
            Image(systemName: novel.read ? "checkmark.seal.fill" : "xmark.seal").foregroundColor(Color(hue: 0.975, saturation: 0.395, brightness: 0.958))
        }
    }
}

struct NovelRow_Previews: PreviewProvider {
    static var previews: some View {
        NovelRow(novel: Novel(title: "小王子", author: "安托萬·聖修伯里", category: 0, read: true))
        .previewLayout(.sizeThatFits)
    }
}
