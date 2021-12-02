//
//  ScripturesMappedApp.swift
//  ScripturesMapped
//
//  Created by IS543 on 11/18/21.
//

import SwiftUI

@main
struct ScripturesMappedApp: App {
    var body: some Scene {
        WindowGroup {
            ScripturesMappedView().environmentObject(GeoCodeViewModel())
        }
    }
}
