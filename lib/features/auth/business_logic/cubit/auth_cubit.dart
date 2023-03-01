import 'package:e_commerce/core/service/firestore_user.dart';
import 'package:e_commerce/features/auth/presentation/widgets/snack_bar.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signInWithGoogle(context) async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    try {
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _auth.signInWithCredential(credential).then((user) {
        saveUser(user: user);
      });
      emit(SignInSuccess());
    } catch (e) {
      print(e.toString());
      showSnackBar(context,e.toString());
      emit(SignInError(error: e.toString()));
    }
  }

  void signInWithFacebook(context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      FacebookAuth.instance
          .login(loginBehavior: LoginBehavior.nativeWithFallback);
      await _auth
          .signInWithCredential(
        facebookAuthCredential,
      )
          .then((user) {
        saveUser(user: user);
      });
      emit(SignInSuccess());
    } catch (e) {
      print(e.toString());
      showSnackBar(context,e.toString());
      emit(SignInError(error: e.toString()));
    }
  }

  void signInWithEmail(context, email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSuccess());
    } catch (e) {
      print(e.toString());
    showSnackBar(context,e.toString());
      emit(SignInError(error: e.toString()));
    }
  }

  void registerWithEmail(context, email, password, name) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        saveUser(user: user, name: name);
      });
      emit(RegisterSuccess());
    } catch (e) {
      print(e.toString());
     showSnackBar(context,e.toString());
      emit(RegisterError(error: e.toString()));
    }
  }

  void saveUser({required UserCredential user, name}) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      user.user!.uid,
      user.user!.email,
      name == null ? user.user!.displayName : name,
      '',
    ));
  }
}
