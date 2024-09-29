import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import '../ModelClass/api_model.dart';

class MainProvider extends ChangeNotifier{


  bool page1=true;
  bool livingBool=true;
  bool bedBool=true;
  bool customBool=true;




  void changeScreen(){
    page1=!page1;
    notifyListeners();
  }
  void popFunction(){
    page1=true;
    notifyListeners();
  }

  void changeLiving(){
    livingBool=!livingBool;
    notifyListeners();
  }

  void changeBedRoom(){
    bedBool=!bedBool;
    notifyListeners();
  }

  void changeCustom(){
    customBool=!customBool;
    notifyListeners();
  }


  /// api functions


  // API URL
  final String apiUrl = "http://test.api.boxigo.in/sample-data/";
  Purchase? _purchase;
  bool _isLoading = false;
  String? _error;

  Purchase? get purchase => _purchase;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchPurchaseData() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        _purchase = purchaseFromJson(response.body);
      } else {
        _error = 'Failed to load purchase data';
      }
    } catch (e) {
      _error = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }





}