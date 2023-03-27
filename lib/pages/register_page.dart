import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/label_widget.dart';
import 'package:chat/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * .9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Logo(
                    titulo: 'Registro',
                  ),
                  _Form(),
                  const Labels(
                      ruta: 'login',
                      label1: '¿Ya tienes una cuenta?',
                      label2: 'Inicia sesion!'),
                  const Text('Terminos y condiciones de uso',
                      style: TextStyle(fontWeight: FontWeight.w200)),
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
        CustomInput(
          icon: Icons.perm_identity_outlined,
          placeholder: 'Nombre',
          textController: nameCtrl,
          keyboardType: TextInputType.text,
        ),
        CustomInput(
          icon: Icons.mail_lock_outlined,
          placeholder: 'Correo',
          textController: emailCtrl,
          keyboardType: TextInputType.emailAddress,
        ),
        CustomInput(
          icon: Icons.lock_outlined,
          placeholder: 'Contraseña',
          textController: passCtrl,
          isPassword: true,
        ),
        //CustomInput(),

        BotonAzul(
          text: 'Ingrese',
          onPressed: () {
            print(passCtrl.text);
          },
        )
      ]),
    );
  }
}
