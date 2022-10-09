//
//  CartView.swift
//  SwiftUIProject
//
//  Created by Nebo on 09.10.2022.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var productsVM: VM
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(0..<productsVM.products.count) {
                    if productsVM.products[$0].count > 0 {
                        CartElementView(product: productsVM.products[$0])
                    }
                }
                Spacer()
                NavigationLink(destination: MenuView(), label: { Text("Добавить продукт") } )
            }
            .navigationTitle("Корзина")
            .padding()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
