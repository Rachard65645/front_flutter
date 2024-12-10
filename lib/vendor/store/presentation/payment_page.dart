import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaymentPage extends StatefulWidget {
  final String paymentUrl;

  PaymentPage({required this.paymentUrl});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentPage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) 
      ..loadRequest(Uri.parse(widget.paymentUrl)); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Redirection vers le paiement")),
      body: WebViewWidget(controller: controller),
    );
  }
}
