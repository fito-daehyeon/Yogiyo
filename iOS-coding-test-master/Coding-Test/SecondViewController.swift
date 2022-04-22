//
//  SecondViewController.swift
//  Coding-Test
//
//  Created by DaeHyeon Kim on 2022/04/22.
//  Copyright © 2022 DeliveyHero. All rights reserved.
//

import SwiftUI
import Kingfisher

struct SecondViewController: View {
    @ObservedObject var viewModel = TestviewModel()
    
    var body: some View {
       
        NavigationView
        {
            VStack
            {
                if !viewModel.sectionTitle.isEmpty
                {
                    List
                    {
                        ForEach(viewModel.sectionTitle,id:\.self){ haeder in
                            
                            Section(header: CustomHaeder(title: haeder))
                            {
                                ForEach(viewModel.foodlist) { index in
                                    if index.sectionTitle == haeder
                                    {
                                        if index.jjim ?? false
                                        {
                                            HStack
                                            {
                                                KFImage.url(viewModel.handleencoded(urlString: index.logoUrl))
                                                    .onFailure{ Value in
                                                    }
                                                    .resizable()
                                                    .loadDiskFileSynchronously()
                                                    .frame(maxWidth:90,maxHeight: 90)
                                                    .aspectRatio(contentMode: .fit)
                                                
                                                
                                                listContent(data:index)
                                                
                                            }
                                            .padding(.vertical,8)
                                        }
                                      
                                        
                                        
                                    }
                                    
                                }
                            }
                         
                        }
                        
                        
                       
                    }
                    .listStyle(PlainListStyle())
                   
                    
                }
                else
                {
                    
                    Spacer()
                    Text("찜한 음식점이 없습니다.")
                    Spacer()
                    
                   
                    
                }
            }
            .navigationBarTitle("찜", displayMode: .inline)
            .background(Color.white)
           
           
           
        }
        .onAppear()
        {
            viewModel.handleJJIM()
        }
    }
}

struct SecondViewController_Previews: PreviewProvider {
    static var previews: some View {
        SecondViewController()
    }
}
