import 'dart:convert';
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class Models {
  String freslist;
  String txt;
  String time;
  String title;
  String image1;
  String ramen;
  String poppuler1;
  String recentre1;
  String make;
  String burger;
  String recentmake1;
  String poppulerpers;
  String Poppulername;
  String savev1;

  Models({
    required this.freslist,
    required this.txt,
    required this.time,
    required this.title,
    required this.image1,
    required this.ramen,
    required this.poppuler1,
    required this.recentre1,
    required this.make,
    required this.burger,
    required this.recentmake1,
    required this.poppulerpers,
    required this.Poppulername,
    required this.savev1,
  });
}

List<Models> listmodels = [
  Models(
    freslist: 'Assets/videorecipe1.png',
    txt: '4.5',
    time: '15:10',
    title: 'How to make sushi at home',
    image1: 'Assets/unsplas.png',
    ramen: 'Assets/populer1.png',
    poppuler1: 'Pepper sweetcorn \nramen',
    recentre1: '',
    make: 'By Niki Samantha',
    burger: 'Indonesian \nchicken burger',
    recentmake1: 'By Adriannna Curl',
    poppulerpers: '',
    Poppulername: '',
    savev1: '',
  ),
  Models(
    freslist: 'Assets/video5.png',
    image1: 'Assets/unsplash1.png',
    txt: '4.5',
    time: '15:10',
    title: ' mack sandwich',
    ramen: 'Assets/populer2.png',
    poppuler1: 'cheddar cheese \n and shell salad',
    recentre1: '',
    make: 'By Troyan Smith',
    burger: 'Home made \ncute pancake,',
    recentmake1: 'By James Wolden',
    poppulerpers: '',
    Poppulername: '',
    savev1: '',
  ),
];
List<Models> listmodel2 = [
  Models(
    freslist: '',
    image1: '',
    txt: '',
    time: '',
    title: ' ',
    ramen: '',
    poppuler1: '',
    recentre1: 'Assets/recent_recipe1.png',
    make: 'By Troyan Smith',
    burger: 'Indonesian \nchicken burger',
    recentmake1: 'By Adrianna Curl',
    poppulerpers: 'Assets/Avatar1.png',
    Poppulername: 'Trayan \nSmaith',
    savev1: 'Assets/savevide1.png',
  ),
  Models(
    freslist: '',
    image1: '',
    txt: '',
    time: '',
    title: ' ',
    ramen: '',
    poppuler1: '',
    recentre1: 'Assets/recent_recipe2.png',
    make: 'By Troyan Smith',
    burger: 'Home made \ncute pancake',
    recentmake1: 'By James Wolden',
    poppulerpers: 'Assets/Avatar2.png',
    Poppulername: 'James \nWolden',
    savev1: 'Assets/savevideo2.png',
  ),
  Models(
    freslist: '',
    image1: '',
    txt: '',
    time: '',
    title: '',
    ramen: '',
    poppuler1: '',
    recentre1: 'Assets/recent_recipe3.png',
    make: 'By Troyan Smith',
    burger: 'How to make \nseafood friend friend',
    recentmake1: 'By Roberta Anny',
    poppulerpers: 'Assets/Avatar3.png',
    Poppulername: 'Niki \nSamantha',
    savev1: '',
  ),
];

class Model {
  String saverecipe;
  String duration;
  String bookmark;
  String text;
  String playbutton;
  String saveretitle;
  String unsplash1;
  String devlop;

  Model({
    required this.saverecipe,
    required this.duration,
    required this.bookmark,
    required this.text,
    required this.playbutton,
    required this.saveretitle,
    required this.unsplash1,
    required this.devlop,
  });
}

List<Model> savere = [
  Model(
    saverecipe: 'Assets/videorecipe1.png',
    duration: '15:10',
    bookmark: 'Assets/Bookmark.png',
    text: '5.0',
    playbutton: 'Assets/Playbutton1.png',
    saveretitle: 'How to make sushi at home',
    unsplash1: 'Assets/unsplash1.png',
    devlop: 'By robeera anny',
  ),
  Model(
      saverecipe: 'Assets/videorecipe2.png',
      bookmark: 'Assets/Bookmark.png',
      duration: '15:10',
      playbutton: 'Assets/Playbutton1.png',
      text: '4.5',
      saveretitle: 'How to make french toast',
      unsplash1: 'Assets/unsplash2.png',
      devlop: 'By Niki Samaratha'),
  Model(
    saverecipe: 'Assets/videorecipe3.png',
    bookmark: 'Assets/Bookmark.png',
    duration: '15:10',
    playbutton: 'Assets/Playbutton1.png',
    text: '4.9',
    saveretitle: ' Easy oatmeal recipe',
    unsplash1: 'Assets/unsplash3.png',
    devlop: 'By james  Wolden',
  ),
];

class Model1 {
  Model1({
    required this.ingredients,
    required this.ingredientsname,
  });
  String ingredients;
  String ingredientsname;
}

List<Model1> recipedetails = [
  Model1(ingredients: 'Assets/ingredients1.png', ingredientsname: 'Bread'),
  Model1(ingredients: 'Assets/ingre2.png', ingredientsname: 'Eggs'),
  Model1(ingredients: 'Assets/ingredients1.png', ingredientsname: 'Milk'),
  Model1(ingredients: 'Assets/ingre2.png', ingredientsname: 'Butter'),
  Model1(ingredients: 'Assets/ingredients1.png', ingredientsname: 'Vanila')
];

class Model2 {
  Model2({
    required this.my1,
    required this.recipename,
    required this.rating,
  });
  String my1;
  String recipename;
  String rating;
}

List<Model2> myprofileinf = [
  Model2(
      my1: 'Assets/v1.png',
      rating: '5.0',
      recipename: 'How to make Italian \nSpaghetti at home'),
  Model2(
    my1: 'Assets/v2.png',
    recipename: 'Simple chicken meal \n prep dishes ',
    rating: '4.7',
  ),
  Model2(
    my1: 'Assets/v3.png',
    recipename: 'Japanese fried rice',
    rating: '4.7',
  ),
];

class Model3 {
  Model3({
    required this.my1,
    required this.time,
    required this.saladname,
    required this.breafast,
    required this.appetizer,
    required this.noodles,
  });
  String my1;
  String time;
  String saladname;
  String breafast;
  String appetizer;
  String noodles;
}

List<Model3> salad = [
  Model3(
      my1: 'Assets/salad1.png',
      time: '10 Mins',
      saladname: 'Pepeer sweetcorn \nramen ',
      breafast: 'Assets/breakfast2.png',
      appetizer: 'Assets/pasta.png',
      noodles: 'Assets/noodles1.png'),
  Model3(
    my1: 'Assets/salad1.png',
    time: '10 Mins',
    saladname: 'Cheddar cheese \nand shell salad',
    breafast: 'Assets/breakfast2.png',
    appetizer: 'Assets/pasta.png',
    noodles: 'Assets/noodles1.png',
  ),
  Model3(
    my1: 'Assets/salad1.png',
    time: '10 Mins',
    saladname: 'Pepper sweetcorn \nramen1',
    breafast: 'Assets/breakfast2.png',
    appetizer: 'Assets/pasta.png',
    noodles: 'Assets/noodles1.png',
  )
];



class ModelAddSaveRe {
  ModelAddSaveRe( {
    required this.saveretitle,
    required this.devlop,
  });

  factory ModelAddSaveRe.fromJson(Map<String, dynamic> json) =>
      ModelAddSaveRe(
        saveretitle: json['savTitle'] as String,
        devlop: json['devlop'] as String,
      );
  String saveretitle;
  String devlop;

  Map<String, dynamic> toJson() =>
      {
        'savTitle': saveretitle,
        'devlop': devlop,
      };


}