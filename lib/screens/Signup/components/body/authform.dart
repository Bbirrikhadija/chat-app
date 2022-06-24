
import 'package:flutter/cupertino.dart';

class Authform extends StatefulWidget {
 final void Function (String email, String password, String firstname, String lastname,
      bool islogin, BuildContext ctx)submitauthform;
  final bool _isLoading;

  Authform(this.submitauthform, this._isLoading);

  @override
  Authformstate createState() => Authformstate();
}

class Authformstate extends State<Authform> {
  final formkey = GlobalKey<FormState>();
  bool islogin = true;
  String email = "";
  String password = "";
  String firstname = "";
  String lastname ="";
  void submit() {
    final isvalid = formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isvalid) {
      formkey.currentState!.save();
      widget.submitauthform(
          email.trim(), password.trim(), firstname.trim(), lastname.trim(),islogin , context);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}