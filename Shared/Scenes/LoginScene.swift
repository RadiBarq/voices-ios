//
//  LoginScene.swift
//  Voices
//
//  Created by Radi Barq on 18/04/2021.
//

import SwiftUI
import AuthenticationServices

struct LoginScene: View {
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalClass
    #endif
    
    var body: some View {
        #if os(iOS)
        content
        #else
        content
            .frame(minWidth: 1000, minHeight: 800)
        #endif
    }
    
    private var content: some View {
        GeometryReader { geometry in
            VStack {
                Text("Voices")
                    .font(.system(size: geometry.size.width/8, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Keep your flashcards simply organized")
                    .font(.title3)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                SignInWithAppleButton(
                    onRequest: { request in
                    },
                    onCompletion: { result in
                    }
                )
                .frame(width: geometry.size.width / 1.5, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding()
                Spacer()
            }
            .frame(height: geometry.size.height / cardMaxHeightFactor)
            .frame(maxWidth: .infinity)
            .padding(.top, 75)
            .background(
                Image("girl-sitting-with-phone")
                    .resizable()
                    .frame(width: geometry.size.height / 4.2, height: geometry.size.height / 4.2, alignment: .bottom)
                    .opacity(showBottomImage ? 1 : 0)
                , alignment: .bottom)
            .background(Color.accent)
            .clipShape(RoundedRectangle(cornerRadius: cardCornerRadius, style: .continuous))
            Spacer()
        }
    }
}

private extension LoginScene {
    private var cardCornerRadius: CGFloat {
        #if os(iOS)
        return 25
        #else
        return 0
        #endif
    }
    
    private var cardMaxHeightFactor: CGFloat {
        #if os(iOS)
        return 1.5
        #else
        return 1.3
        #endif
    }
    
    private var showBottomImage: Bool {
        #if os(iOS)
        return horizontalClass == .compact
        #else
        return true
        #endif
    }
}

struct LoginScene_Previews: PreviewProvider {
    static var previews: some View {
        LoginScene()
    }
}
