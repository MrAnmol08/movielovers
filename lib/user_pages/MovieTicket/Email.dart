import 'package:flutter/material.dart';

class EmailInputDialog extends StatefulWidget {
  const EmailInputDialog({Key? key}) : super(key: key);

  @override
  _EmailInputDialogState createState() => _EmailInputDialogState();
}

class _EmailInputDialogState extends State<EmailInputDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendEmail(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Email validation succeeded, send email
      final email = _emailController.text;
      Navigator.pop(context, email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter Email'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Email',
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: const Text('Send'),
          onPressed: () {
            _sendEmail(context);
          },
        ),
      ],
    );
  }
}
