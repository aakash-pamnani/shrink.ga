import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class GenerateUrl {
  static String url = "http://shrink.ga/";

  static CollectionReference urls = FirebaseFirestore.instance
      .collection('users')
      .doc("default-user")
      .collection("urls");
  static void initializeFirebase() async {
    await Firebase.initializeApp();
  }

  static Future<Map<String, dynamic>> generateShortUrl(
      String longUrl, String customUrl) async {
    Map<String, dynamic> returnVal = {};
    await urls.doc(customUrl).set({"longUrl": longUrl, "shortUrl": customUrl},
        SetOptions(merge: true)).then((value) {
      print("Url added");
      returnVal = {"shortUrl": url+customUrl};
    }).catchError((error) {
      print("Failed to add user: $error");

      returnVal = {"error": "sommethingWentWrong"};
    });

    // var data = await urls.get().then((value) => print(value.));
    // print("data is "+data);
    // print(data.get("www.google.com"));

    return returnVal;
  }

  static Future<bool> ifCustomUrlAlreadyExists(String customUrl) async {
    String? response = await getLongUrl(customUrl);
    if (response != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String?> getLongUrl(String shortUrl) async {
    DocumentSnapshot url = await (urls.doc(shortUrl).get());
    var responseData = url.data();
    if (responseData == null) {
      return null;
    } else {
      String response = (url.data() as Map)["longUrl"];
      return response;
    }
  }
}
