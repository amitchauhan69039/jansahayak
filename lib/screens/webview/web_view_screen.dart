import 'package:JanSahayak/jan_sahayak.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String serviceName,serviceUrl;
  const WebViewScreen({super.key, required this.serviceName,required this.serviceUrl});


  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController webViewController;
  bool isLoading=false;

  final WebController controller = Get.put(WebController());




  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Allow JavaScript execution in WebView
      ..setBackgroundColor(const Color(0x00000000)) // Set WebView background to transparent
      ..setNavigationDelegate( // Set navigation event handlers
        NavigationDelegate(
          // Called when a new page starts loading
          onPageStarted: (url) {
            setState(() {
              isLoading = true; // Show loading indicator when page starts loading
            });
          },
          // Called when the page finishes loading
          onPageFinished: (url) {
            setState(() {
              isLoading = false; // Hide loading indicator when page finishes loading
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.serviceUrl));
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CommonAppbar(title: widget.serviceName),
          ),
          body: GetBuilder<WebController>(
              id: 'web_view',
              builder: (controller) {
                return WebViewWidget(controller: webViewController);
              })),
    );
  }

}