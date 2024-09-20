import 'package:flutter/material.dart';

mixin DataElementActions{

  markElementSorted(){
    updateElementColor(Colors.deepOrangeAccent);
  }

  markElementSelected(){
    updateElementColor(Colors.deepPurpleAccent);
  }

  markElementNotSorted(){
    updateElementColor(Colors.grey);
  }

  void updateElementColor(Color color);
}