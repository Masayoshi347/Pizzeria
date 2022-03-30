import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionItem {
  final int value;
  final String name;
  final int supplement;

  OptionItem(this.value, this.name, {this.supplement = 0});
}

