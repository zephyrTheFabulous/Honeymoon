//
//  ButtonModifier.swift
//  Honeymoon
//
//  Created by Anthony on 9/11/24.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.headline)
      .padding()
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(Capsule().fill(.pink))
      .foregroundStyle(.white)
  }
}



