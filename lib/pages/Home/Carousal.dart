import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_alpha/components/BusinessCard.dart';
import 'package:test_alpha/pages/Home/Home.dart';
import 'package:test_alpha/pages/inside/Business_search.dart';

class Carousal extends StatefulWidget {
  List<String>? buisnesses;
  @override
  State<Carousal> createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  @override
  Widget build(BuildContext context) {
    List<String>? buisnesses = [
      "Ravada Stores",
      "vaishnavi",
      "Marlin Artss",
      "5 star bekary",
      "Venture X",
      "Test Store",
      "Test Store 11",
      "Jayalaxmi store",
      "test businessp",
      "Aut-Test PRODUCT Business",
      "Vegetable Mart",
      "Happy Cows Farm",
      "Best Jaggery",
      "Veg Shop",
      "Best Farm Solutions",
      "test royal bakery",
      "Fruitee",
      "Shankar Enterprises",
      "Vijay Caterorss",
      "Fresh bakes",
      "Bear Cafe",
      "Zara",
      "Test Udupi",
      "The Bake Master",
      "Damon Liquor Shop",
      "Poorva",
      "Vaishnavi's Store",
      "Sathiv",
      "Chic & Cool",
      "CP Pizza",
      "Damon SuperMarket",
      "Century Farm - Manipal",
      "Udupi Store",
      "Arihant's Pizza House",
      "Heavens Inn",
      "Akshaya Ice Cream",
      "Daina Sweets & Departmental Store",
      "Merchant-4",
      "Shivanandh bakery",
      "Merchant -3",
      "Agrawal Stores",
    ];


      return Scaffold(
        backgroundColor:  Color.fromRGBO(246, 246, 246,1),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black, // Change Custom Drawer Icon Color
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        drawer: Drawer(
          child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color.fromRGBO(0, 120, 170,1)),
              accountName: Text(
                  "Adithya Balanand",
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize: 15),
              ),

              accountEmail: Text(
                  "Test@gmail.com",
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize: 15),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0,color: Color.fromRGBO(0, 120, 170,1)),
                ),
              ),

            ),
            ListTile(
              leading: const Icon(Icons.home,color: Colors.black),
              title: Text(
                "Businesses",
             style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.black),
            ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Buseach()),);
              },
            ),
            ListTile(
              leading:const Icon(Icons.settings,color: Colors.black),
              title: Text(
                  "Theme",
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts,color:Colors.black), title: Text(
                "Contact Us",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 15,color:Colors.black),
            ),
              onTap: () {
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    title: Text(
                        "If you have any  Queries regarding the app or Information, Contact Us Via the below provided sources",
                    style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w300),
                    ),
                    // content: Text(
                    //   "Phone: 1234567890 ",
                    //   style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600),
                    // ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Center(
                          child:Text(
                            "Phone: 1234567890 ",
                            style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600),
                          ),),
                      ),
                      Center(
                        child:Text(
                        "Mail: xyz@gmail.com",
                        style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600),
                      ),),
                      Center(child: TextButton(onPressed: (){Navigator.pop(context);}, child:Text("close")))
                    ],
                  );
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts,color:Colors.black), title: Text(
              "Logout",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 15,color:Colors.black),
            ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),),
        body: Column(
          children: [
            SizedBox(height: 50,),
            Text(
              "eDEV.AI",
              style: GoogleFonts.montserrat(fontSize:50),
            ),
            const SizedBox(height: 140,),
            CarouselSlider(
              options: CarouselOptions(height: 300.0,autoPlay: true),
              items: buisnesses.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return BusinessCard(
                      business: i,
                    );
                  },
                );
              }).toList(),
            )
          ],
        ),
      );
  }
}
