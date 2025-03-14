import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uip_tv_app/screens/api_data_page/models/user_model.dart';
import 'package:uip_tv_app/screens/landing.dart';
import 'screens/cache_data_page/models/user_dao.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveManager().initHive();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}

class HiveManager {
  static final HiveManager _instance = HiveManager._internal();

  factory HiveManager() {
    return _instance;
  }

  HiveManager._internal();

  late Box<UserListDaoModel> _userBox;

  /// Initialize Hive and open the box (Call this in `main.dart`)
  Future<void> initHive() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(UserListDaoModelAdapter());
    Hive.registerAdapter(AddressDaoAdapter());
    Hive.registerAdapter(CompanyDaoAdapter());

    // Open the box only if it's not already open
    if (!Hive.isBoxOpen('userBox')) {
      _userBox = await Hive.openBox<UserListDaoModel>('userBox');
    } else {
      _userBox = Hive.box<UserListDaoModel>('userBox');
    }
  }

  /// Get the User box
  Box<UserListDaoModel> get userBox => _userBox;

  /// Save a user model to Hive
  Future<void> saveUser(UserListModel user) async {
    final userModel = UserListDaoModel(
        id: user.id,
        name: user.name,
        username: user.username,
        email: user.email,
        address: AddressDao(
          street: user.address.street,
          suite: user.address.suite,
          city: user.address.city,
          zipcode: user.address.zipcode,
        ),
        phone: user.phone,
        website: user.website,
        company: CompanyDao(
            name: user.company.name,
            catchPhrase: user.company.catchPhrase,
            bs: user.company.bs));
    await _userBox.put('user', userModel);
  }

  /// Retrieve a stored user
  UserListModel? getUser() {
    final daoModel = _userBox.get('user');
    return UserListModel(
        id: daoModel!.id,
        name: daoModel.name,
        username: daoModel.username,
        email: daoModel.email,
        address: Address(
            street: daoModel.address.street,
            suite: daoModel.address.suite,
            city: daoModel.address.city,
            zipcode: daoModel.address.zipcode),
        phone: daoModel.phone,
        website: daoModel.website,
        company: Company(
            name: daoModel.company.name,
            catchPhrase: daoModel.company.catchPhrase,
            bs: daoModel.company.bs));
  }

  /// Delete the stored user
  Future<void> deleteUser() async {
    await _userBox.delete('user');
  }

  /// Close the Hive Box (Call this when the app is closing)
  Future<void> closeHive() async {
    await _userBox.close();
  }
}
