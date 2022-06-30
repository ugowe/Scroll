//
//  ContentView.swift
//  Scroll
//
//  Created by Joseph Ugowe on 6/29/22.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            Home()
            // Color scheme is working inside navigation bar
                .preferredColorScheme(.dark)
                .navigationTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var index = 0
    let videoURL = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var videos = [
        AVPlayer(url: URL(string: "https://static.videezy.com/system/resources/previews/000/000/254/original/http-yahoo.mp4")!),
        AVPlayer(url: URL(string: "https://static.videezy.com/system/resources/previews/000/038/209/original/DSCF6574.mp4")!),
        AVPlayer(url: URL(string: "https://static.videezy.com/system/resources/previews/000/000/254/original/http-yahoo.mp4")!),
        AVPlayer(url: URL(string: "https://static.videezy.com/system/resources/previews/000/038/209/original/DSCF6574.mp4")!),
        AVPlayer(url: URL(string: "https://static.videezy.com/system/resources/previews/000/000/254/original/http-yahoo.mp4")!),
        AVPlayer(url: URL(string: "https://static.videezy.com/system/resources/previews/000/038/209/original/DSCF6574.mp4")!),
        AVPlayer(url: URL(string: "https://static.videezy.com/system/resources/previews/000/000/254/original/http-yahoo.mp4")!),
        AVPlayer(url: URL(string: "https://static.videezy.com/system/resources/previews/000/038/209/original/DSCF6574.mp4")!),
        
    ]
    
    var body: some View {
        TabView(selection: $index) {
            ForEach(1..<videos.count, id: \.self) { i in
                
                ClipPlayer(video: $videos[i])
                    .rotationEffect(.init(degrees: -90))
                // Setting width
                    .frame(width: UIScreen.main.bounds.width)
                // to find current index
                // setting tag for each video
                    .tag(i)
            }
            // Whenever the index changes, pause all other videos
            .onChange(of: index) { (_) in
                for i in 0..<videos.count {
                    videos[i].pause()
                }
                
                // Play current video
                videos[index].play()
            }
        }
        .rotationEffect(.init(degrees: 90)) // If view is rotated means width will be equal to height
        // Removing edge values
        .frame(width: UIScreen.main.bounds.height - (edges!.top + edges!.bottom))
        
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(Color.black.ignoresSafeArea(.all, edges: .all))
        
    }
    
    
}



