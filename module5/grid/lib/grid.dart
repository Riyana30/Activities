import 'package:flutter/material.dart';

class grid1 extends StatefulWidget{
grid1({super.key});
@override
  State<grid1> createState()=> _grids();
}

class _grids extends State<grid1>{
  List<String>fruits=['Apple','Orange','Grapes'];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Fruits'),
      ),
      body: Padding(padding: EdgeInsets.all(8.0),
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8), itemBuilder: (context,index){
        var xindex=index % 8;
        var yindex=(index/8).floor();
        return Container(
          color: (xindex + yindex).isEven? const Color.fromARGB(255, 150, 20, 20):Colors.white,
          child: Stack(
            children: [],
          ),
        );
      }),
      
      
      
      
      
      
      ),
      



    );
  }
}