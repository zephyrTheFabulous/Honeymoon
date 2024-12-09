  //
  //  InfoView.swift
  //  Honeymoon
  //
  //  Created by Anthony on 9/11/24.
  //

import SwiftUI

struct InfoView: View {
    //MARK: - PROPERTIES

  @Environment(\.dismiss) var dismiss

    //MARK: - BODY
  var body: some View {
    ScrollView {
      VStackLayout(alignment: .center, spacing: 20) {
        HeaderComponent()

        Spacer(minLength: 10)

        Text("App Info")
          .modifier(TitleModifier())

        AppInfoView()

        Text("Credits")
          .modifier(TitleModifier())

        CreditsView()

        Spacer(minLength: 10)

        Button {
          dismiss()
        } label: {
          Text("Continue".uppercased())
            .modifier(ButtonModifier())
        }



      }
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding(.top, 16)
      .padding(.bottom, 26)
      .padding(.horizontal, 26)
    } //: SCROLL
  }
}

#Preview {
  InfoView()
}

struct AppInfoView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
      RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone/iPad")
      RowAppInfoView(itemOne: "Developer", itemTwo: "Efimov Anton")
      RowAppInfoView(itemOne: "Designer", itemTwo: "Robert Petras")
      RowAppInfoView(itemOne: "Website", itemTwo: "swiftuimasterclass.com")
      RowAppInfoView(itemOne: "Version", itemTwo: "1.1.0")
    }
  }
}

  // reusable component
struct RowAppInfoView: View {
    //MARK: - PROPERTIES

  var itemOne: String
  var itemTwo: String

  var body: some View {
    VStack {
      HStack {
        Text(itemOne).foregroundStyle(.gray)
        Spacer()
        Text(itemTwo)
      }

      Divider()
    }
  }
}

struct CreditsView: View {
  var body: some View {
    VStack (alignment: .leading, spacing: 10) {
      HStack {
        Text("Photos").foregroundStyle(.gray)
        Spacer()
        Text("Unsplash")
      }

      Text("Photographers").foregroundStyle(.gray)
      Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
        .multilineTextAlignment(.leading)
        .font(.footnote)

      Divider()
    } //: VSTACK
  }
}
