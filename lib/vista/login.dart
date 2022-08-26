// import 'package:app_login/modelo/usuario.dart';
// import 'package:app_login/servicio/servicio.dart';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testfirebase/vista/menu.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String valorEmail = '';
  String passwd = '';
  String mensaje = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController correo = new TextEditingController();
  final TextEditingController pass = TextEditingController();
  late bool _success;
  late String _userEmail;
  //TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final Servicio loginService = Servicio();
    //final sesionBloc = BlocProvider.of<SesionBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF229A8),
        title: Text('Ingreso'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
                _crearEmail(),
                Divider(),
                _crearPassword(),
                Divider(),
                ElevatedButton.icon(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      login();
                    }
                  },
                  icon: Icon(
                    Icons.lock_open,
                    size: 24,
                  ),
                  label: Text(
                    'Ingresar',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF229A8),
                    shape: StadiumBorder(),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget _crearEmail() {
    return TextField(
      controller: correo,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF229A8))),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Correo de la Persona',
        labelText: 'Email',
        labelStyle: new TextStyle(color: Color(0xFFF229A8)),
        helperText: 'Solo es de Ingresar correo',
        icon: Icon(
          Icons.alternate_email,
          color: Color(0xFFF229A8),
        ),
      ),
      onChanged: (aux) => setState(() {
        valorEmail = aux;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      controller: pass,
      obscureText: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFF229A8))),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Clave de la Persona',
          labelText: 'Clave',
          labelStyle: new TextStyle(color: Color(0xFFF229A8)),
          helperText: 'Introduzca su clave',
          icon: Icon(Icons.lock, color: Color(0xFFF229A8))),
      onChanged: (aux) => setState(() {
        mensaje = 'Ingreso';
      }),
    );
  }

  Future login() async {
    final usuario = (await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: correo.text.trim(), password: pass.text.trim()))
        .user;
    if (usuario != null) {
      setState(() {
        _success = true;
        _userEmail = usuario.email;
        log(_userEmail);
        if (_userEmail == 'esteban93abad23@gmail.com' ||
            _userEmail == 'cristhian19cd@gmail.com') {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MenuPage(g: 'masc.png', i: 'H')));
        }
      });
    } else {
      setState(() {
        _success = false;
        _userEmail = 'no existe';
        log('no');
      });
    }
  }
}
