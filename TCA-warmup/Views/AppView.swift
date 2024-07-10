//
//  AppView.swift
//  TCA-warmup
//
//  Created by Joaquin Wilson on 10-07-24.
//

import ComposableArchitecture
import SwiftUI

struct AppView: View {
    let store: StoreOf<AppFeature>
    

    var body: some View {
        TabView {
            CounterView(store: store.scope(state: \.numbersTab, action: \.numbersTab))
              .tabItem {
                Text("Numbers")
              }

            ContactsView(store: store.scope(state: \.contactsTab, action: \.contactsTab))
            .tabItem {
                  Text("Contacts")
                }
        }
    }
}

#Preview {
  AppView(
    store: Store(initialState: AppFeature.State()) {
      AppFeature()
    }
  )
}
