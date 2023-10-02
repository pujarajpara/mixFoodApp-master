import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mixfoodapp/Constants/Color.dart';
import 'package:mixfoodapp/Constants/model.dart';
import 'package:mixfoodapp/Page/Bottombar.dart';
import 'package:mixfoodapp/controller/lan_change_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class createrecipe extends StatefulWidget {
  final List<IngredientModel> ingre;


  const createrecipe({
    super.key,
    required this.ingre,
  });

  @override
  State<createrecipe> createState() => _createrecipeState();
}

class _createrecipeState extends State<createrecipe> {
  File? imageFile;
  Future<void> _getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);

    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    } else {
      print('No image selected.');
    }
  }

  String selectedImagePath = '';

  Future<void> Save() async {
    if (imageFile != null) {
      print('Selected image path: ${imageFile!.path}');
    }
    await _onSaveButtonClick(ingredientList);
  }

  Future<void> _showImageSourceModal(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Image.asset('Assets/camera Icon.png'),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _getImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Image.asset('Assets/gallery Icon.png'),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _getImage(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }

  int isSec = 0;
  List<IngredientModel> ingredientList = [];

  void addEmptyIngredient() {
    setState(() {
      ingredientList.add(IngredientModel(qty: '', type: ''));
    });
  }

  void onIngredientDataChanged(String qty, String type, int index) {
    setState(() {
      ingredientList[index].qty = qty;
      ingredientList[index].type = type;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _onSaveButtonClick(List<IngredientModel> ingredientList) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('data');
    final jsonData =
        jsonEncode(ingredientList.map((item) => item.toJson()).toList());
    await prefs.setString('data', jsonData);
    log(jsonData);

    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Bottomtabbar(),
      ),
      (route) => false,
    );
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString('data');
    if (jsonData != null) {
      final data = jsonDecode(jsonData) as List;
      setState(() {
        ingredientList = data
            .map((item) =>
                IngredientModel.fromJson(item as Map<String, dynamic>))
            .toList();
      });
    }
  }

  void removeIngredient(int index) {
    setState(() {
      ingredientList.removeAt(index);
    });
  }


  void updateIngredient(int index, IngredientModel newIngredient) {
    setState(() {
      ingredientList[index] = newIngredient;
    });
  }

  @override
  Widget build(BuildContext context) {
    final createprovider=Provider.of<LanguageChangeControllerProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () async {},
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
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                AppLocalizations.of(context)!.createrecipe,
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
                    child: imageFile != null
                        ? Image.file(
                            imageFile!,
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            'Assets/createrecipeimage.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(33),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
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
                  child: DecoratedBox(
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
                        onPressed: () async {
                          await _showImageSourceModal(context);
                        },
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
                  hintText:
                      AppLocalizations.of(context)!.bentolunchboxidesforwork,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      AppLocalizations.of(context)!.server,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Text(
                      '01',
                      style: TextStyle(
                          fontSize: 14, color: ColorsNeutral.Neutral40),
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
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      AppLocalizations.of(context)!.cooktime,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Text(
                      '45 min',
                      style: TextStyle(
                          fontSize: 14, color: ColorsNeutral.Neutral40),
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
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ingredientList.length,
              itemBuilder: (BuildContext context, int index) {
                return IngredientModule(
                  key: UniqueKey(),
                  ingredientModel: ingredientList[index],
                  index: index,
                  remove: removeIngredient,
                  updateIngredient: (newIngredient) {
                    updateIngredient(index, newIngredient);
                  },
                  ingredientList: '',
                );
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: addEmptyIngredient,
                    child:  Text(
                      AppLocalizations.of(context)!.addnewIngredients,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: Save,
                child: Container(
                  height: 54,
                  width: 335,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child:  Center(
                    child: Text(
                      AppLocalizations.of(context)!.savemyrecipes,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    // if (croppedFile != null) {
    //   imageCache.clear();
    //   setState(() {
    //     imageFile = File(croppedFile.path);
    //   });
    // }
  }
}

class IngredientModule extends StatefulWidget {
  IngredientModule({
    required this.ingredientModel,
    required this.remove,
    required this.index,
    Key? key,
    required ingredientList,
    required this.updateIngredient,
  }) : super(key: key);

  final int index;
  final IngredientModel ingredientModel;
  final void Function(int index) remove;
  final Function(IngredientModel) updateIngredient;

  @override
  State<IngredientModule> createState() => _IngredientModuleState();
}

class _IngredientModuleState extends State<IngredientModule> {
  late TextEditingController typeTxtController;
  late TextEditingController qtyTxtController;

  @override
  void initState() {
    super.initState();
    qtyTxtController = TextEditingController(text: widget.ingredientModel.qty);
    typeTxtController =
        TextEditingController(text: widget.ingredientModel.type);
  }

  @override
  void dispose() {
    qtyTxtController.clear();
    typeTxtController.clear();
    super.dispose();
  }

  void _updateIngredient() {
    final newIngredient = IngredientModel(
      qty: qtyTxtController.text,
      type: typeTxtController.text,
    );
    widget.updateIngredient(newIngredient);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
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
                setState(
                  () {
                    widget.remove(widget.index);
                  },
                );
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
