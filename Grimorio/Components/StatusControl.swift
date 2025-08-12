//
//  StatusControl.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI

struct StatusControl: View {
    let label: String
    let color: Color
    @Binding var currentValue: Int
    let maxValue: Int
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: { if currentValue > 0 { currentValue -= 1 } }) {
                    Image(systemName: "minus")
                }
                
                Spacer()
                
                HStack {
                    Text(label)
                        .font(.status)
                    Text("\(currentValue)/\(maxValue)")
                        .font(.status)
                }
                .foregroundStyle(.white)
                
                Spacer()
                
                Button(action: { if currentValue < maxValue { currentValue += 1 } }) {
                    Image(systemName: "plus")
                }
            }
            .padding(.horizontal)
            .frame(width: 361, height: 50)
            .background(color)
            .clipShape(Capsule())
            .foregroundStyle(.labelPrimary)
            
            Image(.status)
        }
    }
}
