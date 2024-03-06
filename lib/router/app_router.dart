import 'package:fichaje_app_movil/screen/home_screen.dart';
import 'package:fichaje_app_movil/screen/tutorial_screen.dart';
import 'package:fichaje_app_movil/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: Preferences.firstTime ? '/tutorial' : '/home',
  errorPageBuilder: (context, state) => const MaterialPage(
    child: Scaffold(
      body: Center(
        child: Text('Página de error: Ruta no encontrada'),
      ),
    ),
  ),
  routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/tutorial', builder: (context, state) =>  TutorialScreen()),
  
  ],
);
