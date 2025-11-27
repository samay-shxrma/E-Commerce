import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  /// Adds user details to Firestore under the given document ID
  /// Returns true if successful, false otherwise
  Future<bool> addUserDetails(
    Map<String, dynamic> userInfoMap,
    String id,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(id) // Preferably use FirebaseAuth UID here
          .set(userInfoMap);
      print("User added successfully!");
      return true;
    } catch (e) {
      print("Error adding user: $e");
      return false;
    }
  }

  /// Optional: fetch user by ID
  Future<DocumentSnapshot?> getUserDetails(String id) async {
    try {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection("users").doc(id).get();
      return doc.exists ? doc : null;
    } catch (e) {
      print("Error fetching user: $e");
      return null;
    }
  }

  /// Returns true if successful, false otherwise
  Future<bool> addProduct(
    Map<String, dynamic> userInfoMap,
    String categoryname,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection(categoryname)
          .add(userInfoMap);

      print("Product Image Added successfully!");
      return true;
    } catch (e) {
      print("Error adding product Image: $e");
      return false;
    }
  }

  Future<Stream<QuerySnapshot>> getProducts(String category)async{
    return await FirebaseFirestore.instance.collection(category).snapshots();
  }
}
