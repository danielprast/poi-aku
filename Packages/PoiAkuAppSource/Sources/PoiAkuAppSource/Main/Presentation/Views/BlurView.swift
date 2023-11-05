//
//  BlurView.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import SwiftUI


struct BlurView: UIViewRepresentable {

  var style: UIBlurEffect.Style

  func makeUIView(context: Context) -> UIVisualEffectView {
    let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
    return view
  }

  func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}

}
