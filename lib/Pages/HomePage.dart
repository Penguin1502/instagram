import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {

  var data = []; //put into empty array basically. stored as double array.



  @override
  State<HomePage> createState() {
    return _HomePageState();
  } //Touches OOP. Creating an instance of the other class. Hence why its a stateful widget.

}

class _HomePageState extends State<HomePage> {

  var scroll = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    getData();
    scroll.addListener(() {
      //listener. ah yes. gr8.
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        addNewData();
      }
      print(scroll.position.pixels);
    });

    super.initState();
    //init state does not support async.
  }



  getData() async {
    var result = await http.get(Uri.parse(
        "https://codingapple1.github.io/app/data.json")); //wait before decoding
    var result2 = jsonDecode(result.body); //Status code  = Get request
    setState(() {
      widget.data = result2;
    });
  }

  addNewData() async {
    //define and use function on the spot is possible. Only usable within this loop tho. And once.
    var result = await http.get(Uri.parse(
        "https://codingapple1.github.io/app/data.json")); //wait before decoding
    var result2 = jsonDecode(result.body);
    print(result2);
    setState(() {
      widget.data.add(result2[0]);
      widget.data.add(result2[1]);
    });

  }




  @override
  Widget build(BuildContext context) {
    if (widget.data.isNotEmpty) {
      return ListView.builder(
          itemCount: widget.data.length,
          controller: scroll,
          itemBuilder: (c, i) {
            //뭘로 콘트롤하는지 말을 안하면 cant track listview's scroll position
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(widget.data[i]['image'], fit: BoxFit.fitWidth),
                  Text("Likes: " + widget.data[i]['likes'].toString()),
                  Text("User: " + widget.data[i]['user']),
                  Text(
                    widget.data[i]['content'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]);
          });
    } else {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      );
    }
  }
}


