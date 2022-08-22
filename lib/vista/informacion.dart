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
      body: _contactDetails(),
    );
  }

  Widget _contactDetails() {
    return ListView(children: <Widget>[
      ClipOval(
        child: Image.network(
          'https://cdn.pixabay.com/photo/2013/07/13/01/22/vegetables-155616__340.png',
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
      ListTile(
        leading: Icon(
          Icons.account_circle,
          color: Color(0xFFF229A8),
        ),
        title: Text('Martha Luzoriaga'),
      ),
      ListTile(
        leading: Icon(Icons.phone, color: Color(0xFFF229A8)),
        title: Text('+5934466556'),
      ),
      ListTile(
        leading: Icon(Icons.email, color: Color(0xFFF229A8)),
        title: Text('martha@gmail'),
      ),
      ListTile(
        leading: Icon(Icons.location_on_outlined, color: Color(0xFFF229A8)),
        title: Text('mercado 12 de abril'),
      )
    ]);
  }
}
