import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var showTransitionView: Bool = false
    @State private var activeView: String? = nil
    @StateObject private var playerViewVM: PlayerViewVM
    @ObservedObject var loginViewModel: LoginViewModel
    
    init(context: ModelContext, loginViewModel: LoginViewModel) {
        let repository = PlayerRepository(context: context)
        _playerViewVM = StateObject(wrappedValue: PlayerViewVM(playerRepository: repository))
        self.loginViewModel = loginViewModel
    }
   
    
    var body: some View {
        ZStack {
            GameBackgroundView()
                
            if showTransitionView {
                            Animation1()
            } else {
                VStack {
                    // Top-Bar mit Spielername und Coins
                    
                    GameHeader(playViewVM: playerViewVM)
                        .frame(height: 80)
                        .padding(.vertical, 30)
                    //                HStack {
                    //                   
                    //                    Text(playerViewVM.name)
                    //                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    //                        .foregroundColor(BlackjackTheme.textColor)
                    //                        .padding(.leading, 30)
                    //                    
                    //                    Spacer()
                    //                    
                    //                    Text("\(playerViewVM.coins)")
                    //                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    //                        .foregroundColor(BlackjackTheme.textColor)
                    //                        .padding(.trailing, 50)
                    //                }
                    // .padding(.top,60)
                    //.ignoresSafeArea()
                    Spacer()
                }
                
                VStack(spacing: 20) {
                    Image("BlackJackRound")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.top, 80)
                        .padding(.bottom, 40)
                    //                Text("Willkommen bei \nBlackjack!")
                    //                    .font(.system(size: 55, weight: .bold, design: .rounded))
                    //                    .foregroundColor(BlackjackTheme.highlightColor1)
                    //                    .multilineTextAlignment(.center)
                    //                    .padding(.bottom, 20)
                    
                    //                HStack {
                    //                    Image("Chip")
                    //                        .resizable()
                    //                        .scaledToFit()
                    //                        .frame(width: 50)
                    //                        .padding(50)
                    //                    
                    //                    Image("Chip")
                    //                        .resizable()
                    //                        .scaledToFit()
                    //                        .frame(width: 50)
                    //                        .padding(55)
                    //                }
                    
                    // Buttons für Navigation
                    VStack(spacing: 20) {
                        // Spiel starten - activeView ändern
                        Button(action: {
                            showTransitionView = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                showTransitionView = false
                                activeView = "Game"
                            }
                        }) {
                            Text("Spiel starten")
                                .font(.title2.bold())
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(BlackjackTheme.highlightColor1)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(radius: 8)
                        }
                        
                        // Wechsel zu StatsView
                        Button(action: {
                            activeView = "Stats"
                        }) {
                            Text("Statistiken")
                                .font(.title2.bold())
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(BlackjackTheme.highlightColor1)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(radius: 8)
                        }
                        
                        // Wechsel zu SettingsView
                        Button(action: {
                            activeView = "Settings"
                        }) {
                            Text("Einstellungen")
                                .font(.title2.bold())
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(BlackjackTheme.highlightColor1)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(radius: 8)
                        }
                        
                        Button(action: {
                            loginViewModel.isLogIn = false
                        }) {
                            Text("Ausloggen")
                                .font(.title2.bold())
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(BlackjackTheme.dismiss)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(radius: 8)
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 40)
                    
                    
                }
                .padding()
                .foregroundColor(BlackjackTheme.textColor)
                .cornerRadius(20)
                .shadow(radius: 20)
            }
            // Zeige die aktive Ansicht basierend auf activeView
            if activeView == "Game" {
                GameView(activeView: $activeView, playViewVM: playerViewVM)
            } else if activeView == "Stats" {
                StatsView(gameStats: GameStats(), activeView: $activeView)
            } else if activeView == "Settings" {
                SettingsView(activeView: $activeView)
                
            }
        }
        .onAppear(){
            playerViewVM.mergePlayer()
        }
        .navigationBarBackButtonHidden(true) // Der Back-Button wird ausgeblendet
                .navigationBarTitle("Home", displayMode: .inline)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true) // Daten nur im Speicher
    let container = try! ModelContainer(for: Player.self, configurations: config)

    let context = container.mainContext

    HomeView(context: context, loginViewModel: LoginViewModel(playerRepository: PlayerRepository(context: context)))
        .modelContainer(container)
}
