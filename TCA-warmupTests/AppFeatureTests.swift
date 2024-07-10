//
//  AppFeatureTests.swift
//  TCA-warmupTests
//
//  Created by Joaquin Wilson on 10-07-24.
//

import ComposableArchitecture
import XCTest


@testable import TCA_warmup


@MainActor
final class AppFeatureTests: XCTestCase {
  func testIncrementInFirstTab() async {
      let store = TestStore(initialState: AppFeature.State()) {
        AppFeature()
      }

      await store.send(\.numbersTab.incrementButtonTapped)

      await store.send(\.numbersTab.incrementButtonTapped) {
        $0.numbersTab.count = 1
      }
  }	
}
