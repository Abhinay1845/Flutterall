import 'package:flutter/material.dart';

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
            'Digital Gold',
            style: TextStyle(color: Colors.white),
          ),
          
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Buy Gold',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Gold Rate: ₹ 9,870 / 1g',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),
              Row(
                children:[
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS05wb5kVGL8uHawyZ--RTvD6ZdgKdMh0YBek8zAkOWVOaC_zAZF5AOkQeFgTLRkgknssg&usqp=CAU',
                    height: 100,
                  ),
                  SizedBox(width: 30),
                  Image.network(
                    'https://static.vecteezy.com/system/resources/thumbnails/050/492/928/small/gold-bars-stacked-high-isolated-on-transparent-background-png.png',
                    height: 100,
                  ),
                  SizedBox(width: 30),
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUcRlIoyGnxA42QbYtttzowyZBfKA18owZQA&s',
                    height: 100,
                  ),
                  SizedBox(width: 30),
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGiTnwW5CJ23NBeHOLTvSKx44xwRN7r9pHIg&s',
                    height: 100,
                  ),
                ]
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter amount',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('PROCEED TO BUY'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your Gold Balance',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                '0 g',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}