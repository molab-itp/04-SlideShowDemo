//
//  NextPrevious.swift
//  SlideShowDemo
//
//  Created by jht2 on 3/10/22.
//

import SwiftUI

// system symbol names for each slide
let slides = ["ant","hare","ladybug","tortoise"]

struct NextPreviousView: View {
  @State var slideIndex = 0
  var body: some View {
    VStack {
      Text("Next Previous")
        .font(Font.system(size: 30, weight: .bold))
        .padding()
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
        Button(action: nextItemAction) {
          Image(systemName: "chevron.right")
            .resizable()
            .frame(width: 40, height: 40)
        }
        .padding()
      }
    }
  }
  
  func previousItemAction() {
    if (slideIndex > 0) {
      slideIndex -= 1;
    }
  }
  func nextItemAction() {
    if (slideIndex < slides.count-1) {
      slideIndex += 1;
    }
  }
}

// The view use to represent a slide
struct SlideView: View {
  var name:String
  var body: some View {
    VStack {
      Image(systemName: name)
        .resizable()
      Text(name)
    }
  }
}

struct NextPrevious_Previews: PreviewProvider {
  static var previews: some View {
    NextPreviousView()
  }
}
