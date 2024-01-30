import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uas_dart/views/add_shop_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Shop"),
      ),
      body: const Center(
        child: Text("Body"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddUserView()));
        },
        child: const Text("Tambah"),
      ),
    );
  }
}
