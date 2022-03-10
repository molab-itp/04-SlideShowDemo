//
//  PlayPause.swift
//  SlideShowDemo
//
//  Created by jht2 on 3/10/22.
//

import SwiftUI

struct PlayPauseView: View {
  @State var slideIndex = 0
  @State var isPlaying = false
  // Timer gets called every second.
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  var body: some View {
    VStack {
      Text("Play Pause Slides")
        .font(Font.system(size: 30, weight: .bold))
        .padding()
      // slides is defined in NextPreviousView
      let name = slides[slideIndex]
      SlideView(name: name)
      HStack {
        Button(action: previousItemAction) {
          Image(systemName: "chevron.left")
            .resizable()
            .frame(width: 40, height: 40)
        }
        .padding()
        Spacer()
        Button(action: playPauseAction) {
          Image(systemName: isPlaying ? "pause" : "play")
            .resizable()
            .frame(width: 40, height: 40)
        }
        Spacer()
        Button(action: nextItemAction) {
          Image(systemName: "chevron.right")
            .resizable()
            .frame(width: 40, height: 40)
        }
        .padding()
      }
    }
    .onReceive(timer) { _ in
      // Block gets called when timer updates.
      if (isPlaying) {
        nextItemAction()
      }
    }
  }
  
  func playPauseAction() {
    isPlaying.toggle()
  }
  func previousItemAction() {
    slideIndex = (slideIndex - 1 + slides.count) % slides.count
  }
  func nextItemAction() {
    slideIndex = (slideIndex + 1) % slides.count
  }
}


struct PlayPause_Previews: PreviewProvider {
  static var previews: some View {
    PlayPauseView()
  }
}
