//
//  DetailView.swift
//  todolist
//
//  Created by sheryel on 14/8/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var listOfItems: [Item]
    @Binding var item: Item
    @State var ifound = false
    var body: some View {
        VStack {
            NavigationView {
                Text("\nhave i found it: " + String(describing: item.found))
                    .navigationBarTitle(item.name)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(listOfItems: .constant([Item(name: "placeholder", found: false, numLost: 0)]),
                   item: .constant(Item(name: "placeholder", found: false, numLost: 0)))
    }
}

