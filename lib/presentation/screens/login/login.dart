
import 'package:app_municipalidad_sb/presentation/screens/login/blocs/password.dart';
import 'package:app_municipalidad_sb/presentation/screens/login/blocs/username.dart';
import 'package:app_municipalidad_sb/presentation/screens/login/widgets/footer.dart';
import 'package:app_municipalidad_sb/presentation/screens/login/widgets/header.dart';
import 'package:app_municipalidad_sb/presentation/screens/login/widgets/password_textfield.dart';
import 'package:app_municipalidad_sb/presentation/screens/login/widgets/username_textffield.dart';
import 'package:app_municipalidad_sb/presentation/widgets/default_button.dart';
import 'package:app_municipalidad_sb/presentation/widgets/default_progress.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Instanciar las clases Cubit
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => UsernameCubit()),
      BlocProvider(create: (_) => PasswordCubit())
    ], child: const LoginScreen());
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _initCredential();
    super.initState();
  }

  Future<void> _initCredential() async {
    //Obtener los datos del login
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString('user');
    final String? password = prefs.getString('pass');

    //Leer los valores del user y password
    if (username != null && password != null) {
      _usernameController.text = username;
      _passwordController.text = password;
      context.read<UsernameCubit>().setUsername(username);
      context.read<PasswordCubit>().setPassword(password);
    }
  }

//Diseño del Login
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: const Color.fromARGB(148, 0, 0, 0),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                const HeaderLogin(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 250),
                      const Text(
                        'Bienvenido de Vuelta',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 74, 173, 1.0),
                            fontSize: 36,
                            fontFamily: 'Raleway',                       
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<UsernameCubit, String>(
                        builder: (context, state) {
                          return UsernameTextfield(
                            controller: _usernameController,
                            onChanged: (text) {
                              context.read<UsernameCubit>().setUsername(text);
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<PasswordCubit, String>(
                        builder: (context, state) {
                          return PasswordTextfield(
                            controller: _passwordController,
                            onChanged: (text) {
                              context.read<PasswordCubit>().setPassword(text);
                            },
                          );
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                              value: true, // Cambia este valor según tu lógica
                              onChanged: (bool? value) {
                                // Maneja el estado del checkbox
                              },
                              activeColor: const Color.fromRGBO(0, 74, 173, 1.0), 
                              checkColor: const Color.fromRGBO(255, 255, 255, 1.0),
                            ),
                              const Text('Recordarme'),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Maneja la acción de olvidar contraseña
                            },
                            child: const Text(
                              '¿Olvidaste tu Contraseña?',
                              style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1.0),),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 50),
                      DefaultButton(                       
                        text: 'Ingresar',
                        onPressed: () async {
                          context.loaderOverlay.show(widgetBuilder: (progress) {
                            return DefaultProgress(
                                progress != null ? progress as String : null);
                          });

                          //Almacenar datos del servicio getLogin
                          // final res = await ServiceLogin().getLogin(
                          //     context.read<UsernameCubit>().state,
                          //     context.read<PasswordCubit>().state);

                          // if (res != null) {
                            context.loaderOverlay.hide();

                            // //Instanciar caja userBox
                            // final box = Hive.box('userBox');
                            // //Insertar los datos del JSON UserLogin en la key 'currentUser'
                            // box.put('currentUser', res.toJson());

                            // //Guardar los datos en dispositivo
                            // final SharedPreferences prefs =
                            //     await SharedPreferences.getInstance();

                            // //Obtener el idUsuario en prefs
                            // await prefs.setInt(
                            //     'nIdUsuario', res.nIdUsuario ?? 0);

                            // await prefs.setInt(
                            //     'nIdPersonal', res.nIdPersonal ?? 0);

                            // // Obtener el valor de nIdUsuario para usarlo en getUserMenu
                            // int nIdUsuario = res.nIdUsuario ?? 0;

                            // List<UserMenu> userData =
                            //     await ServiceLogin().getUserMenu(nIdUsuario);

                            // var dataUser = userData;

                            // await prefs.setInt(
                            //     'idEmpresa', dataUser.first.nIdEmp!);
                            // await prefs.setString(
                            //     'sNomEmpresa', dataUser.first.sEmpresa!);

                            // //Al darle en ingresar, seteamos la key 'auth' a true, sirve para el loadPage
                            // Future.delayed(const Duration(seconds: 3),
                            //     () async {
                            //   // await prefs.setBool('auth', true);
                            //   context.pushReplacementNamed('inicio');
                            // });

                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              title: '¡Bienvenido!',
                              text: 'Usuario',
                              showConfirmBtn: false,
                              autoCloseDuration: const Duration(seconds: 3),
                            ).then((_) {
                              context.pushReplacementNamed('inicio');
                            });

                          // } else {
                          //   context.loaderOverlay.hide();
                          //   QuickAlert.show(
                          //       context: context,
                          //       type: QuickAlertType.error,
                          //       title: '¡Error al ingresar!',
                          //       text: 'Usuario y/o Contraseña incorrectos');
                          // }
                        },
                        color: const Color.fromRGBO(255, 213, 43, 1.0),
                        
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('¿No tienes cuenta?', style: TextStyle(color: Colors.black54),),
                          TextButton(
                            onPressed: () {
                              // Maneja la acción de olvidar contraseña
                            },
                            child: const Text(
                              'Registrate',
                              style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1.0),),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const FooterLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
