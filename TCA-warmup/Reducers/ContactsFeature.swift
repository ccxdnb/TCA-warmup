//
//  ContactsFeature.swift
//  TCA-warmup
//
//  Created by Joaquin Wilson on 10-07-24.
//

import Foundation
import ComposableArchitecture


struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}


@Reducer
struct ContactsFeature {
    @ObservableState
    struct State: Equatable {
        @Presents var addContact: AddContactFeature.State?
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    enum Action {
        case addButtonTapped
        case addContact(PresentationAction<AddContactFeature.Action>)
        
    }
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.addContact = AddContactFeature.State(
                    contact: .init(id: .init(), name: "")
                )
                return .none

//            case .addContact(.presented(.delegate(.cancel))):
//                state.addContact = nil
//                return .none

            case let .addContact(.presented(.delegate(.saveContact(contact)))):
//                guard let contact = state.addContact?.contact else { return .none }
                state.contacts.append(contact)
//                state.addContact = nil
                return .none

            case .addContact:
                return .none
            }
        }
        .ifLet(\.$addContact, action: \.addContact) {
            AddContactFeature()
        }
    }
}
