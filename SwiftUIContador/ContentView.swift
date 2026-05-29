import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(
                    colors: [Color(.systemBackground), Color(.secondarySystemBackground)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 28) {
                        // Header Section
                        VStack(spacing: 8) {
                            Image(systemName: "swift")
                                .font(.system(size: 60))
                                .foregroundColor(.orange)
                                .shadow(color: .orange.opacity(0.3), radius: 10, x: 0, y: 5)
                                .padding(.bottom, 10)
                            
                            Text("SwiftUI Lab")
                                .font(.system(.largeTitle, design: .rounded))
                                .bold()
                            
                            Text("Componentes Visuais e Estado")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 40)
                        
                        // Menu Cards Section
                        VStack(spacing: 18) {
                            // Card 1: Contador Simples
                            NavigationLink(destination: ContadorView()) {
                                MenuCard(
                                    title: "Contador Simples",
                                    subtitle: "Incremento e decremento reativo com @State",
                                    icon: "number.circle.fill",
                                    gradientColor: .blue
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            // Card 2: Calculadora Básica
                            NavigationLink(destination: CalculadoraView()) {
                                MenuCard(
                                    title: "Calculadora Básica",
                                    subtitle: "Operações matemáticas e tratamento de erros",
                                    icon: "plus.forwardslash.minus.equals",
                                    gradientColor: .orange
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        // Footer Section
                        VStack(spacing: 4) {
                            Text("PUCPR")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                            Text("Introdução ao Desenvolvimento iOS")
                                .font(.system(size: 10))
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 40)
                        .padding(.bottom, 20)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// Reusable Menu Card Component
struct MenuCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let gradientColor: Color
    
    var body: some View {
        HStack(spacing: 20) {
            // Icon container with gradient
            ZStack {
                Circle()
                    .fill(gradientColor.opacity(0.15))
                    .frame(width: 56, height: 56)
                
                Image(systemName: icon)
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundColor(gradientColor)
            }
            
            // Text details
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            // Arrow indicator
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.04), radius: 10, x: 0, y: 4)
    }
}

#Preview {
    ContentView()
}
