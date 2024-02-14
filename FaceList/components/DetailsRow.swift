//
//  DetailsRow.swift
//  FaceList
//
//  Created by Oleg Gavashi on 14.02.2024.
//

import SwiftUI

struct DetailsRow: View {
    let label: String
    let value: String
    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
            Spacer()
            Text(value)
                .font(.headline)
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(.buttonBorder)
        .padding(.horizontal)
        
    }
}

#Preview {
    DetailsRow(label: "First name:", value: "Ryan")
}
