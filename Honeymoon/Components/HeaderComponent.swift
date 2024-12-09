//
//  HeaderComponent.swift
//  Honeymoon
//
//  Created by Anthony on 8/11/24.
//

import SwiftUI

struct HeaderComponent: View {
    //MARK: - PROPERTIES



    //MARK: - BODY
    var body: some View {
      VStack(alignment: .center, spacing: 20) {
        Capsule()
          .frame(width: 120, height: 6)

        Image(.logoHoneymoon)
          .resizable()
          .scaledToFit()
          .frame(height: 28)
      }
    }
}

#Preview {
    HeaderComponent()
}
