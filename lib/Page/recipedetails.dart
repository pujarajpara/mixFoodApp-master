import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mixfoodapp/Constants/Color.dart';
import 'package:mixfoodapp/Constants/model.dart';
import 'package:mixfoodapp/Page/saveIcon.dart';

import '../Constants/text.dart';

class recipede extends StatefulWidget {
  const recipede({Key? key}) : super(key: key);

  @override
  State<recipede> createState() => _recipedeState();
}

class _recipedeState extends State<recipede> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => saveIcon()));
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text(
              'How to make french toast',
              style: TextStyle(
                color: ColorsNeutral.Neutral90,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "Assets/image13.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(33),
              child: BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  height: 55,
                  width: 60,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 1),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0x4A303030)),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              const Icon(
                Icons.star_rate_rounded,
                color: Colors.amber,
                size: 20,
              ),
              Text(
                "4,5",
                style: TextStyle(
                    color: ColorsNeutral.Neutral90,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "(300 Reviews)",
                style: TextStyle(color: ColorsNeutral.Neutral40),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Row(
            children: [
              Image.asset(
                "Assets/frenchtoast.png",
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Roberta Anny",
                      style: TextStyle(
                          fontSize: 16,
                          color: ColorsNeutral.Neutral100,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 20,
                          ),
                          Text(
                            "Bali,Indonesia",
                            style: TextStyle(color: ColorsNeutral.Neutral40),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: const Center(
                    child: Text(
                  "Follow",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Text("Ingredients",
                  style: TextStyle(
                      color: ColorsNeutral.Neutral90,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(
                "5 items",
                style: TextStyle(color: ColorsNeutral.Neutral40, fontSize: 14),
              ),
            )
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: recipedetails.length,
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorsNeutral.Neutral20,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(recipedetails[index].ingredients),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          recipedetails[index].ingredientsname,
                          style: (TextStyle(
                              color: ColorsNeutral.Neutral90,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "200g",
                          style: (TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      )
                    ],
                  ),
                ),
                //),
              );
            })
      ]),
    );
  }
}
