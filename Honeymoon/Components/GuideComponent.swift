//
//  GuideComponent.swift
//  Honeymoon
//
//  Created by Anthony on 8/11/24.
//

import SwiftUI

struct GuideComponent: View {
    //MARK: - PROPERTIES

  var title: String
  var subtitle: String
  var description: String
  var icon: String

    //MARK: - BODY
    var body: some View {
      HStackLayout(alignment: .center, spacing: 20) {
        Image(systemName: icon)
          .font(.largeTitle)
          .foregroundStyle(.pink)

        VStackLayout(alignment: .leading, spacing: 4) {
          HStack {
            Text(title.uppercased())
              .font(.title)
              .fontWeight(.heavy)
            Spacer()
            Text(subtitle.uppercased())
              .font(.footnote)
              .fontWeight(.heavy)
              .foregroundStyle(.pink)
          }

          Divider()
            .padding(.bottom, 4)

          Text(description)
            .font(.footnote)
            .foregroundStyle(.secondary)
            .fixedSize(horizontal: false, vertical: true)
        }
      }
    }
}

#Preview {
  GuideComponent(title: "Title", subtitle: "Swipe right", description: "Placeholder. Placeholder. Placeholder.", icon: "heart.circle")
}
