import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'shop_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Song Yến Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red[800]!),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Song Yến Demo app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  Future<void> _navigateToFBMessenger(BuildContext context) async {
    // setState(() {
    //   _counter++;
    // });
    // Navigator.of(context).push(
    //   MaterialPageRoute<void>(
    // builder: (BuildContext context) => const FacebookMessengerMainPage(),
    // ),
    // );
    // const messengerUrl = 'https://www.messenger.com';
    //  if (!await launchUrl(
    //     Uri.tryParse(messengerUrl)!,
    //     mode: LaunchMode.inAppWebView,
    //     webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    //   )) {
    //     throw Exception('Could not launch');
    //   }    // await _openMessenger(context);
    // launch('https://mcaresolution.com');
    // await _launchInWebViewWithoutJavaScript(Uri.tryParse(messengerUrl)!);
    await _openMessenger(context);
  }

  Future<void> _launchInWebViewWithoutJavaScript(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _openMessenger(BuildContext context) async {
    // const messengerUrl = 'https://www.messenger.com';
    if (await canLaunchUrl(Uri.tryParse('fb-messenger://')!)) {
      await launchUrl(Uri.tryParse('fb-messenger://')!);
    } else {
      // const messengerUrl = 'https://www.messenger.com';

      final message = Uri.encodeFull('Hello, this is a predefined message from my app!');
      final messengerUrl = 'https://www.messenger.com/t/USER_ID_OR_USERNAME?ref=YOUR_APP_NAME&text=$message';

      await _launchInWebViewWithoutJavaScript(Uri.tryParse(messengerUrl)!);
    }
    // if (await canLaunch('fb-messenger://')) {
    //   // If Facebook Messenger app is installed, open it
    //   await launch('fb-messenger://');
    // } else {
    // If Facebook Messenger app is not installed, open in WebView
    // // ignore: use_build_context_synchronously
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => InAppWebView(
    //             initialUrlRequest: URLRequest(url: Uri.tryParse(messengerUrl)),
    //             initialOptions: options,
    //             onWebViewCreated: (InAppWebViewController controller) {
    //               controller.addJavaScriptHandler(
    //                   handlerName: "notifyBackToDashboard",
    //                   callback: (args) {});
    //             },
    //           )),
    // );
    // }
  }

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _navigateToFBMessenger(context);
        },
        // tooltip: 'Increment',
        child: Image.asset('assets/images/image_messenger_icon.png'),
      ),
    );
  }
}
