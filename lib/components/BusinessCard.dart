import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_alpha/pages/Home/Home.dart';

class BusinessCard extends StatelessWidget {
  final String? business;
  const BusinessCard({this.business});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                businessName: this.business,
              )),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
          color: const Color.fromRGBO(7, 34, 39, 1),
          child: Column(
            children: [
              SizedBox(height: 25,),
              Text(
                  "$business",
                style: GoogleFonts.montserrat(fontSize: 20,color:Color.fromRGBO(174, 254, 255, 1)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 25,15,15),
                child: Text(
                      "text ever since the 1500s, when an unknown printer took"
                      "a galley of type and scrambled it to make a type specimen."
                      "bookIt has survived not only five centuries, but also the leap",
                  style: GoogleFonts.montserrat(fontSize: 20.0,color: Colors.white70),

                ),
              ),
              Text(
                    "To Know More Tap",
                    style: GoogleFonts.montserrat(fontSize: 15.0,color: Colors.white),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
