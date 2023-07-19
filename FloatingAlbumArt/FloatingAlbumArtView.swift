//
//  FloatingAlbumArtView.swift
//  FloatingAlbumArt
//
//  Created by Spencer Hartland on 7/19/23.
//

import SwiftUI

struct FloatingAlbumArtView: View {
    private let artAngelsImageURLString = "https://upload.wikimedia.org/wikipedia/en/d/d9/Grimes_-_Art_Angels.png"
    private let placeholderAlbumArtSymbolName = "music.note"
    
    private let url: URL?
    @State var screenSize: CGSize = {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        return window.screen.bounds.size
    }()
    @State private var offset: CGSize = .zero
    
    init() {
        self.url = URL(string: artAngelsImageURLString)
    }
    
    var body: some View {
        let imageSize = screenSize.width * 0.85
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // ...
        
        ZStack {
            AsyncImage(url: url) { image in
                albumArt(image, size: imageSize)
            } placeholder: {
                // ...
            }
        }
        .floating(offset: $offset, screenSize: screenSize)
        .reflection(offset: $offset, screenSize: screenSize)
        
        // ...
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    private func albumArt(_ image: Image, size: CGFloat) -> some View {
        let roundedRect = RoundedRectangle(cornerRadius: 8)
        return image
            .resizable()
            .clipShape(roundedRect)
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .overlay {
                roundedRect.stroke(lineWidth: 0.5)
                    .foregroundStyle(.secondary)
            }
    }
    
    private func mediaImagePlaceholder(size: CGFloat) -> some View {
        return Color(UIColor.secondarySystemGroupedBackground)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .overlay {
                VStack {
                    Image(systemName: placeholderAlbumArtSymbolName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(size * 0.2)
                        .foregroundStyle(.ultraThinMaterial)
                }
            }
    }
    
    private func calculateAngle(onXAxis: Bool) -> Angle {
        let progress = (onXAxis ? offset.height : offset.width) / (onXAxis ? screenSize.height : screenSize.width)
        return .init(degrees: progress * 10)
    }
}
