//
//  CustomView.swift
//  Coding-Test
//
//  Created by DaeHyeon Kim on 2022/04/22.
//  Copyright © 2022 DeliveyHero. All rights reserved.
//

import SwiftUI


struct listContent : View
{
    var data : ListResponse
    var body: some View
    {
        
        VStack(alignment: .leading,spacing:0)
        {
            Text(data.name)
                .fontWeight(.bold)
            
            HStack
            {
                if data.reviewCount != 0
                {
                    Image("start")
                        .resizable()
                        .frame(width: 15, height: 15)
                    
                    
                    Text(String(describing: data.reviewAvg))
                        .foregroundColor(Color.yellow)
                    
                    Image("review")
                   
                    
                    
                    Text("・ 리뷰 \(data.reviewCount)")
                        .foregroundColor(Color.secondary)
                    
                    if data.ownerReplyCount > 0
                    {
                        Text("・ 사장님댓글 \(data.ownerReplyCount)")
                            .foregroundColor(Color.secondary)
                    }
                    
                }
                else
                {
                    HStack
                    {
                        Image("review")
                        Text("첫번째 리뷰를 남겨주세요!")
                            .foregroundColor(Color.secondary)
                    }
                }
               
                
                
                Spacer()
                
                JJImView(select:data.jjim ?? false,title: data.name)
                   
                
                
            }
            .font(.system(size: 14))
            .lineLimit(1)
            .allowsTightening(true)
            
            HStack(spacing:3)
            {
                if data.isPhoneOrderAvailable
                {
                    CustomIconText(title: "전화주문")
                    
                }
                ForEach(data.payment,id:\.self){ x in
                    if x == "yogiseo"
                    {
                        CustomIconText(title: "요기서결제")
                        
                    }
                    else
                    {
                        CustomIconText(title: "현장결제")
                  
                    }
                    
                }
                if data.isAvailablePickup
                {
                    CustomIconText(title: "테이크아웃")
                   
                }
            }
            
            if data.deliveryMethod == "OD"
            {
                Image("express")
                    .padding(.top,10)
            }
           
        }
    }
}

struct JJImView : View
{
    @State var select = false
    
    var title = ""
   
    var body: some View
    {
        Button {
            if select
            {
                RealmManager.shared.removeUserInfo(name: title)
                select.toggle()
              
            }
            else
            {
                select.toggle()
                RealmManager.shared.createJJIMInfo(select: select, name: title, joinPath: .jjim)
            }
          
        } label: {
            
            Image(select ? "favorite_on" : "favorite_off")
           
        }
        

        
    }
}

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct CustomHaeder : View
{
    var title = ""
    var body: some View
    {
        VStack(spacing:0)
        {
            Divider()
                .padding(.horizontal,20)
            
            HStack {
                Text(title)
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                
                Spacer()
            }
                
              
            
            Divider()
                .padding(.horizontal,20)
        }
        .background(Color.white)
        .listRowInsets(EdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0))
    }
}

struct CustomIconText : View
{
    var title = "전화주문"
    var body: some View
    {
        Text(title)
            .font(.system(size: 10))
            .foregroundColor(title != "요기서결제" ? Color.secondary : Color.orange)
            .fontWeight(.bold)
            .padding(3)
            .cornerRadius(3)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(title != "요기서결제" ? Color.secondary : Color.orange, lineWidth: 1)
            )
        
    }
}
