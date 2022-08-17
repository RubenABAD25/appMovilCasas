import 'dart:developer';

// import 'package:app_login/modelo/usuario.dart';
// import 'package:app_login/servicio/servicio.dart';
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
  TextEditingController correo = new TextEditingController();
  TextEditingController pass = TextEditingController();
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
      body: Center(
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
              ElevatedButton(
                child: Text('Ingresar'),
                onPressed: () {
                  if (correo.text.isEmpty || pass.text.isEmpty) {
                    const snackBar = SnackBar(
                      content: Text('Datos incompletos'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.redAccent,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    if (correo.text.trim() == 'esteban93abad23@gmail.com' ||
                        pass.text.trim() == '123456') {
                      // const snackBar = SnackBar(
                      //   content: Text('Datos Correctos'),
                      //   duration: Duration(seconds: 2),
                      //   backgroundColor: Colors.green,
                      // );
                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MenuPage()));
                    }
                  }
                  //final u = new Usuario(email: correo.text, passwd: pass.text);

                  //loginService.login(u);
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF229A8), shape: StadiumBorder()),
              ),
            ]),
      ),
    );
  }

  Widget _crearEmail() {
    return TextField(
      controller: correo,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Correo de la Persona',
          labelText: 'Email',
          helperText: 'Solo es de Ingresar correo',
          icon: Icon(Icons.alternate_email)),
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Clave de la Persona',
          labelText: 'Clave',
          helperText: 'Introduzca su clave',
          icon: Icon(Icons.lock)),
      onChanged: (aux) => setState(() {
        mensaje = 'Ingreso';
      }),
    );
  }
}
