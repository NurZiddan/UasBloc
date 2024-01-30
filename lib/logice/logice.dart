import 'dart:html';
import 'dart:js';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas_dart/service/service.dart';

abstract class LogicState {}

abstract class LogicEvent {}

class LogicInitializeState extends LogicState {}

class LogicErrorState extends LogicState {
  final String error;
  LogicErrorState({required this.error});
}

class LogicLoadingState extends LogicState {}

class AddMhsEvent extends LogicEvent {
  final int id;
  final String nim;
  final String nama;
  final String prodi;
  final int semester;

  AddMhsEvent(
      {required this.id,
      required this.nim,
      required this.nama,
      required this.prodi,
      required this.semester});
}

class AddMhsLoading extends LogicState {
  bool isLoading;
  AddMhsLoading({required this.isLoading});
}

class LogicalService extends Bloc<LogicEvent, LogicState> {
  final RestAPIService _service;
  LogicalService(this._service) : super(LogicInitializeState()) {
    on<AddMhsEvent>((event, emit) async {
      emit(AddMhsLoading(isLoading: true));
      await _service
          .addMhsService(
              event.id, event.nim, event.nama, event.prodi, event.semester)
          .then((value) {
        emit(AddMhsLoading(isLoading: false));
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pop(event.context);
        });
      }).onError((error, stackTrace) {
        emit(AddMhsLoading(isLoading: false));
      });
    });
  }
}
