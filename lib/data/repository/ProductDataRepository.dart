import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/ProductDataModel.dart';
import 'package:flutter/services.dart' as rootBundle;

class ProductRepository {

  Future<List<ProductDataModel>>ReadJsonData() async{
     final jsondata = await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
     final list = json.decode(jsondata) as List<dynamic>;

     return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}