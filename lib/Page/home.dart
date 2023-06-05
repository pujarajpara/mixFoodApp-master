import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mixfoodapp/Constants/Color.dart';
import 'package:mixfoodapp/Constants/model.dart';

import 'package:mixfoodapp/Constants/text.dart';
import 'package:mixfoodapp/Page/saveIcon.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  int isSec = 0;
  List category = [
    "Salad",
    "Breakfast",
    "Appetizer",
    "Noodle",
  ];
  bool save = false;
  List savevideo = [];

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(left: 20, top: 80, right: 120),
        child: Text(
          "Find best recipes \nfor Cooking",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: TextField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Search recipes',
              prefixIcon: const Icon(
                Icons.search,
                size: 25,
              )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 30),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
        height: 290,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 15, top: 20),
          itemCount: saverec.length,
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
                                saverec[index].saverecipe,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 80, top: 60),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(33),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 3.0, sigmaY: 3.0),
                                    child: Container(
                                      height: 48,
                                      width: 48,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(left: 2),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0x4A303030)),
                                      child: const Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 120, top: 150),
                                child: ClipRRect(
                                  child: Container(
                                      height: 30,
                                      width: 42,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0x4A303030)),
                                      child: const Center(
                                        child: Text(
                                          "15:10",
                                          style: TextStyle(color: Colors.white),
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
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const saveIcon()));
                            },
                            child: save == false
                                ? const Icon(
                                    Icons.bookmark_add_outlined,
                                    size: 18,
                                  )
                                : const Icon(
                                    Icons.bookmark_remove_outlined,
                                    size: 18,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 150,
                      ),
                      child: Text(saverec[index].saveretitle,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsNeutral.Neutral90,
                              fontWeight: FontWeight.w600)),
                    ),
                    Icon(Icons.more_horiz)
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 210,
                  ),
                  child: Row(
                    children: [
                      Image.asset(saverec[index].unsplash1),
                      SizedBox(
                        width: 10,
                      ),
                      Text(saverec[index].devlop)
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
      SingleChildScrollView(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 00, 20),
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
      DefaultTabController(
        length: 4,
        // length of tabs
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TabBar(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
              unselectedLabelColor: Colors.black,
              // unselectedLabelStyle: Colors.black,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              tabs: [
                Tab(
                  child: Container(
                    height: 34,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Salad"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Breakfast"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Appetizer"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Noodle"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: 260, //height of TabBarView
                child: TabBarView(children: [
                  ListView.separated(
                    padding: const EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: salad.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 190,
                              width: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xfff1f1f1),
                                //color: ColorsNeutral.Neutral20,

                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 80),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      salad[index].saladname,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: ColorsNeutral.Neutral90,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, top: 50),
                                        child: Text(
                                          "10 min",
                                          style: (TextStyle(
                                            color: ColorsNeutral.Neutral90,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, top: 40),
                                        child: Container(
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            color: ColorsNeutral.Neutral0,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Icon(
                                            Icons.bookmark_remove_outlined,
                                            color: ColorsNeutral.Neutral90,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 42,
                            right: 120,
                            child: Text(
                              "Time",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsNeutral.Neutral30,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Image.asset(
                              (salad[index].my1),
                              height: 130,
                              width: 150,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: salad.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 190,
                              width: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xfff1f1f1),
                                //color: ColorsNeutral.Neutral20,

                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 80),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      salad[index].saladname,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: ColorsNeutral.Neutral90,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, top: 50),
                                        child: Text(
                                          "10 min",
                                          style: (TextStyle(
                                            color: ColorsNeutral.Neutral90,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, top: 40),
                                        child: Container(
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            color: ColorsNeutral.Neutral0,
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 42,
                            right: 120,
                            child: Text(
                              "Time",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsNeutral.Neutral30,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 10),
                            child: Image.asset(
                              (salad[index].breafast),
                              height: 130,
                              width: 150,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: salad.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 190,
                              width: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xfff1f1f1),
                                //color: ColorsNeutral.Neutral20,

                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 80),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      salad[index].saladname,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: ColorsNeutral.Neutral90,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, top: 50),
                                        child: Text(
                                          "10 min",
                                          style: (TextStyle(
                                            color: ColorsNeutral.Neutral90,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, top: 40),
                                        child: Container(
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            color: ColorsNeutral.Neutral0,
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 42,
                            right: 120,
                            child: Text(
                              "Time",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsNeutral.Neutral30,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Image.asset(
                              (salad[index].appetizer),
                              height: 130,
                              width: 150,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: salad.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 190,
                              width: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xfff1f1f1),
                                //color: ColorsNeutral.Neutral20,

                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 80),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      salad[index].saladname,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: ColorsNeutral.Neutral90,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, top: 50),
                                        child: Text(
                                          "10 min",
                                          style: (TextStyle(
                                            color: ColorsNeutral.Neutral90,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, top: 40),
                                        child: Container(
                                          height: 50,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            color: ColorsNeutral.Neutral0,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Icon(
                                            Icons.bookmark_add_outlined,
                                            color: ColorsNeutral.Neutral90,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 42,
                            right: 120,
                            child: Text(
                              "Time",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsNeutral.Neutral30,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 12),
                            child: Image.asset(
                              (salad[index].noodles),
                              height: 120,
                              width: 150,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ])),

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
                        const Text(
                          "See all",
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.red,
                          size: 20,
                        ),
                      ],
                    ),
                  ]),
            ),
            // const Padding(padding: EdgeInsets.only(right: 20)),
            // SizedBox(
            //   height: 180,
            //   child: InkWell(
            //     onTap: () {},
            //     child: Padding(
            //       padding: const EdgeInsets.only(left: 1),
            //       child: ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: listmodel2.length,
            //           itemBuilder: (context, index) {
            //             return Column(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.all(10),
            //                   child: Image.asset(
            //                     listmodel2[index].poppulerpers,
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding:
            //                       const EdgeInsets.only(left: 2, bottom: 10),
            //                   child: Text(
            //                     listmodel2[index].Poppulername,
            //                   ),
            //                 ),
            //               ],
            //             );
            //           }),
            //     ),
            //   ),
            // ),
            // PageStorage(
            //     child: currentScreen, bucket: bucket),
          ],
        ),
      ),
    ])));
  }
}
