import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mixfoodapp/Constants/Color.dart';
import 'package:mixfoodapp/Constants/model.dart';
import 'package:mixfoodapp/Constants/text.dart';
import 'package:mixfoodapp/Page/createrecipe.dart';
import 'package:mixfoodapp/Page/notification.dart';
import 'package:mixfoodapp/Page/saveIcon.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late TabController _tabController;
  int isSec = 0;
  List category = ["Salad", "Breakfast", "Appetizer", "Noodle", "hello"];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Padding(
                padding: EdgeInsets.only(left: 20, top: 80, right: 120),
                child: Text(
                  "Find best recipes \nfor Cooking",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Search recipes',
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 25,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tranding now 🔥',
                      style: CustomTextStyle.poppinsBoldh5,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.red,
                          size: 20,
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ]),
            ),

            SizedBox(
              height: 240,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 15, top: 20),
                itemCount: listmodels.length,
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
                                      listmodels[index].freslist,
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                            myprofileinf[index].rating,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    ColorsNeutral.Neutral0),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 80, top: 60),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(33),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 3.0, sigmaY: 3.0),
                                          child: Container(
                                            height: 48,
                                            width: 48,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.only(left: 2),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0x4A303030)),
                                            child: Icon(
                                              Icons.play_arrow_rounded,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 120, top: 150),
                                      child: ClipRRect(
                                        child: Container(
                                            height: 30,
                                            width: 42,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color(0x4A303030)),
                                            child: const Center(
                                              child: Text(
                                                "15:10",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.bookmark_remove_outlined,
                                        color: ColorsNeutral.Neutral90,
                                        size: 18,
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20))
                    ],
                  );
                },
              ),
              // child: ListView.builder(
              //   padding: const EdgeInsets.only(left: 15,top: 10),
              //   scrollDirection: Axis.horizontal,
              //   itemCount: listmodels.length,
              //   itemBuilder: (_, index) {
              //     return SizedBox(
              //       width: MediaQuery.of(context).size.width - 30,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(right: 15),
              //             child: Stack(
              //               children: [
              //                 Container(
              //                     decoration: BoxDecoration(
              //                       image: DecorationImage(
              //                           image: AssetImage(
              //                             listmodels[index].freslist,
              //                           ),
              //                           fit: BoxFit.cover),
              //                       color: Colors.grey,
              //                       borderRadius: BorderRadius.circular(15),
              //                     ),
              //                     child: Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: Row(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             Container(
              //                               height: 30,
              //                               width: 60,
              //                               decoration: BoxDecoration(
              //                                 color: Colors.black38,
              //                                 borderRadius:
              //                                     BorderRadius.circular(10),
              //                               ),
              //                               child: Row(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.center,
              //                                 children: [
              //                                   Icon(
              //                                     Icons.star_rate_rounded,
              //                                     color: ColorsNeutral.Neutral0,
              //                                     size: 18,
              //                                   ),
              //                                   Text(
              //                                     listmodels[index].txt,
              //                                     style: TextStyle(
              //                                         color: ColorsNeutral
              //                                             .Neutral0),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                             Padding(
              //                               padding: const EdgeInsets.only(
              //                                   left: 80, top: 60),
              //                               child: ClipRRect(
              //                                 borderRadius:
              //                                     BorderRadius.circular(33),
              //                                 child: BackdropFilter(
              //                                   filter: ImageFilter.blur(
              //                                       sigmaX: 3.0, sigmaY: 3.0),
              //                                   child: Container(
              //                                     height: 48,
              //                                     width: 48,
              //                                     alignment: Alignment.center,
              //                                     padding:
              //                                         const EdgeInsets.only(left: 2),
              //                                     decoration: const BoxDecoration(
              //                                         shape: BoxShape.circle,
              //                                         color: Color(0x4A303030)),
              //                                     child: const Icon(
              //                                       Icons.play_arrow_rounded,
              //                                       color: Colors.white,
              //                                       size: 30,
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             Padding(
              //                               padding: const EdgeInsets.only(
              //                                   left: 120, top: 150),
              //                               child: ClipRRect(
              //                                 child: BackdropFilter(
              //                                   filter: ImageFilter.blur(
              //                                       sigmaX: 5, sigmaY: 5),
              //                                   child: Container(
              //                                     width: 50,
              //                                     height: 29,
              //                                     decoration: BoxDecoration(
              //                                       borderRadius:
              //                                           BorderRadius.circular(
              //                                               10),
              //                                       color: Color(0x4A303030),
              //                                     ),
              //                                     child: const Center(
              //                                       child: Text("15:10",
              //                                           style: TextStyle(
              //                                               color: Colors.white,
              //                                               fontSize: 12)),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ]),
              //                     )),
              //                 Positioned(
              //                   right: 10,
              //                   top: 10,
              //                   child: Image.asset(
              //                     ("Assets/Bookmark.png"),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           const SizedBox(
              //             height: 18,
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(right: 20, left: 5),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(listmodels[index].title,
              //                     style: TextStyle(
              //                         fontSize: 16,
              //                         color: ColorsNeutral.Neutral90,
              //                         fontWeight: FontWeight.w600)),
              //                 Icon(Icons.more_horiz),
              //               ],
              //             ),
              //           ),
              //           const SizedBox(
              //             height: 10,
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(right: 20, left: 5),
              //             child: Row(
              //               children: [
              //                 Image.asset(listmodels[index].image1),
              //                 const SizedBox(
              //                   width: 5,
              //                 ),
              //                 Text(
              //                   listmodels[index].make,
              //                   style: TextStyle(
              //                     color: ColorsNeutral.Neutral40,
              //                     fontWeight: FontWeight.w400,
              //                     fontSize: 12,
              //                   ),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 00, 20),
                    child: Row(
                      children: [
                        Text(
                          "Popular category",
                          style: CustomTextStyle.poppinsBoldh5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(
                              () {
                                isSec = index;
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index == isSec
                                  ? Colors.red
                                  : Colors.transparent,
                            ),
                            margin: const EdgeInsets.all(10),
                            width: 90,
                            child: Center(
                              child: Text(
                                category[index],
                                style: (TextStyle(
                                    color: index == isSec
                                        ? Colors.white
                                        : Colors.red,
                                    fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(left: 13),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listmodels.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 250,
                            width: 170,
                            decoration: BoxDecoration(
                              color: const Color(0xfff1f1f1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 35,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 40,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      listmodels[index].poppuler1,
                                      style: TextStyle(
                                          color: ColorsNeutral.Neutral90,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 60),
                                          child: Text(
                                            "10 min",
                                            style: (TextStyle(
                                                color: ColorsNeutral.Neutral90,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15, top: 60),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                ("Assets/Bookmark123.png"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 35,
                          right: 140,
                          child: Text(
                            "Time",
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorsNeutral.Neutral30,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Positioned(
                            left: 20,
                            top: -15,
                            child: Image.asset(
                              listmodels[index].ramen,
                            )),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent recipe',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: ColorsNeutral.Neutral90),
                    ),
                    Row(
                      children: const [
                        Text("See all",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.w600)),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.red,
                          size: 20,
                        ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listmodel2.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              listmodel2[index].recentre1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2, bottom: 10),
                            child: Text(
                              listmodel2[index].burger,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2, bottom: 30),
                            child: Text(
                              listmodel2[index].recentmake1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: ColorsNeutral.Neutral40,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 30,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular creators',
                      style: CustomTextStyle.poppinsBoldh5,
                    ),
                    Row(
                      children: [
                        Text(
                          "See all",
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.red,
                          size: 20,
                        ),
                      ],
                    ),
                  ]),
            ),
            const Padding(padding: EdgeInsets.only(right: 20)),
            SizedBox(
              height: 180,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listmodel2.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                listmodel2[index].poppulerpers,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 2, bottom: 10),
                              child: Text(
                                listmodel2[index].Poppulername,
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ),
            // PageStorage(
            //     child: currentScreen, bucket: bucket),
          ],
        ),
      ),
    );
  }
}
