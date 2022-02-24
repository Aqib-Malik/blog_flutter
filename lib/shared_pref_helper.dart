import 'package:blog_flutter/Models/current_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  Future<bool> settoken(String token) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString('token', token);
  }

  Future<void> settUser(String name, String email,int id) async {
    final pref = await SharedPreferences.getInstance();
    pref.setStringList('itemss', <String>[
      name,
      email,
    ]);
    pref.setInt('uid', id);

    // return pref.setStringList('items', <String>["helloo", 'Moon', 'Sun']);
  }

  setcurrentUser(String name, String email,int id) async {
    final pref = await SharedPreferences.getInstance();
    settUser(name, email,id).whenComplete(() {
      final List<String>? items = pref.getStringList('itemss');
      var i=pref.getInt('uid');
      print(items);
      
      currentUser.name = items![0].toString();
      currentUser.email = items[1].toString();
      currentUser.id=i;
    });
  }

  setUserAllreadyLogin() async {
    try {
      final pref = await SharedPreferences.getInstance();

      final List<String>? items = pref.getStringList('itemss');
      var i=pref.getInt('uid');
      print("+++++++++++++++++++++++++");
      print(items);
      currentUser.name = items![0].toString();
      currentUser.email = items[1].toString();
      currentUser.id=i;
    } catch (e) {
      print(e);
    }
  }

  Future<String?> gettoken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }
}
