import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;



class Main_Screen extends StatefulWidget {
  const Main_Screen({super.key});

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {

  List images =[];
  int page=1;
  @override
  // loadmore()async{
  //   setState(() {
  //     page=page+1;
  //   });
  //   String url='https://api.pexels.com/v1/curated?per_page=80&page='+page.toString();
  //   await http.get(Uri.parse(url),
  //       headers: {'Authorization':'oe66crTvrJbHg0Daqt6QPS1MlFks9JC6LVj0AJfeM6KmC08HSufSJRiZ'}).then((value) {
  //     Map response = jsonDecode(value.body);
  //     setState(() {
  //       images.addAll(response['photos']);
  //     });
  //   }
  void initState(){
    super.initState();
    fetchapi();
  }

  fetchapi()async{
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers: {'Authorization':'oe66crTvrJbHg0Daqt6QPS1MlFks9JC6LVj0AJfeM6KmC08HSufSJRiZ'}).then((value){
      Map response = jsonDecode(value.body);
      setState(() {
        images=response['photos'];
      });
      print(images);

    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Expanded(child: Container(
           child: GridView.builder(itemCount:images.length,gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,mainAxisSpacing:4,childAspectRatio:2/4,crossAxisSpacing: 5) ,
               itemBuilder: (context,index){
             return Container(
               color:Colors.white,
               child: Image.network(
                 images[index]['src']['tiny'],
                 fit:BoxFit.cover,
               ),
             );
           }),
         )),
          Container(
            height:50,
            width: double.infinity,
            color: Colors.black,
            child: Center(
              child: Text('LOAD MORE ',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            ),
          )
        ],
      ),
    );
  }
}
