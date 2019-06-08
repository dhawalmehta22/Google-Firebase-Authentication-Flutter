import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';


class UserData {
  String displayName;
  String email;
  String uid;
  String password;

  UserData({this.displayName, this.email, this.uid, this.password});
}


class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
}


class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}





class UserAuth {
  String statusMsg="Account Created Successfully";
  //To create new User
  Future<String> createUser(UserData userData) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: userData.email, password: userData.password);
    return statusMsg;
  
  }

  //To verify new User
  Future<String> verifyUser (UserData userData) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    
    await firebaseAuth
        .signInWithEmailAndPassword(email: userData.email, password: userData.password);
    return "Login Successfull";
  }

    Future<String> verifyUser1 (UserData userData) async
    {
       FirebaseAuth firebaseAuth = FirebaseAuth.instance;
     GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleUser=await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth=await googleUser.authentication;
    
    final AuthCredential credential=GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
   
    FirebaseUser userDetails = await firebaseAuth.signInWithCredential(credential);
   ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);
   List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
        userDetails.providerId,
        userDetails.displayName,
        userDetails.photoUrl,
        userDetails.email,
        providerData,
);   
    return "Login Successfull";
   }
}
