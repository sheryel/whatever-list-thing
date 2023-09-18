import SwiftUI

struct create: View {
    @Binding var listOfItems: [Item]
    @Binding var item: Item
    @Binding var sheetShown: Bool
    @Binding var newItem: Bool
    @State private var newName = ""
    @State private var foundItem = true
    @State private var amountLost = 0

    var body: some View {
        NavigationView {
            VStack {
                List{
                    TextField("what dID YOU LOSE THIS TIME", text: $newName)
                    VStack {
                        Spacer()
                        Toggle("have you found it", isOn: $foundItem)
                        Spacer()
                        if foundItem {
                            Text("good")
                        } else {
                            Text("smh")
                        }
                        Spacer()
                    }
                    if amountLost == 1 {
                        Stepper("this has been lost \(amountLost) time", value: $amountLost)
                    } else {
                        Stepper{
                            Text("this has been lost \(amountLost) times")
                        } onIncrement: {
                            amountLost += 1
                        } onDecrement: {
                            if amountLost <= 0 {
                                amountLost = 0
                            }
                            else {
                                amountLost -= 1
                            }
                        }
                    }
                }
                .navigationBarTitle("oh no i lost more stuff")
                Button {
                    item = Item(name: newName, found: foundItem, numLost: amountLost)
                    listOfItems.append(item)
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

struct create_Previews: PreviewProvider {
    static var previews: some View {
        create(listOfItems: .constant([Item(name: "placeholder", found: false, numLost: 0)]),
               item: .constant(Item(name: "placeholder", found: false, numLost: 0)),
               sheetShown: .constant(true),
               newItem: .constant(false))
    }
}
