import 'package:flutter/material.dart';
import 'package:mixfoodapp/Constants/Color.dart';
import 'package:mixfoodapp/Constants/model.dart';

class person extends StatefulWidget {
  const person({Key? key}) : super(key: key);

  @override
  State<person> createState() => _personState();
}

class _personState extends State<person> {
  List mypro1 = ["Video", "Recipe"];
  List mypro = ["recipe", "Videos", "Followers", "Following"];
  int isSec = 0;
  List myfollow = ["Recipe", "Videos", "Followers", "Following"];
  List myfollownum = ["3", "13", "14K", "120"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text(
            "My profile",
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 30),
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
                            side: BorderSide(color: ColorsPrimary.Primary50)),
                        onPressed: () {},
                        child: Text(
                          "Edit profile",
                          style: TextStyle(color: ColorsPrimary.Primary50),
                        )),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Alessandra Blair",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5, top: 10, right: 24),
                        child: Text(
                          '''  Hello world I’m Alessandra Blair, I’m 
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
                      Text("Recipe",style: TextStyle(color: ColorsNeutral.Neutral40,fontSize: 12),),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text("3",style: TextStyle(color: ColorsNeutral.Neutral90,fontWeight: FontWeight.w600,fontSize: 20),)
                    ],
                  ),
                  Column(
                    children: [
                      Text("Videos",style: TextStyle(color: ColorsNeutral.Neutral40,fontSize: 12)),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text("13",style: TextStyle(fontSize:20,color: ColorsNeutral.Neutral90,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  Column(
                    children: [
                      Text("Followers",style: TextStyle(color: ColorsNeutral.Neutral40,fontSize: 12),),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text("14K",style: TextStyle(color: ColorsNeutral.Neutral90,fontWeight: FontWeight.w600,fontSize: 20),)
                    ],
                  ),
                  Column(
                    children: [
                      Text("Following",style: TextStyle(color: ColorsNeutral.Neutral40,fontSize: 12),),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text("120",style: TextStyle(color: ColorsNeutral.Neutral90,fontWeight: FontWeight.w600,fontSize: 20),)
                    ],
                  )
                ],
            ),
             ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
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
                              style: (TextStyle(
                                  color: index == isSec
                                      ? Colors.white
                                      : Colors.red,
                                  fontSize: 12)),
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
                              "12 Ingredients | 40 min",
                              style: TextStyle(
                                  color: ColorsNeutral.Neutral0,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20))
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
