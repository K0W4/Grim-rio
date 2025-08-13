//
//  ImagePickerComponent.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @Binding var imageData: Data?
    
    @State private var selectedPhoto: PhotosUI.PhotosPickerItem?

    var body: some View {

        PhotosPicker(selection: $selectedPhoto, matching: .images) {
            ZStack {
                Image(.corner)
                    .resizable()
                    .frame(width: 271, height: 271)
                
                Group {
                    if let imageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                    } else {
                        Image(systemName: "photo.badge.plus")
                            .font(.system(size: 120))
                            .foregroundColor(.labelPrimary)
                    }
                }
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .frame(width: 271, height: 271)
        }
        .onChange(of: selectedPhoto) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    imageData = data
                }
            }
        }
    }
}

#Preview {
    struct PreviewContainer: View {
        @State private var previewImageData: Data? = nil
        
        var body: some View {
            ImagePicker(imageData: $previewImageData)
                .padding()
                .background(.backgroundPrimary)
        }
    }
    
    return PreviewContainer()
}
