//
//  ContentView.swift
//  SlideShowDemo
//
//  Created by jht2 on 3/10/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      VStack {
        NavigationLink (destination: NextPreviousView()) {
          Text("Next Previous Link")
        }
        NavigationLink (destination: PlayPauseView()) {
          Text("Play Pause Link")
        }
        Spacer()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
