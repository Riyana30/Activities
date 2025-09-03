import 'package:flutter/material.dart';
class Instagram extends StatelessWidget{
  Instagram({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Instagram',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily:'IrishGrover'),),
        actions: [
          Icon(Icons.favorite,),
          SizedBox(width: 15,),
          Icon(Icons.messenger)
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: '',),
        BottomNavigationBarItem(icon: Icon(Icons.search),
        label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.post_add),
        label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.settings),
        label: '',),
        BottomNavigationBarItem(icon: Icon(Icons.cabin),
        label: '',),
        
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.person,color: Colors.white,size: 20,),
                    ),
                    Text('Your story')
                  ],
                ),
                SizedBox(width: 10,),
                 Column(
                   children: [
                     CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.person,color: Colors.white,size: 20,),
                                   ),
                                   Text('sivani'),
                   ],
                 ),
                SizedBox(width: 10,),
                 Column(
                   children: [
                     CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.pink,
                      child: Icon(Icons.person,color: Colors.white,size: 20,),
                                   ),
                                   Text('vivek'),
                   ],
                 ),
                SizedBox(width: 10,),
                 Column(
                   children: [
                     CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.yellow,
                      child: Icon(Icons.person,color: Colors.white,size: 20,),
                                   ),
                                   Text('silpa'),
                   ],
                 ),
               
              ],
            ),
            SizedBox(height: 30,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
        
                Padding(padding: EdgeInsets.all(5)),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person,color: Colors.white,weight: 10,),
                  
                ),
                SizedBox(width: 10,),
                Text('laptop',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(width: 270,),
                Icon(Icons.more_vert),
              ],
            ),
            Container(
              height: 290,
              width: 2370,
              child: Image.asset('assets/hello.jpg'),
            ),
            Row(
              children: [
                Icon(Icons.favorite_border),
                Text('100'),
                SizedBox(width: 10,),
                Icon(Icons.comment),
                SizedBox(width: 10,),
                Icon(Icons.telegram_outlined),
                Text('18'),
                SizedBox(width: 250,),
                Icon(Icons.save),
              ],
            ),
            SizedBox(height: 30,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
        
                Padding(padding: EdgeInsets.all(5)),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.pink,
                  child: Icon(Icons.person,color: Colors.white,weight: 10,),
                  
                ),
                SizedBox(width: 10,),
                Text('Animal',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(width: 270,),
                Icon(Icons.more_vert),
              ],
            ),
            Container(
              height: 290,
              width: 2370,
              child: Image.asset('assets/dog.jpg'),
            ),
            Row(
              children: [
                Icon(Icons.favorite_border),
                Text('100'),
                SizedBox(width: 10,),
                Icon(Icons.comment),
                SizedBox(width: 10,),
                Icon(Icons.telegram_outlined),
                Text('50'),
                SizedBox(width: 250,),
                Icon(Icons.save),
              ],
            )
          ],
        ),
      ),

    );
  }
}