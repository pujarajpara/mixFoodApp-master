class Language {
  Language(this.name);

  final String name;

  static List<Language> languageList() {
    return <Language>[
      Language('gu'),
      Language('en'),
      Language('hi '),
    ];
  }
}

