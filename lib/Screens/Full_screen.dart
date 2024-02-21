import'package:flutter/material.dart';


class Full_Page extends StatefulWidget {
  final String Imageurl;
  const Full_Page({super.key,required this.Imageurl});

  @override
  State<Full_Page> createState() => _Full_PageState();
}

class _Full_PageState extends State<Full_Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(
              child:Image.network(widget.Imageurl),
            )),
            GestureDetector(
              onTap: (){
              },
              child: Container(
                height:50,
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Text('SET WALLPAPER ',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                ),
              ),
            )

          ],

        ),
      ),
    );
  }
}



