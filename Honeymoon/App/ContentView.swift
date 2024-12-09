  //
  //  ContentView.swift
  //  Honeymoon
  //
  //  Created by Anthony on 7/11/24.
  //

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES

  @State var showAlert: Bool = false //
  @State var showGuide: Bool = false //
  @State var showInfo: Bool = false //
  @GestureState private var dragState = DragState.inactive // default state
  private var dragAreaThreshold: CGFloat = 65.0 // for xmark and heart symbol.
    // Also if drag is less than 65, then card snaps back to original postion. If more than 65, card from the back appears upfront(used in moveCards() function in .onEnded)
  @State private var lastCardIndex: Int = 1 // give last of two cards index 1
  @State private var cardRemovalTransition = AnyTransition.trailingBottom


    //MARK: - CARDS VIEWS
  @State var cardViews: [CardView] = {
    var views = [CardView]() // empty array to display cards after ForIn and .append
    for index in 0..<2 { // leaving only 2 cards on top
      views.append(CardView(honeymoon: honeymoonData[index]))
    }

    return views
  } ()

    //MARK: - MOVE THE CARD

  private func moveCards() {
    cardViews.removeFirst() // removes upfront card
    lastCardIndex += 1
    let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
    let newCardView = CardView(honeymoon: honeymoon)
    cardViews.append(newCardView)
  }

    //MARK: - TOP CARD. Sorting function
  private func isTopCard(cardView: CardView) -> Bool {
    guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
      return false
    }

    return index == 0
  }

    //MARK: - DRAG STATES
  enum DragState { // for @GestureState, as it's has 3 states
    case inactive
    case pressing
    case dragging(translation: CGSize)

    var translation: CGSize {
      switch self {
      case .inactive, .pressing:
        return .zero
      case .dragging(let translation):
        return translation
      }
    }

    var isDragging: Bool {
      switch self {
      case .inactive, .pressing:
        return false
      case .dragging:
        return true
      }
    }

    var isPressing: Bool {
      switch self {
      case .inactive:
        return false
      case .pressing, .dragging:
        return true
      }
    }

  }


    //MARK: - BODY
  var body: some View {
    VStack {
        //MARK: - HEADER
      HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
        .opacity(dragState.isDragging ? 0.0 : 1.0)
        .animation(.default, value: dragState.isDragging)

      Spacer()

        //MARK: - CARDS
        //      CardView(honeymoon: honeymoonData[1])
        //        .padding()

      ZStack {
        ForEach(cardViews) { item in
          item
            .zIndex(isTopCard(cardView: item) ? 1:0) // sorting function
            .overlay(
              ZStack {
                  // X-MARK SYMBOL
                Image(systemName: "x.circle")
                  .modifier(SymbolModifier())
                  .opacity(dragState.translation.width < -dragAreaThreshold && isTopCard(cardView: item) ? 1.0 : 0.0) // symbol is transparent by default, but appears once drag value is less than -65

                Image(systemName: "heart.circle")
                  .modifier(SymbolModifier())
                  .opacity(dragState.translation.width > dragAreaThreshold && isTopCard(cardView: item) ? 1.0 : 0.0)
              }
            )
            .offset( // first action is to apply effects only to top card, leaving card in background unmoved(0)
              x: isTopCard(cardView: item) ? dragState.translation.width : 0,
              y: isTopCard(cardView: item) ? dragState.translation.height : 0
            )
            .rotationEffect(Angle(degrees: isTopCard(cardView: item) ? Double(dragState.translation.width / 12) : 0))
            .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.translation) // animation for smoother returning card to it's place
            .scaleEffect(
              dragState.isDragging && isTopCard(cardView: item) ?
              0.85 : 1.0)
            .animation(.default, value: dragState.isDragging) // this line was not in tutorial
            .gesture(LongPressGesture(minimumDuration: 0.01) // code for discerning long press and drag gestures and adding it's movement value for later use to opacity modifier
              .sequenced(before: DragGesture())
              .updating($dragState, body:  { (value, state, transaction) in
                switch value {
                case .first(true):
                  state = .pressing
                case .second(true, let drag):
                  state = .dragging(translation: drag?.translation ?? .zero)
                default:
                  break
                }
              })
                .onChanged({ value in
                  guard case .second(true, let drag?) = value else {
                    return
                  }
                  if drag.translation.width < -dragAreaThreshold {
                    cardRemovalTransition = .leadingBottom
                  }
                  if drag.translation.width > dragAreaThreshold {
                    cardRemovalTransition = .trailingBottom
                  }


                })
                .onEnded({ value in
                  guard case .second(true, let drag?) = value else {
                    return
                  }
                  if drag.translation.width < -dragAreaThreshold || drag.translation.width > dragAreaThreshold {
                    playSound(sound: "sound-rise", type: "mp3")
                    moveCards()
                  }
                })
            ) //: GESTURE
            .transition(cardRemovalTransition)
        } //: LOOP
      }

      Spacer()

        //MARK: - FOOTER
      FooterView(showBookingAlert: $showAlert)
        .opacity(dragState.isDragging ? 0.0 : 1.0)
        .animation(.default, value: dragState.isDragging)
    }
    .alert("SUCCESS", isPresented: $showAlert) {
      Button("Happy Honeymoon!", role: .cancel) {}
    } message: {
      Text("Wishing a lovely and most precious of the times together for the amazing couple.")
    }

  }
}
#Preview {
  ContentView()
}
