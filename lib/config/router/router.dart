
import 'package:app_municipalidad_sb/presentation/screens/inicio/emergencias/alertas/alerta_emergencias.dart';
import 'package:app_municipalidad_sb/presentation/screens/inicio/inicio.dart';
import 'package:app_municipalidad_sb/presentation/screens/load/load.dart';
import 'package:app_municipalidad_sb/presentation/screens/login/login.dart';
import 'package:app_municipalidad_sb/presentation/screens/perfil/perfil.dart';
import 'package:app_municipalidad_sb/presentation/screens/tutorial/tutorial.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', name: '/load', builder: (context, state) => const LoadPage(),),
  GoRoute(path: '/login', name: 'login', builder: (context, state) => const LoginPage(),),
  GoRoute(path: '/inicio', name: 'inicio', builder: (context, state) => const InicioPage(),),
  GoRoute(path: '/perfil', name: 'perfil', builder: (context, state) => const PerfilPage(),),
  GoRoute(path: '/tutorial', name: 'tutorial', builder: (context, state) => const TutorialPage(),),
  GoRoute(path: '/alerta', name: 'alerta', builder: (context, state) => const AlertaEmergenciasPage(),),
]);
