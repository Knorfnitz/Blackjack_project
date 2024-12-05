//
//  LoginView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @ObservedObject  var viewModel: LoginViewModel
  

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()

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
                .buttonStyle(.borderedProminent)

                // NavigationLink zur Registrierung
                NavigationLink("Noch kein Konto? Registrieren", destination: RegistrationView(context:  viewModel.playerRepository.context))
                    .font(.footnote)
                    .padding(.top)

                Spacer()
            }
            .padding()
            .alert("Erfolgreich angemeldet!", isPresented: $viewModel.loginSuccess) {
                Button("OK", role: .cancel) {}
            }
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

