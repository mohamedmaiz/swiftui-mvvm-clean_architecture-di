//
//  ShimmerEffect.swift
//  Core
//
//  Created by Mohamed Maiz on 09/01/2026.
//

import SwiftUI

public struct ShimmerEffectBox: View {
    private var gradientColors = [
        Color.gray.opacity(0.3),
        Color.gray.opacity(0.4),
        Color.gray.opacity(0.3)
    ]
    @State var startPoint: UnitPoint = .init(x: -1.8, y: -1.2)
    @State var endPoint: UnitPoint = .init(x: 0, y: -0.2)
    
    public init(){}
    
    public var body: some View {
        LinearGradient (colors: gradientColors,
                        startPoint: startPoint,
                        endPoint: endPoint)
        .onAppear {
            withAnimation (.easeInOut (duration: 1)
                .repeatForever (autoreverses: false)) {
                    startPoint = .init(x: 1, y: 1)
                    endPoint = .init(x: 2.2, y: 2.2)
                }
        }
    }
}
struct ShimmerEffectBox_Previews: PreviewProvider {
    static var previews : some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                ShimmerEffectBox()
                    .frame(width: .infinity , height: 50)
                    .cornerRadius(8)
                
                HStack {
                    ShimmerEffectBox()
                        .frame(width: .infinity , height: 50)
                        .cornerRadius(8)
                    ShimmerEffectBox()
                        .frame(width: .infinity , height: 50)
                        .cornerRadius(8)
                }
            }
            
            
        }
    }
}

