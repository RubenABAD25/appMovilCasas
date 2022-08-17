import 'package:flutter/material.dart';

class InformacionPage extends StatefulWidget {
  const InformacionPage({Key? key}) : super(key: key);

  @override
  State<InformacionPage> createState() => _InformacionPageState();
}

class _InformacionPageState extends State<InformacionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF229A8),
        title: Text('Informacion'),
        centerTitle: true,
      ),
    );
  }
}
