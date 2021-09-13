// ignore_for_file: avoid_print, file_names, prefer_final_fields, prefer_const_constructors, unnecessary_null_comparison
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:restaurant/Delicious/delicious.dart';
import 'package:restaurant/size_config.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  var _formKey1 = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  FirebaseAuth _authUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      color: Color(0xFFF2F2F2),
      child: Form(
        key: _formKey1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: 62),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                controller: email,
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  hoverColor: Colors.black,
                  labelText: "Email address",
                  labelStyle: TextStyle(
                      fontSize: getProportionScreenHeight(15.0),
                      color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 46),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                      fontSize: getProportionScreenHeight(15.0),
                      color: Colors.grey),
                  suffixIcon:
                      Icon(Icons.visibility_off_outlined, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 34),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Forgot passcode?",
                    style: TextStyle(
                      color: Color(0xFFFA4A0C),
                      fontSize: getProportionScreenHeight(17.0),
                    ),
                  ),
                ),
                InkWell(
                  child: SizedBox(
                    height: 40.0,
                    child: Center(
                      child: Image.asset("assets/images/google.png"),
                    ),
                  ),
                  onTap: () =>
                      Authentication.signInWithGoogle(context: context),
                ),
              ],
            ),
            SizedBox(height: 120),
            GestureDetector(
              onTap: () async {
                try {
                  if (_formKey1.currentState!.validate()) {
                    final user = await _authUser.signInWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Delicious(),
                        ),
                      );
                    }
                  }
                } catch (e) {
                  // SNACKBAR KERAK
                  print("LOGINDA XATO BOR: " + e.toString());
                }
              },
              child: Container(
                height: 70.0,
                width: 314.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xFFFA4A0C)),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionScreenHeight(17.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Delicious()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    return user;
  }
}
