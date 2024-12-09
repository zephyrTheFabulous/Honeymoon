  //
  //  CardView.swift
  //  Honeymoon
  //
  //  Created by Anthony on 7/11/24.
  //

import SwiftUI

struct CardView: View, Identifiable {
    //MARK: - PROPERTIES

  let id = UUID()
  var honeymoon: Destination

    //MARK: - BODY
  var body: some View {
    Image(honeymoon.image)
      .resizable()
      .scaledToFit()
      .clipShape(.rect(cornerRadius: 24))
      .frame(minWidth: 0, maxWidth: .infinity)
      .overlay(alignment: .bottom) {
        VStack(alignment: .center, spacing: 12) {

          Text(honeymoon.place.uppercased())
            .foregroundStyle(.white)
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(radius: 1)
            .padding(.horizontal, 18)
            .padding(.bottom, 4)
            .overlay(alignment: .bottom) {
              Rectangle()
                .fill(.white)
                .frame(height: 1)
            }

          Text(honeymoon.country.uppercased())
            .foregroundStyle(.black)
            .font(.footnote)
            .fontWeight(.bold)
            .frame(minWidth: 85)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Capsule().fill(.white))
        }
        .frame(minWidth: 280)
        .padding(.bottom, 50)
      }
  }
}

#Preview {
  CardView(honeymoon: honeymoonData[0])
}
