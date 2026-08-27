import NaturalLanguage

let text = "Knowledge will give you power, but character respect."
let tagger = NLTagger(tagSchemes: [NLTagScheme.tokenType])
tagger.string = text
tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: NLTokenUnit.word, scheme: NLTagScheme.tokenType, options: [.omitPunctuation, .omitWhitespace]) {(tag, rannge) -> Bool in
    print(text[rannge])
    return true
}
