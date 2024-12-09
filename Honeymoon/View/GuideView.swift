  //
  //  GuideView.swift
  //  Honeymoon
  //
  //  Created by Anthony on 8/11/24.
  //

import SwiftUI

struct GuideView: View {
    //MARK: - PROPERTIES

  @Environment(\.dismiss) var dismiss

    //MARK: - BODY
  var body: some View {
    ScrollView {
      VStackLayout(alignment: .center, spacing: 20) {
        HeaderComponent()

        Spacer(minLength: 10)

        Text("Get Started")
          .modifier(TitleModifier())

        Text("Discover and pick the perfect destination for your romantic Honeymoon!")
          .lineLimit(nil)
          .multilineTextAlignment(.center)

        Spacer(minLength: 10)
        VStackLayout(alignment: .leading, spacing: 25) {
          GuideComponent(title: "Like", subtitle: "Swipe right", description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favorites", icon: "heart.circle")
          GuideComponent(title: "Dismiss", subtitle: "Swipe left", description: "Would you rather skip this place? Touch the scrreen and swipe left. You Will no longer see it.", icon: "xmark.circle")
          GuideComponent(title: "Book", subtitle: "Tap the button", description: "Our selection of honeymoon resorts is perfect setting fro you to embark your new life together", icon: "checkmark.square")
        }
        Spacer(minLength: 10)


        Button {
          dismiss()
        } label: {
          Text("Continue".uppercased())
            .modifier(ButtonModifier())
        }

      }
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding(.top, 15)
      .padding(.bottom, 25)
      .padding(.horizontal, 25)
    }
  }
}

#Preview {
  GuideView()
}
