//
//  ExercisesListView.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 03/01/2026.
//

import SwiftUI
import Core
import Kingfisher

public struct PodcastDetailsScreen: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var vm: PodcastDetailsViewModel
    let id: Int
    public var body: some View {
        
        Screen(
            LinearGradient(colors: [
                Color(hex: "#10214f"),
                Color(hex: "#030712")],
                           startPoint: .top,
                           endPoint: .bottom)
        ) {
            switch vm.state {
            case .idle:
                ProgressView()
            case .loading:
                ProgressView()
            case .empty:
                Text("No Data")
            case .loaded:
                DetailsContentView(podcastDetails: vm.details!)
            case .error(let error):
                Text("error: \(error)")
            }
            
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(role: .cancel) {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.white)
                }
                
            }
        }
        .onViewDidLoad{
            vm.viewDidLoad(id: id)
        }
    }
    
}

struct DetailsContentView: View {
    @State private var dominantColor: Color = .clear
    @State private var dominantGradientColor: LinearGradient = LinearGradient(colors: [
        .clear
    ], startPoint: .top, endPoint: .bottom)
    let columns = [
        GridItem(.adaptive(minimum: 60, maximum: 130), spacing: 8)
    ]
    let podcastDetails: PodcastDetails
    var body: some View {
        Rectangle()
            .fill(dominantGradientColor)
            .opacity(0.3)
            .overlay{
                VStack{
                    Spacer()
                    KFImage(podcastDetails.artwork600)
                        .onSuccess { result in
                            let uiImage = result.image
                            if let averageColor = uiImage.averageColor {
                                dominantColor = Color(averageColor)
                                dominantGradientColor = LinearGradient(colors: [
                                    Color(averageColor),
                                    Color(averageColor),
                                    .clear
                                ], startPoint: .top, endPoint: .bottom)
                            }
                        }
                        .resizable()
                        .frame(width: 180 ,height: 180)
                        .shadow(color: .black.opacity(0.4) ,radius: 4)
                        .padding(.bottom , 12)
                    
                    
                    Text(podcastDetails.title)
                        .font(.system(size: 18 , weight: .bold))
                        .foregroundColor(.white)
                    
                    PlayLastestEpisodeView()
                    
                    Spacer()
                    
                    HStack{
                        
                        Rectangle()
                            .frame(height: 8)
                            .cornerRadius(8)
                            .foregroundColor(.white.opacity(0.3))
                        
                        
                    }
                    .padding(.horizontal , 30)
                    .padding(.bottom , 30)
                    HStack{
                        Spacer()
                        Image(systemName: "15.arrow.trianglehead.counterclockwise")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 20 , height: 22)
                            .scaledToFit()
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "play.fill")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 24 , height: 26)
                            .scaledToFit()
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "15.arrow.trianglehead.clockwise")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 20 , height: 22)
                            .scaledToFit()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.bottom , 40)
                    
                    HStack{
                        Image(systemName: "speaker.fill")
                            .renderingMode(.template)
                            .foregroundColor(.white.opacity(0.6))
                        Rectangle()
                            .frame(height: 6)
                            .cornerRadius(8)
                            .foregroundColor(.white.opacity(0.3))
                        Image(systemName: "speaker.wave.3.fill")
                            .renderingMode(.template)
                            .foregroundColor(.white.opacity(0.6))
                        
                    }
                    .padding(.horizontal , 60)
                    .padding(.vertical , 60)
                    
                    
                    
                }
                
            }
            .ignoresSafeArea()
    }
}




#Preview {
    PodcastDetailsFeatureBuilder.makePodcastDetailsPreview()
}


