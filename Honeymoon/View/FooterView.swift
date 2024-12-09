//
//  FooterView.swift
//  Honeymoon
//
//  Created by Anthony on 8/11/24.
//

import SwiftUI

struct FooterView: View {
    //MARK: - PROPERTIES

  @Binding var showBookingAlert: Bool

    //MARK: - BODY
    var body: some View {
      HStack {
        Button {

        } label: {
          Image(systemName: "xmark.circle")
            .font(.system(size: 42, weight: .light, design: .none))
        }
        .tint(.primary)
        Spacer()

        Button {
          playSound(sound: "sound-click", type: "mp3")
          haptics.notificationOccurred(.success)
          showBookingAlert.toggle() // what actually toggles is showAlert, not showBookingAlert
        } label: {
          Text("Book Destination".uppercased())
            .font(.system(.subheadline, design: .rounded, weight: .heavy))
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .tint(.pink)
            .background(Capsule().stroke(.pink, lineWidth: 2))
        }

        Spacer()

        Button {

        } label: {
          Image(systemName: "heart.circle")
            .font(.system(size: 42, weight: .light, design: .none))
        }
        .tint(.primary)

      } //: HSTACK
      .padding()
    }
}

#Preview {
  FooterView(showBookingAlert: .constant(false))
}
