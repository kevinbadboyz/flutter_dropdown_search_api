import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../response/user_response.dart';

class UserRepository{
  Future<UserResponse> searchUser() async{
    try{
      // final response = await Dio().get('https://5d85ccfb1e61af001471bf60.mockapi.io/user?name=${name}');
      // final response = await Dio().get('https://5d85ccfb1e61af001471bf60.mockapi.io/user', queryParameters: {'filter':name});
      final response = await Dio().get('https://5d85ccfb1e61af001471bf60.mockapi.io/user');
      // debugPrint('Response : ${response.data}');
      // if(response.data != null){
      //   return UserResponse.fromJson(response.data);
      // }
      return UserResponse.fromJson(response.data);
    }on DioError catch(e){
      throw Exception(e.toString());
    }
  }
}