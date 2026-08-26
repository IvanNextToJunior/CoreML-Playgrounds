import NaturalLanguage
import Foundation
let text = "Пусть это упражнение станет первым шагом на пути к тому, чтобы мы получили ИИ-сборщика продуктов"
if let language = NLLanguageRecognizer.dominantLanguage(for: text) {
    print("Detected \(language.rawValue.uppercased()) as dominant language for \n\"\(text)\"")
}
else {
    print("Couldn't recognize language for \(text)")
}
