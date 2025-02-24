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
}
