import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget{
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage>{
  final _formKey= GlobalKey<FormState>();
  String _email='';
  String _password='';

  void _submit()
  {
    if(_formKey.currentState!.validate())
    {
      _formKey.currentState!.save();
      print('Email: $_email');
      print('Password: $_password');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logging In')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  }
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.password),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  }
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _submit, child: Text('Log In'),
              ),
              SizedBox(height: 40),
              TextButton(onPressed: (){
                print('Forgot Password');
              }, child: Text('Forgot Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

