import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'name@domain.com',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget passwordField(bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: '********',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        return print('Submitted');
      },
      child: Text('Submit'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.teal),
        padding: MaterialStateProperty.all(EdgeInsets.all(25.0)),
      ),
    );
  }
}
