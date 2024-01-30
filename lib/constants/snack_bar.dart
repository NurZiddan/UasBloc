import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void snackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
