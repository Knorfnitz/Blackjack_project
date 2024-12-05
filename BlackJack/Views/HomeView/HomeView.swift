import SwiftUI
import SwiftData

struct HomeView: View {
   // @ObservedObject var playerViewVM: PlayerViewVM
    @State private var activeView: String? = nil
    
    @StateObject private var playerViewVM: PlayerViewVM
    
    init(context: ModelContext) {
        let repository = PlayerRepository(context: context)
        _playerViewVM = StateObject(wrappedValue: PlayerViewVM(playerRepository: repository))
    }
    
    var body: some View {
        ZStack {
            Image("GameTable")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                // Top-Bar mit Spielername und Coins
                HStack {
                    Text(playerViewVM.player.name)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(BlackjackTheme.textColor)
                        .padding(.leading, 30)
                    
                    Spacer()
                    
                    Text("\(playerViewVM.player.coins)")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(BlackjackTheme.textColor)
                        .padding(.trailing, 50)
                }
                .padding(.top,60)
                .ignoresSafeArea()
                Spacer()
            }
            
            VStack(spacing: 20) {
                Text("Willkommen bei \nBlackjack!")
                    .font(.system(size: 55, weight: .bold, design: .rounded))
                    .foregroundColor(BlackjackTheme.highlightColor1)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                HStack {
                    Image("Chip")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .padding(50)
                    
                    Image("Chip")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .padding(55)
                }
                
                // Buttons für Navigation
                VStack(spacing: 20) {
                    // Spiel starten - activeView ändern
                    Button(action: {
                        activeView = "Game"
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
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
            }
            .padding()
            .foregroundColor(BlackjackTheme.textColor)
            .cornerRadius(20)
            .shadow(radius: 20)
            
            // Zeige die aktive Ansicht basierend auf activeView
            if activeView == "Game" {
                GameView()
            } else if activeView == "Stats" {
                StatsView(gameStats: GameStats())
            } else if activeView == "Settings" {
                
            }
        }
        .navigationBarBackButtonHidden(true) // Der Back-Button wird ausgeblendet
                .navigationBarTitle("Home", displayMode: .inline)
    }
}

//#Preview {
//    HomeView(playerViewVM: PlayerViewVM(playerRepository: PlayerRepository(context: <#T##ModelContext#>)))
//}
