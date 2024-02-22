import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ExampleSix extends StatefulWidget {
  const ExampleSix({super.key});

  @override
  State<ExampleSix> createState() => _ExampleSixState();
}

class _ExampleSixState extends State<ExampleSix> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        print('Account created successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Example Six',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Center(
              child: ElevatedButton(
                child: Text('Sign Up'),
                onPressed: () {
                  login(emailController.text.toString(),
                      passwordController.text.toString());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
