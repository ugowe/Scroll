//
//  ClipPlayer.swift
//  Scroll
//
//  Created by Joseph Ugowe on 6/29/22.
//

import Foundation
import SwiftUI
import AVKit
import SDWebImageSwiftUI

struct ClipPlayer: View {
    
    @Binding var video: AVPlayer
    
    var body: some View {
        ZStack {
            
            VideoPlayer(player: video)
            VideoActionsOverlay()
        }
        
    }
}


struct VideoActionsOverlay: View {
    let userImageURL = "https://golfdigest.sports.sndimg.com/content/dam/images/golfdigest/fullset/2019/09/17/5d8106de15c544000972f7d3_526FCLDMSWVWZJBGR6OXZAG7KE.jpg.rend.hgtvcom.1280.1280.suffix/1573230333343.jpeg"
    
    var body: some View {
        VStack {
            TopVideoActions()

            Spacer()
            HStack(alignment: .top) {
                WebImage(url: URL(string: userImageURL))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 47, height: 47)
                    .padding(.trailing, 10)
                VStack(alignment: .leading, content: {
                    Text("James Mansfield #12")
                        .font(.system(size: 17))
                        .bold()
                        .padding(.bottom, 0.4)
                    Text("Out @ South Street Wolves")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .padding(.bottom, 0.3)
                    Text("James Mansfield gets the batter to line out to LF")
                        .font(.system(size: 13))
                        .padding(.bottom, 0.3)
                    Text("6/23/2022")
                        .font(.system(size: 11))
                        .fontWeight(.thin)

                })
            }
            .padding(.bottom, 45)
            
        }
    }
}

struct TopVideoActions: View {
    
    
    var body: some View {
        HStack(alignment: .top) {
            Button(action: {
                print("I've been ❌")
            }, label: {
                Image(systemName: "xmark")
            })
                .padding(.leading)
                .foregroundColor(.white)
            
            Spacer()
            
            VStack {
                VStack(alignment: .trailing) {
                    Button {
                        print("I'm here to help 💛")
                    } label: {
                        HStack{
                            Spacer()
                            Text("Help & Feedback")
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                            Image(systemName: "questionmark.circle")
                        }
                        
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                    .padding(.trailing, 3)
                    
                    Button {
                        print("I'm sharing 🙊 ")
                    } label: {
                        HStack {
                            Spacer()
                            Text("Share")
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.trailing, 3)
                    
                }
            }
            .padding(.top, 40)
        }
        .padding(.top, 10)
    }
}
