import 'package:blinqpay/models/post_models.dart';
import 'package:blinqpay/models/user_model.dart';
import 'package:blinqpay/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeCtr extends GetxController {
  final db = FirebaseFirestore.instance;
  var allPost = <PostModels>[].obs;
  var allUsers = <UserModel>[].obs;
  var filteredUsers = <UserModel>[].obs;
  var isLoading = false.obs;

  getAllPost() async {
    isLoading.value = true;
    try {
      allPost.clear();
      var data = await db.collection(postCollection).get();
      var posts =
          data.docs.map((data) => PostModels.fromJson(data.data())).toList();
      allPost.assignAll(posts);
    } catch (e) {}
    isLoading.value = false;
  }

  getAllUsers() async {
    var data = await db.collection(userCollection).get();
    var users =
        data.docs.map((data) => UserModel.fromJson(data.data())).toList();
    allUsers.assignAll(users);
    filteredUsers.assignAll(users);
  }

  searchUsers(String query) {
    if (query.isEmpty) {
      return filteredUsers.assignAll(allUsers);
    } else {
      return filteredUsers.assignAll(allUsers
          .where((user) =>
              user.username.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
  }

  @override
  void onInit() {
    getAllPost();
    getAllUsers();
    super.onInit();
  }
}
