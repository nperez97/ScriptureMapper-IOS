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
            //TODO: go back and write code to query.
            ForEach(GeoDatabase.shared.volumes(), id: \.self){
                Text($0)
            }
        }
    }
}

struct VolumesView_Previews: PreviewProvider {
    static var previews: some View {
        VolumesView()
    }
}
