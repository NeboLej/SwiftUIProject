//
//  MenuView.swift
//  SwiftUIProject
//
//  Created by Nebo on 09.10.2022.
//

import SwiftUI

struct MenuView: View {
    
    @Environment(\.presentationMode) var preseentation
    @EnvironmentObject var productsVM: VM
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(0..<productsVM.products.count) {
                    MenuElementView(product: productsVM.products[$0])
                }
                Spacer()
                Button("Menu") {
                    preseentation.wrappedValue.dismiss()
                }
                
            }
            .navigationTitle("Меню")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}






