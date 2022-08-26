import 'package:flutter/material.dart';

class InformacionPage extends StatefulWidget {
  const InformacionPage({Key? key, required this.gen, required this.iden})
      : super(key: key);
  final String gen;
  final String iden;
  @override
  State<InformacionPage> createState() => _InformacionPageState();
}

class _InformacionPageState extends State<InformacionPage> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFF229A8),
          title: Text('Informacion'),
          centerTitle: true,
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(3.0),
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                backgroundImage: AssetImage('assets/images/masc.png'),
                radius: 25.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                child: Text(widget.iden.toString()),
                backgroundColor: Colors.brown,
              ),
            )
          ]),
      body: _contactDetails(),
    );
  }

  Widget _contactDetails() {
    return ListView(children: <Widget>[
      ClipOval(
        child: Image.asset(
          'assets/images/fem.png',
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
