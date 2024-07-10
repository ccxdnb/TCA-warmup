//
//  AppFeature.swift
//  TCA-warmup
//
//  Created by Joaquin Wilson on 10-07-24.
//

import ComposableArchitecture


@Reducer
struct AppFeature {
    struct State: Equatable {
        var numbersTab = CounterFeature.State()
        var contactsTab = ContactsFeature.State()
    }

    enum Action {
        case numbersTab(CounterFeature.Action)
        case contactsTab(ContactsFeature.Action)
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.numbersTab, action: \.numbersTab) {
            CounterFeature()
        }
        Scope(state: \.contactsTab, action: \.contactsTab) {
            ContactsFeature()
        }
        Reduce { state, action in
            // Core logic of the app feature
            return .none
        }
    }
}
