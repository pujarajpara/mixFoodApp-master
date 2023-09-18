import 'package:flutter/material.dart';
import 'package:mixfoodapp/Constants/model.dart';
import 'package:mixfoodapp/Page/createrecipe.dart';
import 'package:mixfoodapp/Page/home.dart';
import 'package:mixfoodapp/Page/notification.dart';
import 'package:mixfoodapp/Page/persondetails.dart';
import 'package:mixfoodapp/Page/saverecipe.dart';

class Bottomtabbar extends StatefulWidget {
  // final List<IngredientModel> ingre;
  Bottomtabbar({
    // required this.ingre,
    super.key,
  });

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
    return WillPopScope(
      onWillPop: () async {
        final myPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Do you want to go back',
                style: TextStyle(fontSize: 20),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text(
                    'Yex',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            );
          },
        );
        return myPop!;
      },
      child: Scaffold(
          body: currentScreen,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const createrecipe(
                    ingre: [],
                  ),
                ),
              );
            },
            backgroundColor: Colors.red,
            child: const Icon(
              Icons.add,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Builder(builder: (context) {
              return SizedBox(
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
                                color:
                                    currentTab == 0 ? Colors.red : Colors.grey,
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
                                color:
                                    currentTab == 1 ? Colors.red : Colors.grey,
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
                                color:
                                    currentTab == 2 ? Colors.red : Colors.grey,
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
                                color:
                                    currentTab == 3 ? Colors.red : Colors.grey,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }),
          )),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mixfoodapp/Page/createrecipe.dart';
// import 'package:mixfoodapp/Page/home.dart';
// import 'package:mixfoodapp/Page/notification.dart';
// import 'package:mixfoodapp/Page/persondetails.dart';
// import 'package:mixfoodapp/Page/saverecipe.dart';
//
// import '../Constants/model.dart';
//
// class Bottomtabbar extends StatefulWidget {
//   // final IngredientModel dataModel;
//   const Bottomtabbar({
//     super.key,
//   });
//
//   @override
//   State<Bottomtabbar> createState() => _BottomtabbarState();
// }
//
// class _BottomtabbarState extends State<Bottomtabbar> {
//   int currentTab = 0;
//   final screens = [
//     Home(),
//     const saveIcon(),
//     const notification(),
//     const person(),
//   ];
//   final PageStorageBucket bucket = PageStorageBucket();
//   Widget currentScreen = Home();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: currentScreen,
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>  createrecipe(
//                     ),
//               ),
//             );
//           },
//           backgroundColor: Colors.red,
//           child: const Icon(
//             Icons.add,
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: BottomAppBar(
//           shape: const CircularNotchedRectangle(),
//           notchMargin: 4,
//           child: SizedBox(
//             height: 60,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MaterialButton(
//                       minWidth: 70,
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = Home(
//                               // dataModel: '',
//                               //updata: (IngredientModel) {},
//                               );
//                           currentTab = 0;
//                         });
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.home,
//                             color: currentTab == 0 ? Colors.red : Colors.grey,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 25,
//                     ),
//                     MaterialButton(
//                       minWidth: 40,
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = screens[1];
//                           currentTab = 1;
//                         });
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.save,
//                             color: currentTab == 1 ? Colors.red : Colors.grey,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MaterialButton(
//                       minWidth: 40,
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = screens[2];
//                           currentTab = 2;
//                         });
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.notifications,
//                             color: currentTab == 2 ? Colors.red : Colors.grey,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 40,
//                     ),
//                     MaterialButton(
//                       minWidth: 40,
//                       onPressed: () {
//                         setState(() {
//                           currentScreen = screens[3];
//                           currentTab = 3;
//                         });
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.person,
//                             color: currentTab == 3 ? Colors.red : Colors.grey,
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
