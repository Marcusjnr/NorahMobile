import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:norah/custom_widgets/custom_drop_down.dart';
import 'package:norah/custom_widgets/custom_text_field.dart';
import 'package:norah/custom_widgets/gradient_button.dart';
import 'package:norah/providers/register_screen_provider.dart';
import 'package:norah/services/hive_service.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = new TextEditingController();
    TextEditingController _firstNameController = new TextEditingController();
    TextEditingController _lastNameController = new TextEditingController();
    TextEditingController _passwordController = new TextEditingController();


    Widget _space(){
      return SizedBox(height: 30.0,);
    }

    return Consumer<RegisterProvider>(
      builder: (BuildContext context, RegisterProvider registerProvider, Widget child){
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
                    controller: _firstNameController,
                    label: "FirstName",
                    icon: Icons.email,
                    inputType: TextInputType.text,
                    password: false,
                  ),

                  _space(),

                  CustomTextField(
                    controller: _lastNameController,
                    label: "LastName",
                    icon: Icons.email,
                    inputType: TextInputType.text,
                    password: false,
                  ),

                  _space(),

                  CustomDropDown(
                    hint: "Married ?",
                    icon: Icons.account_circle,
                    whichDropDown: 'Married',
                  ),

                  _space(),

                  CustomDropDown(
                    hint: "Got Kids ?",
                    icon: Icons.account_circle,
                    whichDropDown: "kids",
                  ),

                  _space(),

                  CustomTextField(
                    controller: _passwordController,
                    label: "Password",
                    icon: Icons.email,
                    inputType: TextInputType.text,
                    password: true,
                  ),

                  _space(),

                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: InkWell(
                      onTap: (){

                        bool gotKids;
                        bool married;
                        String email = _emailController.text;
                        String firstName = _firstNameController.text;
                        String lastName = _lastNameController.text;
                        String password = _passwordController.text;

                        if(email.isEmpty || firstName.isEmpty|| lastName.isEmpty||
                            registerProvider.dropDownValueMarried.isEmpty ||
                            registerProvider.dropDownValueGotKids.isEmpty){
                          print("Must fill in all fields");
                        }else{
                          if(registerProvider.dropDownValueMarried == "Yes"){
                            married = true;
                          }else{
                            married = false;
                          }

                          if(registerProvider.dropDownValueGotKids == "Yes"){
                            gotKids = true;
                          }else{
                            gotKids = false;
                          }

                          HiveService.putUserFirstName(firstName);

                          registerProvider.register(context,email,firstName,lastName,married,gotKids,password);
                        }


                      },
                      child: registerProvider.loading == false
                          ? GradientButton(text: "SignUp",)
                          : CircularProgressIndicator(),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
