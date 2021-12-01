//
//  ContentView.swift
//  ScripturesMapped
//
//  Created by IS543 on 11/18/21.
//

import SwiftUI

struct ScripturesMappedView: View {
    var body: some View {
        NavigationView{
            VolumesView()
                .navigationBarTitle("Scriptures")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScripturesMappedView()
    }
}
