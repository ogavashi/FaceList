//
//  ListRow.swift
//  FaceList
//
//  Created by Oleg Gavashi on 13.02.2024.
//

import SwiftUI

struct ListRow: View {
    let face: Face
    
    var body: some View {
        HStack(alignment: .center) {
            Avatar(face: face, size: 50)
                .padding(.trailing, 5)
            Text(face.fullName)
                .bold()
        }
    }
}

#Preview {
    ListRow(face: Face.example)
}
