# SwiftUI Components & State - Guide 7

An interactive SwiftUI application developed for PUCPR, demonstrating reactive state management (`@State`) through a **Counter** and a **Basic Calculator** exercise.

---

## Getting Started on macOS (Xcode)

Since the project includes a pre-generated Xcode project, you can open and run it directly without any terminal commands.

### Option 1: Open Directly (Recommended)
1. Transfer the project files to your Mac.
2. Double-click the **`SwiftUIContador.xcodeproj`** file to open it in Xcode.
3. Press **⌘ + R** (Command + R) to build and run on the Simulator.

### Option 2: Generate via XcodeGen
If you need to regenerate the project file:
1. Install XcodeGen:
   ```bash
   brew install xcodegen
   ```
2. Generate the project:
   ```bash
   xcodegen generate
   ```

---

## Project Structure

- **`SwiftUIContador.xcodeproj`**: Pre-generated Xcode project package.
- **`SwiftUIContador/`**: App source files.
  - `SwiftUIContadorApp.swift`: App entry point.
  - `ContentView.swift`: Dashboard with navigation.
  - `ContadorView.swift`: Interactive counter screen.
  - `CalculadoraView.swift`: Calculator screen with input verification & error handling.
  - `Info.plist` & `Assets.xcassets`: Settings and configuration.

--- 

## Video demonstration

https://github.com/user-attachments/assets/de19c4be-e943-4b28-81b5-1c069a89adb1

