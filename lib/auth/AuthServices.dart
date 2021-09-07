import 'dart:developer';

// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  //AuthServices(this.phoneAuthCredential,this.firebaseVerificationI)
  AuthServices._privateConstructor();
  static final AuthServices instance = AuthServices._privateConstructor();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String firebaseVerificationId = "";
  PhoneAuthCredential phoneAuthCredential =
      PhoneAuthProvider.credential(smsCode: '', verificationId: '');

  Future googleLogin() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn();
      try {
        await _googleSignIn.disconnect();
      } catch (e) {}
      GoogleSignInAccount? _userObj;
      _userObj = await _googleSignIn.signIn();
      print("google login");
      if (_userObj != null) {
        final GoogleSignInAuthentication googleAuth =
            await _userObj.authentication;
        final googleCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        print("----------");
        final res = await _auth.signInWithCredential(googleCredential);
        print('rres =${res.additionalUserInfo!.profile}');
        print("firebase login success with google");
        return res.additionalUserInfo;
      }
    } catch (e) {
      print(e.toString());
      return 'failure';
    }
  }

  Future<void> phoneLogin(phonenumber, {successFn, failedFn}) async {
    print(phonenumber);
    await _auth.verifyPhoneNumber(
      phoneNumber: "$phonenumber",
      verificationCompleted: (phoneAuthCredential) async {
        log("verification completed");
        //await _auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (verificationFailed) async {
        log("error verification failed");
        failedFn(verificationFailed.message);
      },
      codeSent: (verificationId, resendingToken) async {
        log("code sent");
        firebaseVerificationId = verificationId;
        if (successFn != null) successFn();
      },
      codeAutoRetrievalTimeout: (verificationId) async {
        log("auto code retrieval timeout");
      },
    );
  }

  Future<String> verifyOtp(String phoneNumber, String otp) async {
    phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: firebaseVerificationId,
      smsCode: otp,
    );
    print("----------");

    try {
      final user = await _auth.signInWithCredential(phoneAuthCredential);

      if (user.additionalUserInfo!.isNewUser == true)
        return 'new User';
      else
        return 'old User';
    } catch (e) {
      print(e.toString());
      return 'failure';
    }
  }

  Future<void> updateName({name}) async {
    if (name != null && name != '')
      await _auth.currentUser!.updateDisplayName(name);
  }

  Future updateEmail({email}) async {
    if (email != null && email != '') {
      await _auth.currentUser!.updateEmail(email);
      // _auth.currentUser.updatePhotoURL(photoURL)
    }
  }

  Future sendEmailVerification() async {
    await _auth.currentUser!.sendEmailVerification();
  }
}
