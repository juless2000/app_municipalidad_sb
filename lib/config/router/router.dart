
import 'package:app_municipalidad_sb/presentation/screens/inicio/inicio.dart';
import 'package:app_municipalidad_sb/presentation/screens/load/load.dart';
import 'package:app_municipalidad_sb/presentation/screens/login/login.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', name: '/load', builder: (context, state) => const LoadPage(),),
  GoRoute(path: '/login', name: 'login', builder: (context, state) => const LoginPage(),),
  GoRoute(path: '/inicio', name: 'inicio', builder: (context, state) => const InicioPage(),),
]);
