import 'package:fichaje_app_movil/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context.go('/tutorial');
              },
              icon: const Icon(
                FontAwesomeIcons.question,
                color: Colors.white,
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: const Color(0xFF8A2387),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF8A2387),
                Color(0xFFE94057),
                Color(0xFFF27121),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage('assets/images/logo.png'),
                      height: size.height * 0.05,
                      width: size.width * 0.1,
                    ),
                    SizedBox(width: size.width * 0.05),
                    const Text(
                      'Fichaje Alarbon',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 4),
                    ),
                    child: Center(
                      child: Text(
                        loginProvider.dni,
                        style: TextStyle(
                            fontSize: size.width * 0.12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NumberButton(
                              number: '7',
                              onPressed: () {
                                loginProvider.writingDni('7');
                              }),
                          NumberButton(
                              number: '8',
                              onPressed: () {
                                loginProvider.writingDni('8');
                              }),
                          NumberButton(
                              number: '9',
                              onPressed: () {
                                loginProvider.writingDni('9');
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NumberButton(
                              number: '4',
                              onPressed: () {
                                loginProvider.writingDni('4');
                              }),
                          NumberButton(
                              number: '5',
                              onPressed: () {
                                loginProvider.writingDni('5');
                              }),
                          NumberButton(
                              number: '6',
                              onPressed: () {
                                loginProvider.writingDni('6');
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NumberButton(
                              number: '1',
                              onPressed: () {
                                loginProvider.writingDni('1');
                              }),
                          NumberButton(
                              number: '2',
                              onPressed: () {
                                loginProvider.writingDni('2');
                              }),
                          NumberButton(
                              number: '3',
                              onPressed: () {
                                loginProvider.writingDni('3');
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButtonFichaje(
                            icon: FontAwesomeIcons.trash,
                            colorGradient: Colors.red[200]!,
                            colorIcon: Colors.red[700]!,
                            onPressed: () {
                              loginProvider.clearDni();
                            },
                          ),
                          NumberButton(
                              number: '0',
                              onPressed: () {
                                loginProvider.writingDni('0');
                              }),
                          IconButtonFichaje(
                            icon: FontAwesomeIcons.check,
                            colorGradient: Colors.green[200]!,
                            colorIcon: Colors.green[700]!,
                            onPressed: () async{
                              await loginProvider.checkDni();

                              if (loginProvider.mensaje != null) {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.black54,
                                    content: Text(
                                      loginProvider.mensaje!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    action: SnackBarAction(
                                      textColor: Colors.yellow[900],
                                      label: 'Cerrar',
                                      onPressed: () {},
                                    ),
                                    duration:
                                        const Duration(milliseconds: 2000),
                                  ),
                                );

                                loginProvider.clearMensaje();
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final String number;
  final VoidCallback onPressed;

  const NumberButton(
      {superKey, Key? key, required this.number, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 255, 136, 249),
            Color.fromARGB(255, 251, 190, 246),
            Color.fromARGB(255, 255, 136, 249),
          ],
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      width: size.width * 0.2,
      height: size.width * 0.2,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          elevation: 30,
        ),
        child: Text(
          number,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class IconButtonFichaje extends StatelessWidget {
  final IconData icon;
  final Color colorGradient;
  final Color colorIcon;
  final VoidCallback onPressed;

  const IconButtonFichaje(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.colorGradient,
      required this.colorIcon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            colorGradient,
            const Color.fromARGB(255, 251, 190, 246),
          ],
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      width: size.width * 0.2,
      height: size.width * 0.2,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          elevation: 4,
        ),
        child: Icon(
          icon,
          size: size.width * 0.08,
          color: colorIcon,
        ),
      ),
    );
  }
}
