//
//  MenuElementView.swift
//  SwiftUIProject
//
//  Created by Nebo on 09.10.2022.
//

import SwiftUI

struct MenuElementView: View {
    
    @ObservedObject var product: ProductModel
    
    var body: some View {
        HStack {
            Text(product.name)
            Spacer()
            Button("-") {
                guard product.count > 0 else { return }
                product.count -= 1
            }
            Text(String(product.count))
            Button("+") {
                product.count += 1
            }
        }.padding()
    }
}

struct CartElementView: View {
    
    @ObservedObject var product: ProductModel
    
    var body: some View {
        HStack {
            Text(product.name)
            Spacer()
            Text("\(product.count) шт.")
        }
    }
    
}


