//
//  ContentView.swift
//  ImageState
//
//  Created by 김대경 on 11/7/25.
//

import SwiftUI

// 네트워크 이미지 URL / Network image URL
let dummyImageUrl = URL(string: "https://picsum.photos/300/300")!

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("이미지 로드 및 상태 변경 아이콘 예제")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("Image loading and state change icon example")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)

                HStack(spacing: 16) {
                    // 네트워크 이미지 / Network image
                    ImageWithToggleIcon(
                        imageContent: {
                            AsyncImage(url: dummyImageUrl) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                case .failure:
                                    Color.gray
                                        .overlay(Text("Error").foregroundColor(.white))
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                    )

                    // 로컬 이미지 / Local image
                    ImageWithToggleIcon(
                        imageContent: {
                            Image("dog")
                                .resizable()
                                .scaledToFill()
                        }
                    )
                }
                .frame(maxWidth: .infinity)
                Spacer()
            }
            .padding()
            //.navigationTitle("ImageState Example")//--> 여기서 가장큰 제목이 표시됨 : Default
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement:.principal) {
                    Text("ImageState Example")
                        .font(.title)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

// 개별 이미지 + 즐겨찾기 토글 아이콘
// Individual images + favorite toggle icon
struct ImageWithToggleIcon<Content: View>: View {
    @State private var isFavorite = false
    let imageContent: () -> Content

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            imageContent()
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )

            // 클릭 시 토글되는 아이콘 / Icon that toggles when clicked
            Image(systemName: isFavorite ? "star.fill" : "star")
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundColor(isFavorite ? .yellow : .white)
                .shadow(radius: 2)
                .padding(8)
                .onTapGesture {
                    withAnimation(.spring()) {
                        isFavorite.toggle()
                    }
                }
        }
        .frame(width: 150, height: 150)
    }
}

#Preview {
    ContentView()
}
