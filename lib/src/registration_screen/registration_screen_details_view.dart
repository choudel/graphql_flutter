import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql/create_user.req.gql.dart';
import 'package:graphql_flutter/providers/ferry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/providers/auth.dart';
import 'package:provider/provider.dart';

/// Displays detailed information about a SampleItem.
class RegistrationScreenDetailsView extends StatefulWidget {
  static const routeName = '/registration_screen';
  const RegistrationScreenDetailsView({Key? key}) : super(key: key);
  @override
  _RegistrationScreenDetailsViewState createState() =>
      _RegistrationScreenDetailsViewState();
}

class _RegistrationScreenDetailsViewState
    extends State<RegistrationScreenDetailsView> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;
  void _save() async {
    _formKey.currentState?.save();

    final client = context.read();

    final request = GCreateUserReq(
      (b) => b
        ..vars.data.username = _username
        ..vars.data.password = _password,
    );
    final resp = await client.request(request).first;
    final token = resp.data?.createUser;
    print('username : $_username password: $_password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Username'),
                  onSaved: (username) {
                    _username = username;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (password) {
                    _password = password;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: _save,
                  child: const Text('Create'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
