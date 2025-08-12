//
//  CustomPicker.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI

 struct CustomPicker<T: RawRepresentable & Hashable & CaseIterable>: View where T.RawValue == String {
    let title: String
    let placeholder: String
    @Binding var selection: T?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title + ":")
                .font(.system(.body, weight: .semibold))
            Menu {
                ForEach(T.allCases as! [T], id: \.self) { item in
                    let selectedItem = selection == item
                    
                    Button {
                        selection = item
                    } label : {
                        HStack {
                            Text(item.rawValue)
                            
                            if selectedItem {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            } label: {
                HStack {
                    Text(selection?.rawValue ?? placeholder)
                        .foregroundStyle(selection == nil ? .labelSecondary : .labelPrimary)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.up.chevron.down")
                        .foregroundStyle(Color.accentColor)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(.backgroundTertiary)
                )
            }
        }
    }
}
