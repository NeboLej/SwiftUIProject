//
//  NavigationApp.swift
//  SwiftUIProject
//
//  Created by Nebo on 09.10.2022.
//

import SwiftUI

struct NavigationApp: View {
    
    var body: some View {
        CartView().environmentObject(VM())
    }
}

//data

class VM: ObservableObject {
    @Published var products: [ProductModel] = [
        ProductModel(name: "Кортошечка"),
        ProductModel(name: "Молочко"),
        ProductModel(name: "Помидорки"),
        ProductModel(name: "Бананчик"),
        ProductModel(name: "Кукурузка")
    ]
}

class ProductModel: ObservableObject {
    
    @Published var name: String
    @Published var count: Int
    
    init(name: String, count: Int = 0) {
        self.name = name
        self.count = count
    }
}
