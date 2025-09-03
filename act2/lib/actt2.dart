import 'package:flutter/material.dart';
class acttt extends StatefulWidget{
  acttt({super.key});
  @override
  State<StatefulWidget> createState()=>_acttt ();
  
}
 class _acttt extends State<acttt>{
final TextEditingController usernameController=TextEditingController();
final TextEditingController passwordController=TextEditingController();
String? usernameError;
String? passwordError;

String? validateUsername(String username){
  if(RegExp(r'[!@#<>?":_`~;[\]\\|=+(*&^%0-9-]').hasMatch(username)){
    return 'Username must not contain special characters or numbers';
  }
  if(username.isEmpty){
    return 'Username cannot be empty';
  }
  return null;
}
String? validatepassword(String password){
  if(password.length<6){
    return 'Password must be at least 6 characters long';
  }
  if(!RegExp(r'[A-Z]').hasMatch(password)){
    return 'Password must contain at least one uppercase letter';
  }
  if(!RegExp(r'[0-9]').hasMatch(password)){
    return 'Password must contain at least one number';
  }
  return null;
}


@override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Login page'),centerTitle: true,
      backgroundColor: Colors.amber,
    ),
    body: Center(child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: 'username',
              errorText: usernameError,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
            onChanged: (value) {
              setState(() {
                usernameError=validateUsername(value);
              });
            },
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              errorText: passwordError,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
            onChanged: (value) {
              setState(() {
                passwordError=validatepassword(value);
              });
            },
          ),
        ),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){
          setState(() {
            usernameError=validateUsername(usernameController.text);
            passwordError=validatepassword(passwordController.text);
          });
          if(usernameError==null&&passwordError==null){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successful')));
          }
        }, child: Text('Login'))
      ],
    ),),

  );
  }
 }