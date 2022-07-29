import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_alpha/Models/user_model.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  //firebaseAUth instance
  final _auth = FirebaseAuth.instance;

  //form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final firstNameEditingController =  TextEditingController();
  final secondNameEditingController =  TextEditingController();
  final emailEditingController =  TextEditingController();
  final passwordEditingController =  TextEditingController();
  final confirmPasswordEditingController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    //firstName field
    final firstNameField = TextFormField(
        style: const TextStyle(color:Colors.black,fontSize: 20.0),
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          //regex for Minimum six characters,
          RegExp regex =  RegExp(r'^.{3,}$');
          if(value!.isEmpty){
            return ("FirstName cannot be empty");
          }
          if(!regex.hasMatch(value)){
            return ("Minimum 3 characters");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:const Icon(Icons.account_circle,color: Colors.black,),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color:Colors.black)),
        ));

    //second name field
    final secondNameField = TextFormField(
        style: const TextStyle(color:Colors.black,fontSize: 20.0),
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          //regex for Minimum six characters,
          RegExp regex =  RegExp(r'^.{3,}$');
          if(value!.isEmpty){
            return ("secondName cannot be empty");
          }
          if(!regex.hasMatch(value)){
            return ("Minimum 3 characters");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:const Icon(Icons.account_circle,color: Colors.black,),
          contentPadding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color:Colors.black)),
        ));

    //email field
    final emailField = TextFormField(
        style: const TextStyle(color:Colors.black,fontSize: 20.0),
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if(value!.isEmpty){
            return ("Please enter your Email");
          }
          //reg exp for email validation
          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
            return ("Please enter valid email ");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail,color: Colors.black,),
          contentPadding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color:Colors.black)),
        ));

    //password field
    final passwordField = TextFormField(
        style: const TextStyle(color:Colors.black,fontSize: 20.0),
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          //regex for Minimum six characters,
          RegExp regex =  RegExp(r'^.{6,}$');
          if(value!.isEmpty){
            return ("password is required for login");
          }
          if(!regex.hasMatch(value)){
            return ("Minimum six characters");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key,color: Colors.black,),
          contentPadding:const  EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:const  BorderSide(color:Colors.black)),
        ));

    //confirm field
    final confirmPasswordField = TextFormField(
        style: const TextStyle(color:Colors.black,fontSize: 20.0),
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if(confirmPasswordEditingController.text != passwordEditingController.text)
          {
            return ("Password don't Match");
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key,color: Colors.black,),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm  Password",
          hintStyle:const  TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color:Colors.black)),
        ));


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.deepPurple,),
            onPressed: ()=>Navigator.pushNamed(context,'/'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
                children:<Widget> [
                  Form(
                      key: _formKey,
                      child:Column(
                        children: [
                          const SizedBox(height: 85.0,),
                          firstNameField,
                          const SizedBox(height: 35.0,),
                          secondNameField,
                          const SizedBox(height: 35.0,),
                          emailField,
                          const SizedBox(height: 35.0,),
                          passwordField,
                          const SizedBox(height: 35.0,),
                          confirmPasswordField,
                          const SizedBox(height: 18.0,),
                          Center(
                            child: ElevatedButton(onPressed: (){

                              SignUp(emailEditingController.text, passwordEditingController.text);
                            },
                              style:ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed)) {
                                      return Colors.white;
                                    }
                                    return Colors.black; // Use the component's default.
                                  },
                                ),
                              ),
                              // color: Colors.black,
                              // shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Sign In',
                                style: GoogleFonts.montserrat(fontSize: 20.0,color: Colors.white)
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ]
            ),
          ),
        ),
      ),);
  }

  void SignUp(String email,String password) async{
    if(_formKey.currentState!.validate())
    {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) =>{
        postDetailsToFirestore(),
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
  postDetailsToFirestore() async{
    //calling our firestore and then calling our user model and then finallly sending our values

    FirebaseFirestore firebaseFirestore =  FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user!.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully ");

    Navigator.pushNamed(context,' /');
  }
}