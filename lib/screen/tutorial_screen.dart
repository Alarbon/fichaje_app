import 'package:fichaje_app_movil/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TutorialScreen extends StatefulWidget {
  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final controller = PageController();

  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('¿Como fichar?'),
        centerTitle: true,
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() => isLastPage = index == 3);
        },
        children: [
          _IntroSection(),
          _RulesSection(),
          _InstructionsSection(),
          _TipsSection(),
        ],
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange.shade700,
                  minimumSize: const Size.fromHeight(80)),
              onPressed: () {
                Preferences.firstTime = false;
                context.go('/home');
              },
              child: const Text(
                'Volver',
                style: TextStyle(fontSize: 24),
              ))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('SKIP'),
                    onPressed: () => controller.jumpToPage(3),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Colors.teal.shade700),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(microseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                    child: const Text('NEXT'),
                    onPressed: () => controller.nextPage(
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeInOut),
                  ),
                ],
              ),
            ),
    );
  }
}

class _IntroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/movil.png', height: 300, width: 300),
          const SizedBox(height: 50),
          const Text(
            'Inserte su DNI',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Para fichar, debe insertar su DNI numerico en el teclado que aparece en la pantalla.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

class _RulesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Términos del servicio',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 25),
          Text(
            '1. El trabajador debe fichar al ingresar y al salir de su jornada laboral. En caso de no hacerlo, se le descontará el día de trabajo.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 25),
          Text(
            '2. El trabajador no debe manipular el sistema de fichaje. En caso de hacerlo, se le descontará el día de trabajo y se le aplicará una sanción.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 25),
          Text(
            '3. El trabajador no debe fichar por otro trabajador. En caso de hacerlo, se le descontará el día de trabajo y se le aplicará una sanción.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _InstructionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Instrucciones',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 25),
          Text(
            '1. Ingrese su DNI en el teclado numérico que aparece en la pantalla.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 25),
          Text(
            '2. Una vez que haya ingresado su DNI, presione el botón verde.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 25),
          Text(
            '3. Si ocurre un error, aparecerá un mensaje en la pantalla. En caso de que el error sea por un DNI incorrecto, vuelva a ingresar su DNI y presione el botón verde. Si el error persiste, comuníquese con el administrador del sistema.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 25),
          Text(
            '4. Si ocurre algo inesperado, comuníquese con el administrador del sistema.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 25),
        
        ],
      ),
    );
  }
}

class _TipsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Consejos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 25),
          Text(
            '1. Si no esta seguro de si ha fichado correctamente, puede verificar su fichaje hablando con el administrador del sistema.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 25),
          Text(
            '2. Si no desea molestar al administrador, fiche de nuevo y en el mensaje aparecerá el estado actual.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 25),
          Text(
            '3. Si tiene alguna duda, comuníquese con el administrador del sistema.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}