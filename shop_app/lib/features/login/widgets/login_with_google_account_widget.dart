// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LoginWithGoogleAccountWidget extends StatelessWidget {
//   const LoginWithGoogleAccountWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         context.read<LoginBloc>().add(const LoginWithGoogleAccount());
//       },
//       behavior: HitTestBehavior.translucent,
//       child: Container(
//         padding: const EdgeInsets.all(Dimensions.paddingMedium),
//         width: 150,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           border: Border.all(color: Colors.grey[600]!),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 25,
//               child: AspectRatio(
//                 aspectRatio: 1 / 1,
//                 child: Image.asset(
//                   'assets/icon/ic_google.png',
//                 ),
//               ),
//             ),
//             const SizedBox(width: 5.0),
//             const Text('Google', style: CustomTextStyle.textStyle16BlackW700),
//           ],
//         ),
//       ),
//     );
//   }
// }
