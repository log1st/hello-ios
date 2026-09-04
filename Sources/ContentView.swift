import SwiftUI
import UIKit

struct ContentView: View {
    @State private var isAlertPresented = false
    @State private var taps = 0

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Image(systemName: "shield.checkerboard")
                .font(.system(size: 64, weight: .semibold))
                .foregroundStyle(.tint)

            Text("HelloTrust")
                .font(.largeTitle.bold())

            Text("Проверочная сборка. Нажми кнопку — покажется алерт.")
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Spacer()

            Button {
                taps += 1
                isAlertPresented = true
            } label: {
                Text("Нажми меня")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
            }
            .buttonStyle(.borderedProminent)

            Text("iOS \(UIDevice.current.systemVersion) · нажатий: \(taps)")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding(28)
        .alert("Работает", isPresented: $isAlertPresented) {
            Button("Ок", role: .cancel) { }
        } message: {
            Text("Приложение живое, подпись действительна, алерт показан.\nНажатие № \(taps).")
        }
    }
}

#Preview {
    ContentView()
}
