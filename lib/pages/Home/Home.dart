import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:test_alpha/Secret/businessCode.dart';
import 'package:test_alpha/Models/items.dart';
import 'package:test_alpha/pages/inside/failureChart.dart';

class Home extends StatefulWidget {
  final String? businessName;
  String? url;
  Home({this.businessName});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Items> _Content = <Items>[];
  bool _isloading = true;

  Future<List<Items>> fetchContent() async {
    var response = await http.get(Uri.parse(widget.url!));
    print(response.body);
    var contents = <Items>[];

    if (response.statusCode == 200) {
      var contentsJson = json.decode(response.body);
      for (var contentJson in contentsJson) {
        contents.add(Items.fromJson(contentJson));
        print(contentJson["product_name"]);
        print(contentJson["sku_id"]);
      }
      //print(contents);
    }
    return contents;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BuisnessCode obj = BuisnessCode();
    String? urlCode = obj.Code[widget.businessName];
    widget.url =
    "https://api.test.esamudaay.com/api/v1/businesses/$urlCode/report";
    fetchContent().then((value) {
      setState(() {
        _isloading = false;
        _Content.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246,1),
      appBar: AppBar(
        leading:IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FailureChart(
                      business: widget.businessName,
                    )),
              );
            },
            icon: Icon(Icons.bar_chart,size: 33,),color: Colors.black,)
        ],
        backgroundColor:Color.fromRGBO(246, 246, 246,1),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
            "${widget.businessName}".toUpperCase(),
          style: GoogleFonts.montserrat(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 18),
        ),
      ),
      body: _isloading
          ? const Center(
        child:  CircularProgressIndicator(),
      )
          : Padding(
          padding:EdgeInsets.fromLTRB(2,15,2, 0),
      child:ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromRGBO(0, 120, 170,1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ),
            child: ExpansionTile(
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Missing product images",
                  style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),

                ),
                Text(
                  "Missing manufacture name",
                  style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),

                ),
                Text(
                  "Missing manufacture address",
                  style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),

                ),
                SizedBox(height: 8,),
              ],
              title: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    // Text(_Content[index].business!),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: ListTile(
                        title: Text(
                          "ID: #${_Content[index].id}"
                            ,
                          style: GoogleFonts.montserrat(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white70),
                        ),
                        subtitle: Text(

                          _Content[index].product!.toUpperCase(),
                          style: GoogleFonts.montserrat(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white70),
                        ),
                      ),
                    ),

                    // ListView.builder(
                    //     itemCount: 10,
                    //     itemBuilder: (context, index) {
                    //       return Text("hello");
                    //     })
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _Content.length,
      ),
      )
    );
  }
}
