//
//  BlackJackApp.swift
//  BlackJack
//
//  Created by 🅰️ppEntwickler  on 02.12.24.
//

import SwiftUI
import SwiftData

@main
struct BlackJackApp: App {
    @StateObject  var viewModel: LoginViewModel
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Player.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    init() {
        let repository = PlayerRepository(context: ModelContext(sharedModelContainer))
        _viewModel = StateObject(wrappedValue: LoginViewModel(playerRepository: repository))
    }
    
    var body: some Scene {
        WindowGroup {
            if viewModel.isLogIn{
                HomeView(context: ModelContext(sharedModelContainer), loginViewModel: viewModel)
            }else{
                LoginView(viewModel: viewModel)
            }
            
        }
        .modelContainer(sharedModelContainer)
    }
}
