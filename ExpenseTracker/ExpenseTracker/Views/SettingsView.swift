//
//  SettingsView.swift
//  ExpenseTracker
//
//  Created by Vounatsou, Maria on 24/9/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        ZStack {
            Color.colorT
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Button {
                        presentSideMenu.toggle()
                    } label: {
                        Image(systemName: "list.bullet.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    SettingsView(presentSideMenu: .constant(false))
}
