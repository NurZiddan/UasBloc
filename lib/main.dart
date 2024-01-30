import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas_dart/logice/logice.dart';
import 'package:uas_dart/service/service.dart';
import 'package:uas_dart/views/home_view.dart';

void main() {
  RestAPIService service = RestAPIService();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<LogicalService>(create: (context) => LogicalService(service))
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    ),
  ));
}
