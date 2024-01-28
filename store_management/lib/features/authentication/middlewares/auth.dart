import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_management/store_management.dart';

void authHandler(
    BuildContext context, AuthenticationStatus status, UserModel user) async {
  FirebaseLogger().log(
      'auth_handler', "auth_handler: authentication_status: ${status.index}");
  switch (status) {
    case AuthenticationStatus.authenticated:
      // Navigator.pushNamed(context, LoadingPage.routeName);
      break;
    case AuthenticationStatus.unauthenticated:
      Future.delayed(const Duration(seconds: 5), () {
        GoRouter.of(context).pushNamed(RouteNames.loginPage);
      });

      // GoRouter.of(context).pushNamed(RouteNames.home);

      break;
    case AuthenticationStatus.unknown:
      break;
    case AuthenticationStatus.registered:
      // Navigator.pushNamed(context, LoadingPage.routeName);
      break;
    case AuthenticationStatus.registerFailure:
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (_) => CustomIOSDialog(
      //     title: "Warning",
      //     dialogType: CustomDialogType.warning,
      //     body: Container(
      //       padding: const EdgeInsets.all(
      //         Dimensions.paddingSmall,
      //       ),
      //       alignment: Alignment.center,
      //       child: const Text(
      //         'Register is not succeeded',
      //         style: CustomTextStyle.textStyle14BlackW400,
      //       ),
      //     ),
      //     btnOkOnPress: () => Navigator.of(context).pop(),
      //     btnCancelOnPress: () {},
      //   ),
      // );
      break;
    case AuthenticationStatus.accountAlreadyRegister:
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (_) => CustomIOSDialog(
      //     title: "Warning",
      //     dialogType: CustomDialogType.warning,
      //     body: Container(
      //       padding: const EdgeInsets.all(
      //         Dimensions.paddingSmall,
      //       ),
      //       alignment: Alignment.center,
      //       child: const Text(
      //         'The account already exists for that email',
      //         style: CustomTextStyle.textStyle14BlackW400,
      //       ),
      //     ),
      //     btnOkOnPress: () => Navigator.of(context).pop(),
      //     btnCancelOnPress: () {},
      //   ),
      // );
      break;
    case AuthenticationStatus.passwordIsWeak:
      break;
    case AuthenticationStatus.wrongUserPassword:
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (_) => CustomIOSDialog(
      //     title: "Warning",
      //     dialogType: CustomDialogType.warning,
      //     body: Container(
      //       padding: const EdgeInsets.all(
      //         Dimensions.paddingSmall,
      //       ),
      //       alignment: Alignment.center,
      //       child: const Text(
      //         'The password is invalid or the user does not have a password.',
      //         style: CustomTextStyle.textStyle14BlackW400,
      //       ),
      //     ),
      //     btnOkOnPress: () => Navigator.of(context).pop(),
      //     btnCancelOnPress: () {},
      //   ),
      // );
      break;
    case AuthenticationStatus.userNotFound:
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (_) => CustomIOSDialog(
      //     title: "Warning",
      //     dialogType: CustomDialogType.warning,
      //     body: Container(
      //       padding: const EdgeInsets.all(
      //         Dimensions.paddingSmall,
      //       ),
      //       alignment: Alignment.center,
      //       child: const Text(
      //         'There is no user record corresponding to this identifier. The user may have been deleted.',
      //         style: CustomTextStyle.textStyle14BlackW400,
      //       ),
      //     ),
      //     btnOkOnPress: () => Navigator.of(context).pop(),
      //     btnCancelOnPress: () {},
      //   ),
      // );
      break;
    case AuthenticationStatus.invalidEmail:
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (_) => CustomIOSDialog(
      //     title: "Warning",
      //     dialogType: CustomDialogType.warning,
      //     body: Container(
      //       padding: const EdgeInsets.all(
      //         Dimensions.paddingSmall,
      //       ),
      //       alignment: Alignment.center,
      //       child: const Text(
      //         'The email address is badly formatted.',
      //         style: CustomTextStyle.textStyle14BlackW400,
      //       ),
      //     ),
      //     btnOkOnPress: () => Navigator.of(context).pop(),
      //     btnCancelOnPress: () {},
      //   ),
      // );
      break;
    case AuthenticationStatus.tooManyLoginRequests:
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (_) => CustomIOSDialog(
      //     title: "Warning",
      //     dialogType: CustomDialogType.warning,
      //     body: Container(
      //       padding: const EdgeInsets.all(
      //         Dimensions.paddingSmall,
      //       ),
      //       alignment: Alignment.center,
      //       child: const Text(
      //         'Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.',
      //         style: CustomTextStyle.textStyle14BlackW400,
      //       ),
      //     ),
      //     btnOkOnPress: () => Navigator.of(context).pop(),
      //     btnCancelOnPress: () {},
      //   ),
      // );
      break;
    case AuthenticationStatus.forgotPassword:
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (_) => CustomIOSDialog(
      //     title: "Forgot password",
      //     dialogType: CustomDialogType.info,
      //     body: Container(
      //       padding: const EdgeInsets.all(
      //         Dimensions.paddingSmall,
      //       ),
      //       alignment: Alignment.center,
      //       child: const Text(
      //         'A link has been sent to your email, please check messages & set new password with this link.',
      //         style: CustomTextStyle.textStyle14BlackW400,
      //       ),
      //     ),
      //     btnOkOnPress: () => Navigator.of(context).pop(),
      //     btnCancelOnPress: () {},
      //   ),
      // );
      break;
  }
}
