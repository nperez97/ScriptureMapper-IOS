//
//  VolumesView.swift
//  ScripturesMapped
//
//  Created by IS543 on 11/30/21.
//

import SwiftUI

struct VolumesView: View {
    var body: some View {
        List {
            let volumes = GeoDatabase.shared.volumes()
            
            ForEach(volumes.indices) { index in
                NavigationLink(volumes[index], destination: {
                    BooksForVolumesView(volumeId: index + 1, volumeName: volumes[index])
                })
                    .isDetailLink(false)
            }
        }
        .listStyle(.plain)
        .navigationTitle("The Scriptures")
    }
}

struct VolumesView_Previews: PreviewProvider {
    static var previews: some View {
        VolumesView()
    }
}
