import 'dart:convert';


import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:mixfoodapp/Constants/Color.dart';
import 'package:mixfoodapp/Constants/model.dart';
import 'package:mixfoodapp/Constants/text.dart';
import 'package:mixfoodapp/Page/home.dart';
import 'package:mixfoodapp/Page/persondetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<ModelAddSaveRe> list = [];
final List<ModelAddSaveRe> itemList = [];

class IngredientModel {
  String type;
  String qty;

  IngredientModel({required this.qty, required this.type});
}

class createrecipe extends StatefulWidget {
  const createrecipe({Key? key}) : super(key: key);

  @override
  State<createrecipe> createState() => _createrecipeState();
}

class _createrecipeState extends State<createrecipe> {
  int isSec = 0;
  List<IngredientModel> ingredient = [IngredientModel(qty: '', type: '')];

  void addEmptyIngredient() {
    setState(() {
      ingredient.add(IngredientModel(qty: '', type: ''));
    });
  }

  void removeIngredient(int index) {
    setState(() {
      ingredient.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Create recipe',
              style: TextStyle(
                color: ColorsNeutral.Neutral90,
                fontWeight: FontWeight.bold,
                fontSize: 24,
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
                      'Assets/createrecipeimage.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(33),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3.0),
                  child: Container(
                    height: 65,
                    width: 65,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0x4A303030),
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 42,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 30,
                top: 30,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 30,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: ' Bento lunch box ideas for work',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorsNeutral.Neutral20,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset('Assets/Serves.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Server',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: Text(
                    '01',
                    style:
                        TextStyle(fontSize: 14, color: ColorsNeutral.Neutral40),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorsNeutral.Neutral20,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset('Assets/cooktimeicon.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Cook time',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: Text(
                    '45 min',
                    style:
                        TextStyle(fontSize: 14, color: ColorsNeutral.Neutral40),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12),
            child: Text(
              'Ingredients',
              style: TextStyle(
                  fontSize: 20,
                  color: ColorsNeutral.Neutral100,
                  fontWeight: FontWeight.w600),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ingredient.length,
              itemBuilder: (context, index) {
                return IngredientModule(
                  key: UniqueKey(),
                  ingredientModel: ingredient[index],
                  index: index,
                  remove: removeIngredient,
                );
              }),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: addEmptyIngredient,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '+ Add Ingredient',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
          //   child: InkWell(
          //     onTap: () {
          //       final inputText1 = qtyTxt.text;
          //       final inputText2 = typeTxt.text;
          //       saveData(inputText1, inputText2);
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => const Home()));
          //
          //       // SharedPreferences sharedPrefrences =
          //       //     await SharedPreferences.getInstance();
          //       // sharedPrefrences.setString('qty', qtyTxt.text);
          //       // sharedPrefrences.setString('type', typeTxt.text);
          //       //
          //       // Navigator.push(
          //       //     context, MaterialPageRoute(builder: (context) => home()));
          //     },
          //     child: Container(
          //       height: 54,
          //       width: 335,
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          //       decoration: const BoxDecoration(
          //         color: Colors.red,
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(10.0),
          //         ),
          //       ),
          //       child: const Center(
          //         child: Text(
          //           "Save my recipes",
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 16,
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}



class IngredientModule extends StatefulWidget {
  const IngredientModule({
    super.key,
    required this.ingredientModel,
    required this.remove,
    required this.index,
  });

  final int index;
  final IngredientModel ingredientModel;
  final void Function(int index) remove;

  @override
  State<IngredientModule> createState() => _IngredientModuleState();
}

class _IngredientModuleState extends State<IngredientModule> {
  TextEditingController typeTxtController = TextEditingController();
  TextEditingController qtyTxtController = TextEditingController();


  // @override
  // void initState() {
  //   typeTxtController = TextEditingController();
  //   qtyTxtController = TextEditingController();
  //   super.initState();
  // }

  // Future<void> _saveData() async {
  //   var qty = qtyTxtController.text;
  //   var type = typeTxtController.text;
  //   var userData = ModelAddSaveRe(
  //       saveretitle: qtyTxtController.text, devlop: typeTxtController.text);
  //   await MySharedPreferencesHelper.saveUserData('abc', userData);
  //   print(userData);
  //   await Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  // }

  // @override
  // void dispose() {
  //   qtyTxtController.dispose();
  //   typeTxtController.dispose();
  //   super.dispose();
  // }
  // void _saveData() async {
  //   String type = typeTxtController.text;
  //   String qty =qtyTxtController.text;
  //   final ModelAddSaveRe modelAddSaveRe=ModelAddSaveRe(saveretitle: qty, devlop:type);
  //  await SharedPreferencesHelper('modelAddSaveRe', modelAddSaveRe);
  //  }

  // @override
  // void initState() {
  //   super.initState();
  //   typeTxt.text = widget.ingredientModel.type;
  //   qtyTxt.text = widget.ingredientModel.qty;
  // }

  // Future<void> saveData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final addRec =
  //       ModelAddSaveRe(saveretitle: qtyTxt.text, devlop: typeTxt.text);
  //   setState(() {
  //     list.add(addRec);
  //   });
  //   await prefs.setString('listA', jsonEncode(list));
  //   print(addRec);
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const Home(),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () async {
                final pref = await SharedPreferences.getInstance();
                final data = qtyTxtController.text;
                final data1 = typeTxtController.text;
                final data2 = jsonEncode({'data': data, 'data1': data1});
                await pref.setString('data2', data2);
                print(data2);

                await Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
                // final data = qtyTxtController.text;
                // final data1 = typeTxtController.text;
                // final filed = {
                //   'data': data,
                //   'data1': data1,
                // };
                // final jsonData = jsonEncode(filed);
                // await MySharedPreferences.saveData('filed', jsonData);
                // await Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Home()));
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: true ? Colors.blueGrey : Colors.grey,
                ),
                child: const Text(
                  '+',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: TextFormField(
                controller: qtyTxtController,
                maxLines: 1,
                onChanged: (value) {
                  setState(() {
                    widget.ingredientModel.qty = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    'part 1',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: ColorsNeutral.Neutral90),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 40),
              child: TextFormField(
                controller: typeTxtController,
                maxLines: 1,
                onChanged: (value) {
                  setState(() {
                    widget.ingredientModel.type = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    'part 2',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorsNeutral.Neutral90,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          if (widget.ingredientModel.qty.isNotEmpty ||
              widget.ingredientModel.type.isNotEmpty)
            InkWell(
              onTap: () {
                setState(() {
                  widget.remove(widget.index);
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: true ? Colors.blueGrey : Colors.grey,
                  ),
                  child: const Text(
                    '-',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
