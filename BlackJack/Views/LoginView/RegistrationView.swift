//
//  RegistrationView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 05.12.24.
//


import SwiftUI
import SwiftData

struct RegistrationView: View {
    @StateObject private var viewModel: RegistrationViewModel
    @Binding var isRegistered: Bool // Binding für den Registrierungsstatus

    init(context: ModelContext, isRegistered: Binding<Bool>) {
        let repository = PlayerRepository(context: context)
        _viewModel = StateObject(wrappedValue: RegistrationViewModel(playerRepository: repository))
        self._isRegistered = isRegistered
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("Registrieren")
                .font(.largeTitle)
                .bold()

            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("E-Mail", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)

            SecureField("Passwort", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Passwort bestätigen", text: $viewModel.confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button("Registrieren") {
                viewModel.register()
                if viewModel.registrationSuccess {
                    isRegistered = false // Navigation zurück zur LoginView
                }
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .alert("Registrierung erfolgreich!", isPresented: $viewModel.registrationSuccess) {
            Button("OK", role: .cancel) {}
        }
    }
}
#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true) // Daten nur im Speicher
    let container = try! ModelContainer(for: Player.self, configurations: config)
    
    let context = container.mainContext
    
    RegistrationView(context: context, isRegistered: .constant(false))
        .modelContainer(container)
}
