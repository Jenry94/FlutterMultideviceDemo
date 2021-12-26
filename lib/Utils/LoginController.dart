
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multidevice_demo/Utils/InitConfigs.dart';

Future<bool> registerUser(String email, String password) async {
  try {
    UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    userCredential = user;
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> loginEmailPassword(String email, String password) async {
  try {
    UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    userCredential = user;
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}