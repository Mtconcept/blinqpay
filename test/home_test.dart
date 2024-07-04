import 'package:blinqpay/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group("searchUsers", () {
    List<UserModel> allUsers = <UserModel>[];
    List<UserModel> filteredUsers = <UserModel>[];

    void searchUsers(
        String query, List<UserModel> allUsers, List<UserModel> filteredUsers) {
      if (query.isEmpty) {
        filteredUsers.assignAll(allUsers);
      } else {
        filteredUsers.assignAll(allUsers
            .where((user) =>
                user.username.toLowerCase().contains(query.toLowerCase()))
            .toList());
      }
    }

    var userData = [
      UserModel(
          bio: "This is my profile",
          photo: 'url here',
          name: "Tayo",
          username: "Tee1",
          userId: "1"),
      UserModel(
          bio: "This is my profile",
          photo: 'url here',
          name: "Femi",
          username: "Tee2",
          userId: "2"),
      UserModel(
          bio: "This is my profile",
          photo: 'url here',
          name: "Ola",
          username: "Tee3",
          userId: "123"),
      UserModel(
          bio: "This is my profile",
          photo: 'url here',
          name: "Titi",
          username: "Tee4",
          userId: "1234")
    ];
    setUp(() {
      allUsers.assignAll(userData);
      filteredUsers = <UserModel>[];
    });

    test("returns all users when query is empty", () {
      searchUsers('', allUsers, filteredUsers);
      expect(filteredUsers.length, allUsers.length);
      expect(filteredUsers, allUsers);
    });

    test('filters users based on query', () {
      searchUsers('a', allUsers, filteredUsers);
      expect(allUsers.length, 4);
      expect(allUsers[0].name, 'Tayo');
      expect(allUsers[2].name, 'Ola');
    });

    test('returns no users if no match is found', () {
      searchUsers('z', allUsers, filteredUsers);
      expect(filteredUsers.isEmpty, true);
    });
  });
}
