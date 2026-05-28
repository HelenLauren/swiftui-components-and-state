import SwiftUI

struct CalculadoraView: View {
    // Inputs em formato String para binding com TextFields
    @State private var numero1Text = ""
    @State private var numero2Text = ""
    
    @State private var numero1: Double? = nil
    @State private var numero2: Double? = nil
    @State private var resultado: Double? = nil
    
    // mensagem de erro
    @State private var mensagemErro: String? = nil
    @State private var realizouCalculo = false
    
    // formato de exibição do resultado
    private var resultadoFormatado: String {
        guard let valor = resultado else { return "" }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 4
        formatter.minimumFractionDigits = 0
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        return formatter.string(from: NSNumber(value: valor)) ?? "\(valor)"
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Seção de Entradas
                VStack(alignment: .leading, spacing: 16) {
                    Text("ENTRADAS")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .tracking(1.0)
                    
                    VStack(spacing: 14) {
                        // Campo 1
                        HStack {
                            Image(systemName: "number")
                                .foregroundColor(.orange)
                                .font(.title3)
                            
                            TextField("Digite o primeiro número", text: $numero1Text)
                                .keyboardType(.decimalPad)
                                .font(.body)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                        
                        // Campo 2
                        HStack {
                            Image(systemName: "number")
                                .foregroundColor(.orange)
                                .font(.title3)
                            
                            TextField("Digite o segundo número", text: $numero2Text)
                                .keyboardType(.decimalPad)
                                .font(.body)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(18)
                .shadow(color: Color.black.opacity(0.03), radius: 10, x: 0, y: 5)
                
                // Seção de Botões de Operação
                VStack(alignment: .leading, spacing: 16) {
                    Text("OPERAÇÕES")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .tracking(1.0)
                    
                    // Grid de Botões (+, -, *, /)
                    Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                        GridRow {
                            Button(action: executarSoma) {
                                Text("+")
                                    .font(.system(size: 28, weight: .semibold))
                                    .frame(maxWidth: .infinity, minHeight: 60)
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(14)
                            }
                            
                            Button(action: executarSubtracao) {
                                Text("-")
                                    .font(.system(size: 28, weight: .semibold))
                                    .frame(maxWidth: .infinity, minHeight: 60)
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(14)
                            }
                        }
                        
                        GridRow {
                            Button(action: executarMultiplicacao) {
                                Text("×")
                                    .font(.system(size: 28, weight: .semibold))
                                    .frame(maxWidth: .infinity, minHeight: 60)
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(14)
                            }
                            
                            Button(action: executarDivisao) {
                                Text("÷")
                                    .font(.system(size: 28, weight: .semibold))
                                    .frame(maxWidth: .infinity, minHeight: 60)
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(14)
                            }
                        }
                        
                        GridRow {
                            Button(action: limparCampos) {
                                HStack {
                                    Image(systemName: "trash.fill")
                                    Text("Limpar")
                                }
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color(.systemGray2))
                                .cornerRadius(14)
                            }
                            .gridCellColumns(2)
                        }
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(18)
                .shadow(color: Color.black.opacity(0.03), radius: 10, x: 0, y: 5)
                
                // Seção de Resultado
                VStack(spacing: 12) {
                    Text("RESULTADO")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .tracking(1.0)
                    
                    if let erro = mensagemErro {
                        Text(erro)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding(.top, 4)
                    } else if realizouCalculo, let _ = resultado {
                        Text(resultadoFormatado)
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.center)
                            .padding(.top, 4)
                    } else {
                        Text("Aguardando operação...")
                            .font(.body)
                            .italic()
                            .foregroundColor(.secondary)
                            .padding(.top, 4)
                    }
                }
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(18)
                .shadow(color: Color.black.opacity(0.02), radius: 8, x: 0, y: 4)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Calculadora")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Funções de Lógica Matemáticas
    
    private func somar(_ num1: Double?, _ num2: Double?) -> Double? {
        guard let n1 = num1, let n2 = num2 else { return nil }
        return n1 + n2
    }
    
    private func subtrair(_ num1: Double?, _ num2: Double?) -> Double? {
        guard let n1 = num1, let n2 = num2 else { return nil }
        return n1 - n2
    }
    
    private func multiplicar(_ num1: Double?, _ num2: Double?) -> Double? {
        guard let n1 = num1, let n2 = num2 else { return nil }
        return n1 * n2
    }
    
    private func dividir(_ num1: Double?, _ num2: Double?) -> Double? {
        guard let n1 = num1, let n2 = num2 else { return nil }
        if n2 == 0 {
            return nil
        }
        return n1 / n2
    }
    
    // MARK: - Ações dos Botões
    
    private func obterNumeros() {
        // Converte as strings para Double, aceitando ponto ou vírgula
        let cleanText1 = numero1Text.replacingOccurrences(of: ",", with: ".")
        let cleanText2 = numero2Text.replacingOccurrences(of: ",", with: ".")
        
        numero1 = Double(cleanText1.trimmingCharacters(in: .whitespacesAndNewlines))
        numero2 = Double(cleanText2.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
    private func executarSoma() {
        obterNumeros()
        realizouCalculo = true
        
        if let res = somar(numero1, numero2) {
            resultado = res
            mensagemErro = nil
        } else {
            resultado = nil
            mensagemErro = "Entrada inválida"
        }
    }
    
    private func executarSubtracao() {
        obterNumeros()
        realizouCalculo = true
        
        if let res = subtrair(numero1, numero2) {
            resultado = res
            mensagemErro = nil
        } else {
            resultado = nil
            mensagemErro = "Entrada inválida"
        }
    }
    
    private func executarMultiplicacao() {
        obterNumeros()
        realizouCalculo = true
        
        if let res = multiplicar(numero1, numero2) {
            resultado = res
            mensagemErro = nil
        } else {
            resultado = nil
            mensagemErro = "Entrada inválida"
        }
    }
    
    private func executarDivisao() {
        obterNumeros()
        realizouCalculo = true
        
        // Verifica divisão por zero antes de aplicar a função dividir
        if let n2 = numero2, n2 == 0 {
            resultado = nil
            mensagemErro = "Divisão por zero"
        } else if let res = dividir(numero1, numero2) {
            resultado = res
            mensagemErro = nil
        } else {
            resultado = nil
            mensagemErro = "Entrada inválida"
        }
    }
    
    private func limparCampos() {
        numero1Text = ""
        numero2Text = ""
        numero1 = nil
        numero2 = nil
        resultado = nil
        mensagemErro = nil
        realizouCalculo = false
    }
}

#Preview {
    NavigationStack {
        CalculadoraView()
    }
}
