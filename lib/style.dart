import 'package:flutter/material.dart';


//Importing to other files can potentially be screwy if the variable names ar ethe same
//underbar before variables so that they become class-private

var _var1;

var theme = ThemeData(
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 1,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 25), //now every text in app bar i see.
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black
    ),
    );
