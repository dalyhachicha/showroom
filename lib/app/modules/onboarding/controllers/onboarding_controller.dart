import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/models/user_model.dart';
import 'package:showroom/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  UserModel userModel = UserModel();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  late CollectionReference collectionReference;
  String verificationId = '';
  var authState = 'loading'.obs;

  // verify OTP code
  verifyCode(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    try {
      await firebaseAuth.signInWithCredential(credential).then((value) {
        authState.value = 'complete';
      });
    } on FirebaseAuthException catch (e) {
      authState.value = 'wrong_code';
    }
  }

  // Send OTP code to phone number
  verifyNumber(String phoneNumber) {
    firebaseAuth.verifyPhoneNumber(
      timeout: const Duration(seconds: 120),
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        authState.value = 'complete';
        // sometimes automatically verify current phone is the phone number
        await firebaseAuth.signInWithCredential(credential).then((value) =>
            Get.snackbar('Verification Compelete',
                'Your phone has been successfully verified.'));

        // if i do this data will not be good and saved in firebase must go to last page
        //.then((value) => Get.offAllNamed(Routes.HOME));
      },
      verificationFailed: (FirebaseAuthException exception) {
        Get.snackbar('Invalid Phone Number', 'Please enter your phone number');
        authState.value = 'failed';
      },
      codeSent: (String vId, int? resendToken) {
        verificationId = vId;
        Get.snackbar('Code Sent', 'Code sent to $phoneNumber');
        authState.value = 'sent';
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        authState.value = 'timeout';
      },
    );
  }

  // save user to firebase document ('users')
  saveUserToFirebase() {
    var userData = userModel.toJson();
    collectionReference
        .add(userData)
        .whenComplete(() => Get.offAllNamed(Routes.HOME));
  }

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection("users");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
