//
//  SymbolModifier.swift
//  Honeymoon
//
//  Created by Anthony on 9/11/24.
//

import SwiftUI

struct SymbolModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 128))
      .foregroundStyle(.white)
      .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 0)
  }
}
