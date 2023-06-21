import 'package:flutter/material.dart';
import 'package:mixfoodapp/Constants/model.dart';
import 'package:mixfoodapp/Page/persondetails.dart';
import 'package:mixfoodapp/Page/saverecipe.dart';

import 'createrecipe.dart';
import 'notification.dart';
import 'home.dart';

class Bottomtabbar extends StatefulWidget {
  const Bottomtabbar({Key? key}) : super(key: key);

  @override
  State<Bottomtabbar> createState() => _BottomtabbarState();
}

class _BottomtabbarState extends State<Bottomtabbar> {
  int currentTab = 0;
  final screens = [
    const Home(),
    const saveIcon(),
    const notification(),
    const person(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const createrecipe()));
          },
          backgroundColor: Colors.red,
          child: const Icon(
            Icons.add,
          )),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 70,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Home();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab == 0 ? Colors.red : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = screens[1];
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.save,
                            color: currentTab == 1 ? Colors.red : Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = screens[2];
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications,
                            color: currentTab == 2 ? Colors.red : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = screens[3];
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: currentTab == 3 ? Colors.red : Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
