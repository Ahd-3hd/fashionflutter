import 'package:flutter/material.dart';
import 'package:app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List data;
  void setupWorldtime() async {
    WorldTime instance = WorldTime();
    await instance.getData();
    setState(() {
      data = instance.myData;
      print(data[0]['id']);
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: data
            .map((single) => Item(
                single['title']['en-US'],
                single['price']['en-US'],
                single['desc']['en-US'],
                single['imageurl']['en-US']))
            .toList(),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String title;
  final String price;
  final String imageurl;
  final String desc;
  const Item(this.title, this.price, this.desc, this.imageurl);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              this.title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                color: Colors.blueGrey[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$ ${this.price}',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15,
                color: Colors.blueGrey[900],
              ),
            ),
            SizedBox(height: 10),
            Text(this.desc),
            SizedBox(height: 20),
            Image.network(
              this.imageurl,
            ),
          ],
        ),
      ),
    );
  }
}
