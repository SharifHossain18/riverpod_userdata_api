
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../Model/model.dart';

class ApiServices{
  String url="https://jsonplaceholder.typicode.com/users";

  getUsers() async{
    http.Response response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      print(response.body);
      final List result=jsonDecode(response.body);
      return result.map((e) => Data.fromJson(e)).toList();
    }

    else{
      throw Exception(response.contentLength);
    }
    
  }
}

final userProvider=Provider((ref) => ApiServices());