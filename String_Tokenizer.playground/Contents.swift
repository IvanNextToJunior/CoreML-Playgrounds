import NaturalLanguage

let text = "Knowledge will give you power, but character respect."
let tagger = NLTagger(tagSchemes: [.lexicalClass, .language, .script])
tagger.string = text


tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: NLTokenUnit.word, scheme: NLTagScheme.lexicalClass, options: [.omitPunctuation, .omitWhitespace]) {(tag, rannge) -> Bool in
    print(text[rannge])
    print(tag?.rawValue ?? "unknown")
    return true
}
