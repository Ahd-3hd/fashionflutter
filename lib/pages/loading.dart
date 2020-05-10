import 'package:flutter/material.dart';
import 'package:app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List data;
  List extractedData;
  bool isLoading = true;
  String category = 'all';
  void setupWorldtime() async {
    WorldTime instance = WorldTime();
    await instance.getData();
    setState(() {
      data = instance.myData;
      extractedData = data;
      isLoading = false;
    });
  }

  void changeCatgeory(cat) {
    setState(() {
      isLoading = true;
    });
    setState(() {
      category = cat;
    });
    setState(() {
      if (cat == 'all') {
        extractedData = data;
      } else {
        extractedData = data.where((x) => x['type']['en-US'] == cat).toList();
      }
    });
    setState(() {
      isLoading = false;
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
      appBar: AppBar(
        title: Text('Elegant Lady'),
        backgroundColor: Colors.purple,
      ),
      body: isLoading
          ? Text('Loading')
          : Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                          onPressed: () {
                            changeCatgeory('all');
                          },
                          child: Text('All')),
                      FlatButton(
                          onPressed: () {
                            changeCatgeory('dress');
                          },
                          child: Text('Dresses')),
                      FlatButton(
                          onPressed: () {
                            changeCatgeory('coat');
                          },
                          child: Text('Coats')),
                      FlatButton(
                          onPressed: () {
                            changeCatgeory('abaya');
                          },
                          child: Text('Abayas'))
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: extractedData
                        .map((single) => Item(
                            single['title']['en-US'],
                            single['price']['en-US'],
                            single['desc']['en-US'],
                            single['imageurl']['en-US']))
                        .toList(),
                  ),
                ),
              ],
            ),
    );
  }
}

// if (category == single['type']['en-US']) {
//   return Item(
//       single['title']['en-US'],
//       single['price']['en-US'],
//       single['desc']['en-US'],
//       single['imageurl']['en-US']);
// } else if (category == 'all') {
//   return Item(
//       single['title']['en-US'],
//       single['price']['en-US'],
//       single['desc']['en-US'],
//       single['imageurl']['en-US']);
// }

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

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
