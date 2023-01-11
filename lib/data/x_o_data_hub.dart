import 'package:flutter/material.dart';
import 'package:tic_tac_toe/data/x_o_database.dart';
import 'package:tic_tac_toe/data/x_o_model.dart';

class XOModelData extends ChangeNotifier {
  XODATABASE db = XODATABASE();
  bool _isLoading = true;
  bool isLoaded = false;
  String selectedSide = '';
  List<XOModel> _xoDataList = [];

  List<XOModel> get xoDataList => _xoDataList;

  bool get isLoading => _isLoading;

  Future loadXODataList() async {
    _isLoading = true;
    notifyListeners();
    _xoDataList = await db.getTasks();
    _isLoading = false;
    notifyListeners();
  }

  void loader() {
    isLoaded = true;
    notifyListeners();
  }

  void choosedSide(selected) {
    selectedSide = selected;
    notifyListeners();
  }

  Future addXODataList(XOModel task) async {
    await db.insertTask(task);
    await loadXODataList();
    notifyListeners();
  }

  Future updateXODataList(XOModel task) async {
    await db.updateTaskList(task);
    await loadXODataList();
    notifyListeners();
  }

  Future deleteXODataList() async {
    await db.deleteTask();
    await loadXODataList();
    notifyListeners();
  }
}
