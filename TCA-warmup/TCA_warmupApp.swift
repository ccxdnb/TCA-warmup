//
//  TCA_warmupApp.swift
//  TCA-warmup
//
//  Created by Joaquin Wilson on 09-07-24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_warmupApp: App {
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
            ._printChanges()
    }

    var body: some Scene {
        WindowGroup {
            AppView(
                store: TCA_warmupApp.store
            )
        }
    }
}
