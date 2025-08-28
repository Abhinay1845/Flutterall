import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Gold Purchase',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Gold Ornaments',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            MyListItem(goldname: '24k Ring 1', imageurl: 'assets/images/image1.jpg', price: 30000),
            MyListItem(goldname: '24k Ring 2', imageurl: 'assets/images/image2.jpg', price: 25000),
            MyListItem(goldname: '24K Bracelet 1', imageurl: 'assets/images/image3.jpg', price: 70000),
            MyListItem(goldname: '24K Gold Chain Types', imageurl: 'assets/images/image4.jpg', price: 65000),
            MyListItem(goldname: '24K Gold Chain 2', imageurl: 'assets/images/image5.jpg', price: 76000),
            MyListItem(goldname: '24K Gold Chain 2', imageurl: 'assets/images/image7.webp', price: 76000),
          ],
        )
      ),
    );
  }
}

class MyListItem extends StatelessWidget{
  final String goldname, imageurl;
  final double price;
  MyListItem({super.key, required this.goldname, required this.imageurl, required this.price});

  final inrFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹',decimalDigits: 2);
  @override
  Widget build(BuildContext context){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.limeAccent,width: 0.5),
      ),
      elevation: 1,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            color: Colors.lightBlueAccent,
            width: 200,
            height: 200,
            child: Image.asset(imageurl, width: 100,height: 100,fit: BoxFit.cover,),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(goldname,style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600
              )),
              SizedBox(height: 20),
              Text(inrFormat.format(price), style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600
              )),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){},
               style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 25, 65, 1),
                foregroundColor: Colors.white, 
               ),
               child: Text("Buy Now")),
            ],
          )
        ],
      ),
    );
  }
}
