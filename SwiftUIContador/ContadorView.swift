import SwiftUI

struct ContadorView: View {
    // @State observa as mudanças para reconstruir a interface
    @State private var contador = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Glassmorphic indicator container
            VStack(spacing: 12) {
                Text("Valor Atual")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)
                    .tracking(1.5)
                
                Text("\(contador)")
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                    .contentTransition(.numericText()) // Transição suave de números no iOS 16+
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 60)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(24)
            .shadow(color: Color.black.opacity(0.04), radius: 12, x: 0, y: 6)
            
            // Action Buttons
            HStack(spacing: 16) {
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        contador += 1
                    }
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Incrementar")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12)
                }
                
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        contador -= 1
                    }
                }) {
                    HStack {
                        Image(systemName: "minus.circle.fill")
                        Text("Decrementar")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(12)
                }
            }
            .padding(.horizontal)
            
            // Reset Button
            Button(action: {
                withAnimation(.spring()) {
                    contador = 0
                }
            }) {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Reiniciar Contador")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding()
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Contador")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ContadorView()
    }
}
