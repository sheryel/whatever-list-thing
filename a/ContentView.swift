//
//  ContentView.swift
//  todolist
//
//  Created by sheryel on 14/8/23.
//

import SwiftUI
import SwiftPersistence

struct Item: Identifiable, Codable {
    var id = UUID()
    var name: String
    var found: Bool
    var numLost: Int
}

struct ContentView: View {
    
    @State var sheetShown = false
    @State var newItem = false
    
    
    @State var defaultItem = Item(name: "item", found: false, numLost: 0)
    
    @Persistent("listOfItems") var listOfItems:Array = [
        Item(name: "bottle", found: true, numLost: 3),
        Item(name: "mac", found: true, numLost: 2)
        ]
    
    var body: some View {

        NavigationStack{
            List() {
                ForEach(Array(listOfItems.enumerated()), id: \.element.id) { index, item in
                    @State var bindedItem = item
                    @State var bindedIndex = index
                    NavigationLink{
                        DetailView(listOfItems: $listOfItems, item: $defaultItem)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(item.name)")
                            if item.found {
                                Text("found: yes")
                            } else {
                                Text("found: no")
                            }
                            Text("lost: \(item.numLost)")
                        }
                    }
                    .contextMenu{
                        Button{
                            $listOfItems.wrappedValue.remove(at: index)
                        } label: {
                            HStack {
                                Text("delete")
                                Spacer()
                                Image(systemName: "trash")
                            }
                        }
                    }
                }
            } .navigationTitle("stuff lost")
            .toolbar {
                Button {
                    sheetShown = true
                } label: {
                    Text("i lost more stuff")
                }
                .sheet(isPresented: $sheetShown) {
                    create(listOfItems: $listOfItems, item: $defaultItem, sheetShown: $sheetShown, newItem: $newItem)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
