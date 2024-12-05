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

    init(context: ModelContext) {
        let repository = PlayerRepository(context: context)
        _viewModel = StateObject(wrappedValue: RegistrationViewModel(playerRepository: repository))
    }

    var body: some View {
        NavigationView {
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
}
#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true) // Daten nur im Speicher
    let container = try! ModelContainer(for: Player.self, configurations: config)

    let context = container.mainContext

    RegistrationView(context: context)
        .modelContainer(container)
}
