import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas_dart/constants/snack_bar.dart';
import 'package:uas_dart/logice/logice.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({super.key});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  final TextEditingController _nim = TextEditingController();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _prodi = TextEditingController();
  final TextEditingController _semester = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nim.dispose();
    _nama.dispose();
    _prodi.dispose();
    _semester.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Mahasiswa"),
      ),
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: _nim,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "nim"),
        ),
        TextField(
          controller: _nama,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "nama"),
        ),
        TextField(
          controller: _prodi,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "prodi"),
        ),
        TextField(
          controller: _semester,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "Semester"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () {
            if (_nim.text.isEmpty) {
              snackBar(context, "Masukkan NIM Mahasiswa");
            } else if (_deskripsi.text.isEmpty) {
              snackBar(context, "Masukkan Nama Mahasiswa");
            } else if (_harga.text.isEmpty) {
              snackBar(context, "Masukkan Prodi");
            } else if (_gambar.text.isEmpty) {
              snackBar(context, "Masukkan Semester");
            } else {
              context.read<LogicalService>().add(AddShopEvent(
                  id: _id.text,
                  nim: _nim.text,
                  nama: _nama.text,
                  prodi: _prodi.text,
                  semester: _semester.text));
            }
          },
          child: BlocBuilder<LogicalService, LogicState>(
            builder: (context, state) {
              if (state is AddShopLoading) {
                bool isLoading = state.isLoading;
                return isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text("Add Mahasiswa");
              } else {
                return const Text("Tambah");
              }
            },
          ),
        ),
      ],
    );
  }
}
