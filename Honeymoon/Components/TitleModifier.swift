//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Anthony on 9/11/24.
//

import SwiftUI

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundStyle(.pink)
  }
}
