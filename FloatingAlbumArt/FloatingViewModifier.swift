//
//  FloatingViewModifier.swift
//  FloatingAlbumArt
//
//  Created by Spencer Hartland on 7/19/23.
//

import SwiftUI

private struct FloatingViewModifier: ViewModifier {
    @Binding var offset: CGSize
    let screenSize: CGSize
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .rotation3DEffect(calculateAngle(onXAxis: true), axis: (x: -1, y: 0, z: 0))
            .rotation3DEffect(calculateAngle(onXAxis: false), axis: (x: 0, y: 1, z: 0))
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        offset = value.translation
                    })
                    .onEnded({ _ in
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.32, blendDuration: 0.32)) {
                            offset = .zero
                        }
                    })
            )
    }
    
    private func calculateAngle(onXAxis: Bool) -> Angle {
        let progress = (onXAxis ? offset.height : offset.width) / (onXAxis ? screenSize.height : screenSize.width)
        return .init(degrees: progress * 10)
    }
}

extension View {
    func floating(offset: Binding<CGSize>, screenSize: CGSize) -> some View {
        modifier(FloatingViewModifier(offset: offset, screenSize: screenSize))
    }
}
