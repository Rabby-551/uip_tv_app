import 'package:hive/hive.dart';

part 'user_dao.g.dart'; // This will be generated

@HiveType(typeId: 0)
class UserListDaoModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String username;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final AddressDao address;

  @HiveField(5)
  final String phone;

  @HiveField(6)
  final String website;

  @HiveField(7)
  final CompanyDao company;

  UserListDaoModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
}

@HiveType(typeId: 1)
class AddressDao {
  @HiveField(0)
  final String street;

  @HiveField(1)
  final String suite;

  @HiveField(2)
  final String city;

  @HiveField(3)
  final String zipcode;

  AddressDao({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });
}

@HiveType(typeId: 3)
class CompanyDao {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String catchPhrase;

  @HiveField(2)
  final String bs;

  CompanyDao({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
}
