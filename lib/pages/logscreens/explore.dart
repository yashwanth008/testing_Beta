import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
    ezz(){
      print('hello');
  }

    //form key
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                return Colors.black; // Use the component's default.
              },
            ),
          ),
        child: Text(
            'Explore',
          style: GoogleFonts.montserrat(
                fontSize: 18,
          )
        ),
    onPressed: () {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    context: context,
    builder: (BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.7,
      child: SingleChildScrollView(
        physics :const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Form
                (
                  key: _formKey,
                  child:Column(
                    children: [
                      const SizedBox(height:50),
                      SizedBox(
                        width: 320,
                        child: TextFormField(
                            style:const TextStyle(color:Colors.black,fontSize: 20.0),
                            autofocus: false,
                            controller: emailController,
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
                              emailController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.mail,color: Colors.black,),
                              contentPadding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Email",
                              hintStyle: const TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                  borderSide:const BorderSide(color:Colors.black)),
                            )),
                      ),
                      const SizedBox(height: 20.0,),
                      SizedBox(
                        width: 320,
                        child: TextFormField(
                          style:  const TextStyle(color:Colors.black,fontSize: 20.0),
                          autofocus: false,
                          controller: passwordController,
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
                            return null;
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.vpn_key,color: Colors.black,),
                            contentPadding:const  EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Password",
                            hintStyle:const  TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                borderSide:const BorderSide(color:Colors.black)),
                          ),),
                      ),
                      const  SizedBox(height: 15.0,),
                      Center(
                        child: TextButton(onPressed: (){
                          Navigator.pushNamed(context, '/Home');
                        },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // background
                             onPrimary: Colors.white, // foreground
                             ),
                          child: Text(
                            'Login',
                            style: GoogleFonts.montserrat(
                              fontSize: 20.0,color: Colors.white
                            )
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, '/ForgotPassword');
                      },

                          child:Text(
                            "Forgot Password?",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.montserrat(
                                color: Colors.black
                            ),
                          )),

                      Row(
                        children: [
                          const SizedBox(width: 100,),
                          Text(
                            "Don't have an Account?",
                            style: GoogleFonts.montserrat(
                                color: Colors.black),
                          ),
                          TextButton(onPressed: ()=>Navigator.pushNamed(context,'/SignUp'),
                              child: Text('SignUp',style:GoogleFonts.montserrat(
                                  color: Colors.black
                              ))),

                        ],
                      ),
                      // const SizedBox(height: 65.0,),

                    ],
                  )),
            ),

          ],
        ),
        ),
    );
    },
    );
    },
    ),
    );
  }
}




// SizedBox(
// height: 250,
// child: Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// SizedBox(
// width: 145,
// child: TextButton(
// style: ElevatedButton.styleFrom(
// primary: Colors.black, // background
// onPrimary: Colors.white, // foreground
// ),
// onPressed:ezz,
// child:const Text(
// 'Sign Up',
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// )),
// ),
// SizedBox(
// width: 145,
// child: TextButton(
// style: ElevatedButton.styleFrom(
// primary: Colors.black, // background
// onPrimary: Colors.white, // foreground
// ),
// onPressed:ezz,
// child:const Text(
// 'Login',
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// )),
// )
// ],
// ),
// ),
// );