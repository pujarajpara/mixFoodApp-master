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
//
//
//
//
// // import 'package:flutter/cupertino.dart';
// //
// // class CustomTranslationProvider extends ChangeNotifier {
// //   Map<String, Map<String, String>> get keys => {
// //     'gu_US': {
// //       'Create recipe': 'રેસીપી બનાવો',
// //       'Ingredients': 'ઘટકો',
// //       'Add new Ingredient': 'નવો ઘટક ઉમેરો',
// //       'Save my recipes': 'મારી વાનગીઓ સાચવો',
// //       'Notification': 'સૂચના',
// //       'All': 'બધા',
// //       'Unread': 'વાંચ્યા વગરનું',
// //       'Read': 'વાંચવું',
// //       'Today': 'આજે',
// //       'My profile': 'મારી પ્રોફાઈલ',
// //       'edit profile': 'પ્રોફાઇલ સંપાદિત કરો',
// //       'recipe': 'રેસીપી',
// //       'video': 'વિડિઓ',
// //       'Followers': 'અનુયાયીઓ',
// //       'Following': 'અનુસરે છે',
// //       'saved recipes': 'સાચવેલી વાનગીઓ',
// //       'Find best recipes for cooking search recipes':
// //       'રસોઈ શોધ વાનગીઓ માટે શ્રેષ્ઠ વાનગીઓ શોધો',
// //       'search recipes': 'વાનગીઓ શોધો',
// //       'Tranding now': 'હાલમાં વલણમાં છે',
// //       'see all': 'બધા જુઓ',
// //       'popular category': 'લોકપ્રિય શ્રેણી',
// //       'Salad': 'કચુંબર',
// //       'Breakfast': 'નાસ્તો',
// //       'Appetizer': 'ભૂખ લગાડનાર',
// //       'Noodle': 'Noodle',
// //       'recent recipe': 'તાજેતરની રેસીપી',
// //       'popular creators': 'લોકપ્રિય સર્જકો',
// //     },
// //     ' hi_In': {
// //       'Create recipe': 'नुस्खा बनाएँ',
// //       'Ingredients': 'सामग्री',
// //       'Add new Ingredients': 'नई सामग्री जोड़ें',
// //       'Save my recipes': 'मेरी रेसिपी सहेजें',
// //       'notification': 'अधिसूचना',
// //       'All': 'सभी',
// //       'Unread': 'अपठित ग',
// //       'Read': 'पढ़ना',
// //       'Today': 'आज',
// //       'My profile': 'मेरी प्रोफाइल',
// //       'Edit profile': 'प्रोफ़ाइल संपादित करें',
// //       'Recipe': 'व्यंजन विधि',
// //       'Saved recipes': 'सहेजे गए व्यंजन',
// //       'Find best recipes for cooking search recipes':
// //       'खाना पकाने की खोज रेसिपी के लिए सर्वोत्तम रेसिपी खोजें',
// //       'Tranding now': 'अब फैशन में है',
// //       'popular category': 'लोकप्रिय श्रेणी',
// //       'Salad': 'सलाद',
// //       'Breakfast': 'नाश्ता',
// //       'Appetizer': 'भूख बढ़ाने वाला',
// //       'Noodle': 'सिर',
// //       'recent recipe': 'ताज़ा नुस्खा',
// //       'see all': 'सभी देखें',
// //       'popular creators': 'लोकप्रिय रचनाकार'
// //     },
// //     ' en_EN': {
// //       'Create recipe': 'Create recipe',
// //       'Ingredients': 'Ingredients',
// //       'Add new Ingredients': 'Add new Ingredients',
// //       'Save my recipes': 'Save my recipes',
// //       'notification': 'notification',
// //       'All': 'All',
// //       'Unread': 'Unread',
// //       'Read': 'Read',
// //       'Today': 'Today',
// //       'My profile': 'My profile',
// //       'Edit profile': 'Edit profile',
// //       'Recipe': 'Recipe',
// //       'Saved recipes': 'Saved recipes',
// //       'Find best recipes for cooking search recipes':
// //       'खाना पकाने की खोज रेसिपी के लिए सर्वोत्तम रेसिपी खोजें',
// //       'Tranding now': 'अब फैशन में है',
// //       'popular category': 'लोकप्रिय श्रेणी',
// //       'Salad': 'सलाद',
// //       'Breakfast': 'नाश्ता',
// //       'Appetizer': 'भूख बढ़ाने वाला',
// //       'Noodle': 'सिर',
// //       'recent recipe': 'ताज़ा नुस्खा',
// //       'see all': 'सभी देखें',
// //       'popular creators': 'लोकप्रिय रचनाकार'
// //     }
// //
// //
// //
// //   };
// //
// //
// //
// //   String _selectedLanguage = 'en_US';
// //   String get selectedLanguage => _selectedLanguage;
// //   Map<String, String>? get translations => keys[_selectedLanguage];
// //   void setLanguage(String languageCode) {
// //     if (keys.containsKey(languageCode)) {
// //       _selectedLanguage = languageCode;
// //       notifyListeners();
// //     }  }
// // }
