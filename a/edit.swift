//
//  edit.swift
//  a
//
//  Created by sheryel on 27/8/23.
//

import SwiftUI

struct edit: View {
    @Binding var listOfItems: [Item]
    @Binding var index: Int
    @Binding var item: Item
    @Binding var name: String
    @Binding var found: Bool
    @Binding var numLost: Int
    @Binding var sheetShown: Bool
    @Binding var newItem: Bool

    var body: some View {
        NavigationView {
            VStack {
                List{
                    TextField("what dID YOU LOSE THIS TIME", text: $name)
                    VStack {
                        Spacer()
                        Toggle("have you found it", isOn: $found)
                        Spacer()
                        if found {
                            Text("good")
                        } else {
                            Text("smh")
                        }
                        Spacer()
                    }
                    if numLost == 1 {
                        Stepper("this has been lost \(numLost) time", value: $numLost)
                    } else {
                        Stepper{
                            Text("this has been lost \(numLost) times")
                        } onIncrement: {
                            numLost += 1
                        } onDecrement: {
                            if numLost <= 0 {
                                numLost = 0
                            }
                            else {
                                numLost -= 1
                            }
                        }
                    }
                }
                .navigationBarTitle("oh no i lost more stuff")
                Button {
                    item = Item(name: name, found: found, numLost: numLost)
                    listOfItems[index] = item
                    sheetShown = false
                } label: {
                    Text("ok")
                        .padding()
                        .font(.system(size: 30))
                }
            }
        }
    }
}

struct edit_Previews: PreviewProvider {
    static var previews: some View {
        edit(listOfItems: .constant([Item(name: "placeholder", found: false, numLost: 0)]),
             index: .constant(0),
             item: .constant(Item(name: "placeholder", found: false, numLost: 0)),
             name: .constant("placeholder"),
             found: .constant(false),
             numLost: .constant(0),
             sheetShown: .constant(true),
             newItem: .constant(false))
    }
}
