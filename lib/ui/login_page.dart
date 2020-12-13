import 'package:flutter/material.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(children: [
              Text("User"),
              StreamBuilder(
                  stream: bloc.email,
                  builder: (contex, snapshopt) {
                    return TextField(
                        onChanged: bloc.changeEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'ejemplo@hotmail.com',
                            labelText: 'Email address',
                            errorText: snapshopt.error));
                  })
            ]),
            Column(
              children: [
                Text("Password"),
                StreamBuilder(
                  stream: bloc.password,
                  builder: (contex, snapshopt) {
                    return TextField(
                      onChanged: bloc.changePassword,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          errorText: snapshopt.error),
                    );
                  },
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            submitButton()
          ],
        ));
  }

  Widget submitButton() {
    return StreamBuilder(
        stream: bloc.validateSubmit,
        builder: (context, snapshot) {
          return RaisedButton(
            shape: StadiumBorder(),
            onPressed: ()async {
               await snapshot.hasData ? bloc.submit() : null;
            },
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightBlue,
          );
        });
  }
}
