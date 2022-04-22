//
//  RootView.swift
//  Coding-Test
//
//  Created by DaeHyeon Kim on 2022/04/22.
//  Copyright © 2022 DeliveyHero. All rights reserved.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            FirstViewController()
                .tabItem {
                    Image("home").renderingMode(.template)
                    Text("홈")
                }

            SecondViewController()
                .tabItem {
                    Image("favorite").renderingMode(.template)
                    Text("찜")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
