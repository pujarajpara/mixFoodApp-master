import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mixfoodapp/Constants/Color.dart';
import 'package:mixfoodapp/Constants/model.dart';
import 'package:mixfoodapp/controller/lan_change_controller.dart';
import 'package:provider/provider.dart';

class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  State<Person> createState() => _PersonState();
}

enum Language {english, gujarati, hindi }

class _PersonState extends State<Person> {
  List mypro1 = ['Video', 'Recipe'];
  List mypro = ['recipe', 'Videos', 'Followers', 'Following'];
  int isSec = 0;
  List myfollow = ['Recipe', 'Videos', 'Followers', 'Following'];
  List myfollownum = ['3', '13', '14K', '120'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            AppLocalizations.of(context)!.myprofile,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: Consumer<LanguageChangeControllerProvider>(
              builder: (context, provider, child) {
                return PopupMenuButton(
                  icon: const Icon(Icons.more_horiz,color: Colors.black,),
                  onSelected: (Language item) {
                    if (Language.english.name == item.name) {
                      provider.changeLanguage(const Locale('en'));
                    } else if (Language.gujarati.name == item.name) {
                      provider.changeLanguage(const Locale('gu'));
                    } else {
                      provider.changeLanguage(const Locale('hi'));
                    }
                  },


                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<Language>>[
                    const PopupMenuItem(
                      value: Language.english,
                      child: Text(
                        'English',
                        style: TextStyle(color: Colors.black),
                      ),
                     ),
                    const PopupMenuItem(
                      value: Language.hindi,
                      child: Text(
                        'Hindi',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const PopupMenuItem(
                      value: Language.gujarati,
                      child: Text(
                        'Gujarati',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    // Icon(Icons.more_horiz,color: Colors.black,)
                  ],
                );
              },
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('Assets/myprofile.png'),
                        radius: 50,
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.redAccent,
                          side: BorderSide(color: ColorsPrimary.Primary50)),
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)!.editprofile,

                        style: TextStyle(color: ColorsPrimary.Primary50),
                      ),
                    ),
                  ]),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Text(
                      AppLocalizations.of(context)!.alessandrablair,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5, top: 10, right: 24),
                        child: Text(
                          '''
  Hello world I’m Alessandra Blair, I’m
  from Italy 🏳‍🌈 I love cooking so much!  ''',
                          style: TextStyle(
                              color: ColorsNeutral.Neutral40, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.recipe,
                        // 'Recipe',
                        style: TextStyle(
                            color: ColorsNeutral.Neutral40, fontSize: 12),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                            color: ColorsNeutral.Neutral90,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(AppLocalizations.of(context)!.video,
                          style: TextStyle(
                              color: ColorsNeutral.Neutral40, fontSize: 12)),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text(
                        '13',
                        style: TextStyle(
                            fontSize: 20,
                            color: ColorsNeutral.Neutral90,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.followers,
                        // 'Followers',
                        style: TextStyle(
                            color: ColorsNeutral.Neutral40, fontSize: 12),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text(
                        '14K',
                        style: TextStyle(
                            color: ColorsNeutral.Neutral90,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                         AppLocalizations.of(context)!.following,
                        style: TextStyle(
                            color: ColorsNeutral.Neutral40, fontSize: 12),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text(
                        '120',
                        style: TextStyle(
                            color: ColorsNeutral.Neutral90,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Divider(
                height: 10,
                thickness: 1,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mypro1.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            isSec = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == isSec
                                ? Colors.red
                                : Colors.transparent,
                          ),
                          margin: const EdgeInsets.all(10),
                          width: 180,
                          height: 58,
                          child: Center(
                            child: Text(
                              mypro1[index].toString(),
                              style: TextStyle(
                                  color: index == isSec
                                      ? Colors.white
                                      : Colors.red,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 15, top: 10),
              itemCount: myprofileinf.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    myprofileinf[index].my1,
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star_rate_rounded,
                                          color: ColorsNeutral.Neutral0,
                                          size: 18,
                                        ),
                                        Text(
                                          myprofileinf[index].rating,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: ColorsNeutral.Neutral0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 120, left: 20),
                            child: Row(
                              children: [
                                Text(
                                myprofileinf[index].recipename,
                                  style: TextStyle(
                                      color: ColorsNeutral.Neutral0,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                color: ColorsNeutral.Neutral0,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.more_horiz,
                                      color: ColorsPrimary.Primary50,
                                      size: 18,
                                    ),
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 160, left: 20),
                            child: Text(
                              '12 Ingredients | 40 min',
                              style: TextStyle(
                                  color: ColorsNeutral.Neutral0,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20))
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
