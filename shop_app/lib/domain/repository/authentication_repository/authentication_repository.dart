import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/shop_app.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  registered,
  registerFailure,
  accountAlreadyRegister,
  passwordIsWeak,
  wrongUserPassword,
  userNotFound,
  invalidEmail,
  tooManyLoginRequests,
  forgotPassword,
}

// Manages the authentication domain.
class AuthenticationRepository {
  // Stream will be used to notify the application when a user signs in or out.
  final _controller = StreamController<AuthenticationStatus>();

  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<AuthenticationStatus> get status async* {
    // final prefs = await SharedPreferences.getInstance();
    // bool isLoggedIn = prefs.getBool(Constant.SESSION_IS_VALID) ?? false;
    // yield isLoggedIn
    //     ? AuthenticationStatus.authenticated
    //     : AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> listenAuthStatus() async {
    auth.authStateChanges().listen((User? user) async {
      /// This will help to check app login or not when opening app.
      if (user == null) {
        FirebaseLogger()
            .log('listen_auth_status', 'User is currently signed out!');
        _controller.add(AuthenticationStatus.unauthenticated);
      } else {
        user.getIdTokenResult().then((IdTokenResult idTokenResult) {
          if (idTokenResult.claims != null &&
              idTokenResult.claims!['admin'] == true) {
            // User is an admin, grant access to admin features
          } else {
            // User is a regular user, grant access to regular features
          }
        });
        _controller.add(AuthenticationStatus.authenticated);
        FirebaseLogger().log('listen_auth_status', 'User is signed in!');
      }
    });
  }

  /// This function attempts to authenticate the user with the provided email and password
  /// Parameters:
  ///   - email: The email address of the user to authenticate.
  ///   - password: The password of the user to authenticate.
  ///
  /// Returns:
  ///   - A `Future<bool>` that resolves to `true` if the authentication is successful, and `false`
  ///     otherwise.
  Future<bool> logIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      // final prefs = await SharedPreferences.getInstance();
      if (userCredential.user != null) {
        // await prefs.setBool(Constant.SESSION_IS_VALID, true);
        _controller.add(AuthenticationStatus.authenticated);
        return true;
      } else {
        _controller.add(AuthenticationStatus.unknown);
        return false;
      }
    } on FirebaseAuthException catch (e) {
      FirebaseLogger()
          .log('login', "login_firebase_auth_exception: ${e.toString()}");
      if (e.code == 'wrong-password') {
        _controller.add(AuthenticationStatus.wrongUserPassword);
      } else if (e.code == 'user-not-found') {
        _controller.add(AuthenticationStatus.userNotFound);
      } else if (e.code == 'invalid-email') {
        _controller.add(AuthenticationStatus.invalidEmail);
      } else if (e.code == 'too-many-requests') {
        _controller.add(AuthenticationStatus.tooManyLoginRequests);
      } else {
        _controller.add(AuthenticationStatus.unauthenticated);
      }
      return false;
    } catch (e) {
      FirebaseLogger().log('login', "login_error: ${e.toString()}");
      return false;
    }
  }

  Future<void> logOut() async {
    auth.signOut();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> mailRegisterRequest(String mail, String pwd) async {
    try {
      UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(email: mail, password: pwd);

      // final prefs = await SharedPreferences.getInstance();
      if (userCredential.user != null) {
        // await prefs.setBool(Constant.SESSION_IS_VALID, true);
        _controller.add(AuthenticationStatus.registered);
      } else {
        _controller.add(AuthenticationStatus.unknown);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _controller.add(AuthenticationStatus.passwordIsWeak);
        FirebaseLogger()
            .log('mail_register_request', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _controller.add(AuthenticationStatus.accountAlreadyRegister);
        FirebaseLogger().log('mail_register_request',
            'The account already exists for that email.');
      }
    } catch (e) {
      FirebaseLogger()
          .log('mail_register_request', "register_error: ${e.toString()}");
    }
  }

  Future<void> phoneNumberRegisterRequest(String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          FirebaseLogger().log('verification_completed', "credential: ${credential.toString()}");
        },
        verificationFailed: (FirebaseAuthException e) {
          FirebaseLogger().log('verification_failed', "error: ${e.toString()}");
        },
        codeSent: (String verificationId, int? resendToken) {
          FirebaseLogger().log('code_sent',
              "verificationId: ${verificationId.toString()} - resendToken: $resendToken");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          FirebaseLogger().log('code_auto_retrieval_timeout',
              "verificationId: ${verificationId.toString()}");
        },
      );
    } catch (e) {
      FirebaseLogger().log(
          'phone_number_register_request', "register_error: ${e.toString()}");
    }
  }

  Future<bool> forgotPasswordRequest(String mail) async {
    try {
      await auth.sendPasswordResetEmail(email: mail);

      _controller.add(AuthenticationStatus.forgotPassword);
      return true;
    } on FirebaseAuthException catch (e) {
      FirebaseLogger().log('forgot_password_request',
          'forgot_password_firebase_auth_exception: ${e.toString()}');
      return false;
    } catch (e) {
      FirebaseLogger().log(
          'forgot_password_request', "forgot_password_error: ${e.toString()}");
      return false;
    }
  }

  // Future<void> loginWithGoogleAccount() async {
  //   bool isLogin = await GoogleManager().googleManager.isSignedIn();
  //   if (isLogin) await GoogleManager().googleManager.signOut();
  //   final GoogleSignInAccount? googleUser =
  //       await GoogleManager().googleManager.signIn();
  //   if (googleUser == null) {
  //     _controller.add(AuthenticationStatus.unauthenticated);
  //   } else {
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       idToken: googleAuth.idToken,
  //       accessToken: googleAuth.accessToken,
  //     );

  //     UserCredential userCredential =
  //         await auth.signInWithCredential(credential);
  //     if (userCredential.user != null) {
  //       // await prefs.setBool(Constant.SESSION_IS_VALID, true);
  //       _controller.add(AuthenticationStatus.authenticated);
  //     } else {
  //       _controller.add(AuthenticationStatus.unknown);
  //     }
  //   }
  // }

  void dispose() => _controller.close();
}
