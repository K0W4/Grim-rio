//
//  AttributeControl.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI

struct AttributeControl: View {
    @Binding var value: Int

    var body: some View {
        HStack(spacing: 8) {
            Button(action: { if value > 0 { value -= 1 } }) {
                Text("-")
                    .font(.system(.largeTitle, weight: .semibold))
            }
            
            Text("\(value)")
                .font(.system(.largeTitle, weight: .semibold))
                .frame(width: 30)
            
            Button(action: { if value < 5 { value += 1 } }) {
                Text("+")
                    .font(.system(.largeTitle, weight: .semibold))
            }
        }
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
}

#Preview {
    AttributeControl(value: Binding.constant(0))
}
