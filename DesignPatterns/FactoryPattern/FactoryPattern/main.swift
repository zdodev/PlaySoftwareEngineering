class Factory {
    static func getInstance(languageEnum: LanguageEnum) -> Language {
        print("팩토리 객체를 생성하여 반환합니다.")
        switch languageEnum {
        case .korean:
            return Korean()
        case .english:
            return English()
        }
    }
}

enum LanguageEnum {
    case korean
    case english
}

protocol Language {
    func text() -> String
}

class Korean: Language {
    func text() -> String {
        "안녕하세요."
    }
}

class English: Language {
    func text() -> String {
        "hello world."
    }
}

class Hello {
    func greeting(language: LanguageEnum) -> String {
        let korean = Factory.getInstance(languageEnum: language)
        return korean.text()
    }
}

let hello = Hello()
print(hello.greeting(language: .korean))
print(hello.greeting(language: .english))
