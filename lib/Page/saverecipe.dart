import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mixfoodapp/Constants/Color.dart';
import 'package:mixfoodapp/Page/home.dart';
import 'package:mixfoodapp/Page/recipedetails.dart';
import 'package:mixfoodapp/class/lang.dart';
import 'package:mixfoodapp/controller/lan_change_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mixfoodapp/controller/lan_change_controller.dart';

class saveIcon extends StatefulWidget {
  const saveIcon({
    super.key,
  });

  @override
  State<saveIcon> createState() => _saveIconState();
}

class _saveIconState extends State<saveIcon> {
  List icon = ['Video', 'recipe'];
  int isSec = 0;
  bool isSave = true;

  void removeItem(int index) {
    setState(() {
      saveVideo.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final save = Provider.of<LanguageChangeControllerProvider>(context);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 80, right: 120),
                child: Text(
                  AppLocalizations.of(context)!.savedrecipes,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 60,
                  child: TabBar(
                    padding: const EdgeInsets.all(8),
                    tabs:  [
                      Tab(text: AppLocalizations.of(context)!.recipe),
                      Tab(text: AppLocalizations.of(context)!.video),
                    ],
                    indicator: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(top: 20),
              //   child: SizedBox(
              //     height: 60,
              //     child: ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: 2,
              //         itemBuilder: (context, index) {
              //           return InkWell(
              //             onTap: () {
              //               setState(() {
              //                 isSec = index;
              //               });
              //             },
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10),
              //                 color:
              //                     index == isSec ? Colors.red : Colors.transparent,
              //               ),
              //               margin: const EdgeInsets.all(10),
              //               width: 150,
              //               child: Center(
              //                 child: Text(
              //                   icon[index].toString(),
              //                   style: TextStyle(
              //                       color:
              //                           index == isSec ? Colors.white : Colors.red,
              //                       fontSize: 12),
              //                 ),
              //               ),
              //             ),
              //           );
              //         }),
              //   ),
              // ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 15, top: 25),
                  itemCount: saveVideo.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        saveVideo[index].saverecipe,
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.black38,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                              saveVideo[index].text,
                                              style: TextStyle(
                                                  color: ColorsNeutral.Neutral0,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 80, left: 90),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(33),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 3, sigmaY: 3),
                                            child: Container(
                                              height: 48,
                                              width: 48,
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.only(
                                                  left: 2),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0x4A303030)),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const recipede(),
                                                    ),
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.play_arrow_rounded,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 50, top: 140),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.black38,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '15:10',
                                                    style: TextStyle(
                                                        color: ColorsNeutral
                                                            .Neutral0,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      removeItem(index);
                                    });
                                  },
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: ColorsNeutral.Neutral0,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Icon(
                                      Icons.bookmark_remove,
                                      color: Colors.red,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 5, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                saveVideo[index].saveretitle,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorsNeutral.Neutral90,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Icon(Icons.more_horiz),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 5),
                          child: Row(
                            children: [
                              Image.asset(saveVideo[index].unsplash1),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                saveVideo[index].devlop,
                                style: TextStyle(
                                    color: ColorsNeutral.Neutral40,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
