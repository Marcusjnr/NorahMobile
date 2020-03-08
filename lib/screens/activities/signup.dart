

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norah/custom_widgets/custom_drop_down.dart';
import 'package:norah/custom_widgets/custom_text_field.dart';
import 'package:norah/custom_widgets/gradient_button.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController;

    Widget _space(){
      return SizedBox(height: 30.0,);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("NORAH", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: ListView(
            children: <Widget>[
              CustomTextField(
                controller: _emailController,
                label: "Email",
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
                password: false,
              ),

              _space(),

              CustomTextField(
                controller: _emailController,
                label: "FirstName",
                icon: Icons.email,
                inputType: TextInputType.text,
                password: false,
              ),

              _space(),

              CustomTextField(
                controller: _emailController,
                label: "LastName",
                icon: Icons.email,
                inputType: TextInputType.text,
                password: false,
              ),

              _space(),

              CustomDropDown(
                hint: "Married ?",
                icon: Icons.account_circle,
              ),

              _space(),

              CustomDropDown(
                hint: "Got Kids ?",
                icon: Icons.account_circle,
              ),

              _space(),

              CustomTextField(
                controller: _emailController,
                label: "Password",
                icon: Icons.email,
                inputType: TextInputType.text,
                password: true,
              ),

              _space(),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: GradientButton(
                  text: "SignUp",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
