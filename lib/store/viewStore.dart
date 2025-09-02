import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final WebViewController _controller;
  bool _isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading =
                  true; // Set loading to true when a page starts loading
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading =
                  false; // Set loading to false when the page finishes loading
            });
          },
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.startsWith("https://api.whatsapp.com/")) {
              // Open WhatsApp link in external app
              await EasyLauncher.sendToWhatsApp(phone: "+212663497323");

              return NavigationDecision
                  .prevent; // Prevent WebView from loading the link
            }
            return NavigationDecision
                .navigate; // Allow WebView to load other links
          },
        ),
      )
      ..loadRequest(Uri.parse('https://inaiq.net/'));
  }

  Future<bool> _onWillPop() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
      return false; // Prevent default back action
    }
    return true; // Allow app to exit
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(child: WebViewWidget(controller: _controller)),
            if (_isLoading) // Show loading spinner if loading
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
