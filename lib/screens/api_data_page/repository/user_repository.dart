import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uip_tv_app/screens/api_data_page/models/user_model.dart';

class UserRepository {
  Future<List<UserListModel>> fetchUserData() async {
    final dio = Dio();
    final response =
        await dio.get<String>('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      return userListModelFromJson(response.data ?? '');
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<UserListModel> fetchSingleUserData() async {
    final dio = Dio();
    try {
      final response =
          await dio.get<String>('https://jsonplaceholder.typicode.com/users/1');
      if (response.statusCode == 200) {
        return UserListModel.fromJson(json.decode(response.data ?? ''));
      } else {
        throw Exception('Failed to load single user');
      }
    } on Exception catch (e) {
      throw Exception('Failed to load single user');
    }
  }
}
