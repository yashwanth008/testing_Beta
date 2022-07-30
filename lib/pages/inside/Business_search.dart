import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_alpha/pages/Home/Home.dart';

class Buseach extends StatefulWidget {
  const Buseach({Key? key}) : super(key: key);

  @override
  State<Buseach> createState() => _BuseachState();
}

class _BuseachState extends State<Buseach> {
  final Business = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){ Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,),
        ),
        backgroundColor: Color.fromRGBO(246, 246, 246,1),
        centerTitle: true,
        title:  Text(
            'Search',
          style: GoogleFonts.montserrat(fontSize: 22,fontWeight: FontWeight.w500,color:Colors.black),
                ),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                showSearch(context: context, delegate: DataSearch());
              },
              icon:Icon(Icons.search,color: Colors.black,))
        ],
      ),
      body: ListView.builder(
        itemCount: Business.length,
          itemBuilder:(context,index){
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Home(
                      businessName: this.Business[index],
                    )),
              );
            },
            child: Card(
              child: Column(
                children: [
                SizedBox(height: 25,),
              Text(
                "${Business[index]}",

                style: GoogleFonts.montserrat(fontSize: 20,color:Colors.black,fontWeight: FontWeight.bold),
              ),
            ]),
            ),
          );
          }),
    );
  }
}

class DataSearch extends SearchDelegate<String>{

  final Cites = [
    // "mumbai",
    // "chennai",
    // "banglore",
    // "delhi",
    // "kolkata",
    // "manglore",
    // "manipal",
    // "murdheswar",

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

  final recentCities = [
    "Test_Udipi",
    "Damon_Liquer_shop",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          onPressed: (){query = "";},
          icon:Icon(Icons.clear),)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on left of the app bar
    return IconButton(
      onPressed: (){
        close(context,"nill");
      },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation
        ),


    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // shom some result based on selection
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child:GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(
                    businessName: this.query,
                  )),
            );
          },
          child: Card(
            color: Colors.blue,
            child: Center(child: Text(
                query,
              style: GoogleFonts.montserrat(fontSize: 20),
            )),
          ),
        ) ,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show the searches for something
    final suggestionList = query.isEmpty?recentCities
        :Cites.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemBuilder: (context,index) =>ListTile(
          onTap: (){
            showResults(context);
          },
          leading: Icon(Icons.location_city),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0,query.length),
              style: GoogleFonts.montserrat(
                color: Colors.black,fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: GoogleFonts.montserrat(
                    color: Colors.grey
                  )
                )
              ]
            ),
          ),
        ),
    itemCount: suggestionList.length,
    );
  }
  
}