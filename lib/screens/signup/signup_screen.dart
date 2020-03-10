import 'package:flutter/material.dart';
import 'package:xlo/blocs/signup_bloc.dart';
import 'package:xlo/screens/signup/widgets/field_title.dart';
import 'package:xlo/screens/signup/widgets/password_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreemState createState() => _SignUpScreemState();
}

class _SignUpScreemState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpBloc _signUpBloc;

  @override
  void initState() {
    super.initState();

    _signUpBloc = SignUpBloc();
  }

  @override
  void dispose() {
    _signUpBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Cadastrar'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            const FieldTitle(
              title: 'Nome',
              subtitle: 'Insira nome completo.',
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Exemplo: João s.',
              ),
              validator: (text) {
                if (text.length < 6) return 'Apelido muito curto';
                return null;
              },
            ),
            const SizedBox(
              height: 26,
            ),
            const FieldTitle(
              title: 'Email',
              subtitle: 'Enviaremos um e-mail de confirmação.',
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (text) {
                if (text.length < 6 || !text.contains('@'))
                  return 'E-mail inválido';
                return null;
              },
              onSaved: (text) {},
            ),
            const SizedBox(
              height: 26,
            ),
            const FieldTitle(
              title: 'Senha',
              subtitle: 'Use letras, números e caracteres especiais.',
            ),
            PasswordField(
              onSaved: (text) {},
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              height: 50,
              child: RaisedButton(
                color: Colors.pink,
                disabledColor: Colors.pink.withAlpha(150),
                child: Text(
                  'Cadastre-se',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: _signUp,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }
}