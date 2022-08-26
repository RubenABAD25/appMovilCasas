import 'package:flutter/material.dart';
import 'package:testfirebase/vista/contacto.dart';
import 'package:testfirebase/vista/informacion.dart';
import 'package:testfirebase/vista/listadoCasas.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key, required this.g, required this.i})
      : super(key: key);
  final String g;
  final String i;
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  int valCambio = 0;
  @override
  Widget build(BuildContext context) {
    List tabs = [
      const InformacionPage(
        gen: 'masc',
        iden: 'h',
      ),
      const ContactoPage(),
      const ListadoCasasPage(),
    ];
    return Scaffold(
      // body: Container(
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //           image: AssetImage("assets/fondo.png"), fit: BoxFit.fill)),
      //   child: Center(
      //     child: FlutterLogo(
      //       size: 300,
      //     ),
      //   ),
      // ),
      body: tabs[valCambio],
      bottomNavigationBar: _crearBotonNavegator(),
      //floatingActionButton: _crearBotones(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _crearBotonNavegator() {
    return BottomNavigationBar(
      currentIndex: valCambio,
      backgroundColor: Color(0xFF941E69),
      iconSize: 25,
      selectedFontSize: 20,
      unselectedFontSize: 18,
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.blueGrey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Informacion'),
        BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone), label: 'Contacto'),
        BottomNavigationBarItem(
            icon: Icon(Icons.photo_library_outlined), label: 'Casas')
      ],
      onTap: (aux) {
        setState(() {
          valCambio = aux;
          print(valCambio);
        });
      },
    );
  }
}
