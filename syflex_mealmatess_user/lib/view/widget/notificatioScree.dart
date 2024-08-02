import 'package:flutter/material.dart';

class NtificationScreen extends StatelessWidget {
  const NtificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back)),
        title: Text("Notification"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Notifiaction"),
      ),
    );
  }
}
