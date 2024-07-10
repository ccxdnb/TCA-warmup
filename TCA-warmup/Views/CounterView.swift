//
//  CounterView.swift
//  TCA-warmup
//
//  Created by Joaquin Wilson on 09-07-24.
//

import SwiftUI
import ComposableArchitecture

struct CounterView: View {
    let store: StoreOf<CounterFeature>

    var body: some View {
        VStack {

            Button(store.isTimerRunning ? "Stop timer" : "Start timer") {
              store.send(.toggleTimerButtonTapped)
            }
            .font(.largeTitle)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)

            Spacer()
            HStack {
                Button("-") { 
                    store.send(.decrementButtonTapped)
                }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                
                Text("\(store.count)")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)

                Button("+") { 
                    store.send(.incrementButtonTapped)
                }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
            }

            Spacer()

            Button("Fact") {
              store.send(.factButtonTapped)
            }
            .font(.largeTitle)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)

            if store.isLoading {
              ProgressView()
            } else if let fact = store.fact {
              Text(fact)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
            }

            Spacer()
        }
    }
}

#Preview {
  CounterView(
    store: Store(initialState: CounterFeature.State()) {
      CounterFeature()
    }
  )
}
