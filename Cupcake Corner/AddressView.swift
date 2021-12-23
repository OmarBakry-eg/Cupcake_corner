//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by Omar Bakry on 23/12/2021.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order : Order
    var body: some View {
        Form {
            Section{
                ForEach(0...3, id: \.self) { i in
                    TextField(i == 0 ? "Name" : i == 1 ? "Street Address" : i == 2 ? "City" : "Zip", text: i == 0 ? $order.name : i == 1 ? $order.streetAddress : i == 2 ? $order.city : $order.zip)
                }

            }
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Checkout")
                }
                
            }
            .disabled(order.hasValidAddress == false)
            .navigationTitle("Delivery details")
            .navigationBarTitleDisplayMode(.inline)
           
            .preferredColorScheme(.dark)
        }

    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
