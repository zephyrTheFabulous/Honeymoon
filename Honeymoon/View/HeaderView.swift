//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Anthony on 8/11/24.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - PROPERTIES

  @Binding var showGuideView: Bool
  @Binding var showInfoView: Bool


    //MARK: - BODY
    var body: some View {
      HStack {
        Button {
          haptics.notificationOccurred(.success)
          playSound(sound: "sound-click", type: "mp3")
          showInfoView.toggle()
        } label: {
          Image(systemName: "info.circle")
            .font(.system(size: 24, weight: .regular, design: .none))
        }
        .tint(.primary)
        .sheet(isPresented: $showGuideView) {
          InfoView()
        }

        Spacer()

        Image(.logoHoneymoonPink)
          .resizable()
          .scaledToFit()
          .frame(height: 28)

        Spacer()

        Button {
          haptics.notificationOccurred(.success)
          playSound(sound: "sound-click", type: "mp3")
          showGuideView.toggle()
        } label: {
          Image(systemName: "questionmark.circle")
            .font(.system(size: 24, weight: .regular, design: .none))
        }
        .tint(.primary)
        .sheet(isPresented: $showInfoView) {
          GuideView()
        }

      } //: HSTACK
      .padding()
    }
}

#Preview {
  HeaderView(showGuideView: .constant(false), showInfoView: .constant(false))
}
