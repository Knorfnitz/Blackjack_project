//
//  LoginView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import SwiftUI
import SwiftData



struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var isRegistered: Bool = false // Status für Registrierung

    var body: some View {
        NavigationStack {
            
            ZStack{
                ScreenBackgroundColor()
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    Image("BlackJackRound")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Text("Spieler-Login")
                        .font(.largeTitle)
                        .bold().foregroundStyle(.white)
                    
                    TextField("E-Mail", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                    
                    SecureField("Passwort", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    Button("Anmelden") {
                        viewModel.login()
                    }
                    .buttonStyle(.borderedProminent).fontWeight(.bold)
                    
                    // Button zur Registrierung
                    Button("Noch kein Konto ? Registrieren !") {
                        isRegistered = true // Navigation auslösen
                    }
                    .font(.subheadline)
                    .padding(.top).foregroundStyle(.white).fontWeight(.bold)
                    
                    Spacer()
                }
                .padding()
                
                .alert("Erfolgreich angemeldet!", isPresented: $viewModel.loginSuccess) {
                    Button("OK", role: .cancel) {}
                }
                .navigationDestination(isPresented: $isRegistered) {
                    RegistrationView(
                        context: viewModel.playerRepository.context,
                        isRegistered: $isRegistered
                    )
                }}
        }
    }
}
    #Preview {
        let config = ModelConfiguration(isStoredInMemoryOnly: true) // Daten nur im Speicher
        let container = try! ModelContainer(for: Player.self, configurations: config)

        let context = container.mainContext

        LoginView(viewModel: LoginViewModel(playerRepository: PlayerRepository(context: context)))
            .modelContainer(container)
    }

