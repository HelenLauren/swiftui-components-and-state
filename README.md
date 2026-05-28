# SwiftUI Componentes e Estados - Guia 7

Este projeto foi reestruturado de forma moderna e robusta para servir como um laboratório completo de SwiftUI, contendo tanto o **Contador Simples** quanto o exercício da **Calculadora Básica**. 

---

## Como Inicializar e Rodar o Projeto no macOS (Xcode)

Como você está visualizando este código em um ambiente Windows, você precisará transferir esta pasta para o seu macOS (ou clonar via Git) e seguir os passos abaixo para gerar o projeto do Xcode.

### Pré-requisitos
1. Ter o **macOS** com o **Xcode** instalado (versão 15+ recomendado).
2. Ter o gerenciador de pacotes **Homebrew** instalado no Mac (para instalar o XcodeGen).

---

### Passo a Passo de Inicialização

#### 1. Instalar o XcodeGen no macOS
Abra o **Terminal** no seu Mac e execute o comando abaixo para instalar o XcodeGen via Homebrew:
```bash
brew install xcodegen
```

#### 2. Gerar o Projeto `.xcodeproj`
Navegue até a pasta raiz deste projeto no Terminal do seu Mac e execute:
```bash
xcodegen generate
```
*Este comando lerá as configurações em `project.yml` e criará automaticamente o arquivo `SwiftUIContador.xcodeproj` na pasta raiz.*

#### 3. Abrir e Rodar no Xcode
Agora você pode abrir o projeto gerado rodando:
```bash
open SwiftUIContador.xcodeproj
```
Ou simplesmente clicando duas vezes no arquivo `SwiftUIContador.xcodeproj` pelo Finder do Mac.

No Xcode:
- Escolha o Simulador do iPhone desejado no menu superior.
- Pressione **⌘ + R** (Command + R) ou clique no botão de Play (triângulo no topo esquerdo) para compilar e executar o aplicativo.

---

## Arquitetura do Projeto Gerado

A estrutura de arquivos criada é a seguinte:

```bash
swiftui-components-and-state/
│
├── project.yml                     # Arquivo de especificação do XcodeGen
├── README.md                       # Instruções de setup e documentação
│
└── SwiftUIContador/                # Código-fonte do aplicativo Swift
    ├── Info.plist                  # Propriedades do bundle iOS
    ├── SwiftUIContadorApp.swift    # Ponto de entrada do aplicativo (@main)
    ├── ContentView.swift           # Menu principal (Dashboard)
    ├── ContadorView.swift          # Tela 1: Contador reativo simples
    ├── CalculadoraView.swift        # Tela 2: Calculadora (Exercício resolvido)
    └── Assets.xcassets/            # Recursos visuais (cores, ícone)
```

---

## Recursos Implementados

### 1. Contador Simples
- Demonstra o uso de `@State` para gerenciamento reativo de estado.
- Layout vertical (`VStack`) e horizontal (`HStack`).
- Botões de **Incrementar**, **Decrementar** e **Reiniciar** com efeitos de animação física (`withAnimation(.spring)`).

### 2. Calculadora Básica (Exercício)
- Entrada de dados utilizando `TextField` com teclado decimal (`.decimalPad`) para suportar números quebrados.
- Funções isoladas e seguras para as 4 operações básicas (`somar`, `subtrair`, `multiplicar` e `dividir`).
- **Tratamento de erros:**
  - Evita falhas ou crashes se os campos estiverem vazios, retornando erro de "Entrada inválida".
  - Validação e proteção contra divisão por zero, mostrando a mensagem de erro apropriada na tela.
- **Formatação numérica:** Usa `NumberFormatter` para limitar o resultado a no máximo 4 casas decimais.
- Botão **Limpar** para reiniciar todos os estados e campos de texto simultaneamente.

