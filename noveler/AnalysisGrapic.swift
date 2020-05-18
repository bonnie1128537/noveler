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
    let categories=["兒童文學","奇幻文學","驚悚懸疑","推理解謎","言情小說"]
    @State private var selectedAnalyzeItem = "閱讀完了"
    var analyzeItems = ["閱讀完了", "類別統計",]
    var categoryAngles: [Angle]
    var categoryCount: [Double] = [0,0,0,0,0]
    var readCount: Double = 0
    var readAngles: [Angle]
    var readPercent: Double = 0
    
    init(novelsData: NovelsData)
    {
        self.novelsData = novelsData
        
        var totalCount: Double = 0
        
        for data in novelsData.novels
        {
            totalCount += 1
            for idx in 0...4{
                if idx == data.category{
                    categoryCount[idx] += 1
                }
            }
            if data.read == true{
                readCount += 1
            }
        }
        var Percentages: [Double] = [0,0,0,0,0]
        Percentages[0] = categoryCount[0] / totalCount
        Percentages[1] = categoryCount[1] / totalCount
        Percentages[2] = categoryCount[2] / totalCount
        Percentages[3] = categoryCount[3] / totalCount
        Percentages[4] = categoryCount[4] / totalCount
        categoryAngles = [Angle]()
        var StartDegree: Double = 0
        for Percentages in Percentages
        {
            categoryAngles.append(.degrees(StartDegree))
            StartDegree += 360 * Percentages
        }
        if Percentages[4] == 1.0
        {
            categoryAngles[0] = .degrees(360)
        }
        
        var percentage: [Double] = [0,0]
        percentage[0] = readCount / totalCount
        percentage[1] = (totalCount-readCount) / totalCount
        readPercent = (totalCount-readCount) / totalCount
        readAngles = [Angle]()
        var startDegree: Double = 0
        for percentage in percentage
        {
            readAngles.append(.degrees(startDegree))
            startDegree += 360 * percentage
        }
        if percentage[1] == 1.0
        {
            readAngles[0] = .degrees(360)
        }
    }
    
    var body: some View {
        VStack {
            Text("選擇分析項目：")
            Picker(selection: self.$selectedAnalyzeItem, label: Text("選擇分析項目："))
            {
                ForEach(self.analyzeItems, id: \.self)
                {
                    (analyzeItem) in
                    Text(analyzeItem)
                }
            }
            .labelsHidden()
            .pickerStyle(SegmentedPickerStyle())
            .padding(20)
            if self.novelsData.novels.count != 0
            {
                if self.selectedAnalyzeItem == "閱讀完了"
                {
                    resultCircleChart(readPercent: self.readPercent)
                }
                else if self.selectedAnalyzeItem == "類別統計"
                {
                  resultPieChart(categoryAngles: self.categoryAngles)
                }
            }
            else
            {
                Text("沒有紀錄")
                .font(Font.system(size:30))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .frame(width:200, height:200)
                 .background(Color.gray)
                 .cornerRadius(150)
            }
        }
    }
}

struct AnalysisGrapic_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisGrapic(novelsData:NovelsData())
    }
}

struct resultPieChart: View
{
    var categoryAngles: [Angle]
    var body: some View
    {
        VStack//(totalHeight:270)
        {
            ZStack//(height:200)
            {
                PieChart(startAngle: categoryAngles[0], endAngle: categoryAngles[1])
                .fill(Color.red)
                PieChart(startAngle: categoryAngles[1], endAngle: categoryAngles[2])
                .fill(Color.orange)
                PieChart(startAngle: categoryAngles[2], endAngle: categoryAngles[3])
                .fill(Color.yellow)
                PieChart(startAngle: categoryAngles[3], endAngle: categoryAngles[4])
                .fill(Color.green)
                PieChart(startAngle: categoryAngles[4], endAngle: categoryAngles[0])
                .fill(Color.blue)
                HStack{
                    Rectangle()
                    .fill(Color.red)
                    .frame(width: 10, height: 10)
                    Text("兒童文學")
                    Rectangle()
                    .fill(Color.orange)
                    .frame(width: 10, height: 10)
                    Text("奇幻文學")
                    Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 10, height: 10)
                    Text("驚悚懸疑")
                    Rectangle()
                    .fill(Color.green)
                    .frame(width: 10, height: 10)
                    Text("推理解謎")
                    Rectangle()
                    .fill(Color.blue)
                    .frame(width: 10, height: 10)
                    Text("言情小說")
                }.offset(x:0, y: 160)
            }
            .frame(width: 200, height: 200)
            Spacer()//(height:40)
            .frame(height:40)
           // genderIcons()//(height:30)

            /*Form
            {
                boyIcon()
                girlIcon()
                otherIcon()
            }*/
        }
        //.animation(.default)
    }
}

struct resultCircleChart: View {
    var readPercent: Double
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(hue: 0.975, saturation: 0.395, brightness: 0.958), lineWidth: 20)
            Circle()
                .trim(from: 0, to: CGFloat(readPercent))
                .stroke(Color.gray, lineWidth: 20)
            Text(String(format:"%.0f%%完成", 100-(readPercent * 100))).font(Font.system(size:30))
            HStack{
                Rectangle()
                .fill(Color(hue: 0.975, saturation: 0.395, brightness: 0.958))
                .frame(width: 10, height: 10)
                Text("已讀")
                Rectangle()
                .fill(Color.gray)
                .frame(width: 10, height: 10)
                Text("未讀")
            }.offset(x:0, y: 160)
        }.frame(width: 200, height: 200)
    }
}
