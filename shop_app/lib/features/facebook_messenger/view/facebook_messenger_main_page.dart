// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class FacebookMessengerMainPage extends StatelessWidget {
//   const FacebookMessengerMainPage({super.key});

//   Future<void> _openMessenger(BuildContext context) async {
//     const messengerUrl = 'https://www.messenger.com';
//     if (await canLaunch('fb-messenger://')) {
//       // If Facebook Messenger app is installed, open it
//       await launch('fb-messenger://');
//     } else {
//       // If Facebook Messenger app is not installed, open in WebView
//       // ignore: use_build_context_synchronously
//       await Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => InAppWebView(
//               initialUrlRequest: URLRequest(url: Uri.tryParse(messengerUrl)),
//               initialOptions: options,
//               onWebViewCreated: (InAppWebViewController controller) {
//                 controller.addJavaScriptHandler(
//                   handlerName: "notifyBackToDashboard",
//                   callback: (args) {

//                   }
//                 );
//               },
//             )),
//       );
//     }
//   }

//   InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
//       crossPlatform: InAppWebViewOptions(
//         useShouldOverrideUrlLoading: true,
//         mediaPlaybackRequiresUserGesture: false,
//       ),
//       android: AndroidInAppWebViewOptions(
//         useHybridComposition: true,
//       ),
//       ios: IOSInAppWebViewOptions(
//         allowsInlineMediaPlayback: true,
//       ));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: const Text(
//           'Facebook Messenger',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       body: SafeArea(child: Container()),
//     );
//   }
// }
