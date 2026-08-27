import NaturalLanguage

let text = "Steve Jobs, Steve Wozniak, and Ronald Wayne founded Apple Computer in the garage of Steve Jobs's Los Altos home."

let tagger = NLTagger(tagSchemes: [NLTagScheme.nameTypeOrLexicalClass])

 tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: NLTokenUnit.word, scheme: NLTagScheme.nameTypeOrLexicalClass, options: [.omitPunctuation, .omitWhitespace, NLTagger.Options.joinNames]){ (tag, range) -> Bool in
    
    print(text[range])
    print(tag?.rawValue ?? "unknown")
    return true
    
}
