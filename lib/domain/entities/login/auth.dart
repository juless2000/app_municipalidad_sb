import 'dart:convert';

//Clase Auth, posee los atributos sUsuario y sPassword, para el inicio de sesión.

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  String sUsuario;
  String sPassword;

  Auth({
    required this.sUsuario,
    required this.sPassword,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        sUsuario: json["sUsuario"],
        sPassword: json["sPassword"],
      );

  Map<String, dynamic> toJson() => {
        "sUsuario": sUsuario,
        "sPassword": sPassword,
      };
}
