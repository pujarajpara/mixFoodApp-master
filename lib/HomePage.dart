import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mixfoodapp/Constants/Color.dart';
import 'package:mixfoodapp/Page/Bottombar.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height / 1,
                  width: size.width / 1,
                  child: Image.asset(
                    'Assets/image 1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 77,
                    left: 80,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          "60K + Premimum recipes",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Text(
                    "Let's ",
                    style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 340),
                  child: Text(
                    "Cooking",
                    style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 540),
                  child: Text(
                    "Find best recipes for cooking",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 650),
                  child: Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorsPrimary.Primary50),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Bottomtabbar()),
                          (route) => false,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Start Cooking',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    //  ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
