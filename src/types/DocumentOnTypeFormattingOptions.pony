class DocumentOnTypeFormattingOptions
    let firstTriggerCharacter: String
    let moreTriggerCharacter: (Array[String] | None)

    new create(firstTriggerCharacter': String, moreTriggerCharacter': Array[String]) =>
        firstTriggerCharacter = firstTriggerCharacter'
        moreTriggerCharacter = moreTriggerCharacter'