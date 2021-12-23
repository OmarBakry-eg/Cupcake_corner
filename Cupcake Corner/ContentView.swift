//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Omar Bakry on 23/12/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order : Order = Order()
    var body: some View {
        NavigationView {
                Form {
                    Section {
                    Picker("Select your cake type",selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes : \(order.quantity)", value: $order.quantity)
                    }
                    Section {
                        Toggle("Any Special Request",isOn: $order.specialRequestEnabled.animation())
                        if order.specialRequestEnabled {
                            Toggle("Add extra frosting", isOn: $order.extraFrosting)

                             Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                        }
                    }
                    
                    Section {
                        NavigationLink{
                            AddressView(order: order)
                        } label : {
                            Text("Delivery details")
                        }
                    }
                }
            
            .navigationTitle("Cupcake Corner")
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
