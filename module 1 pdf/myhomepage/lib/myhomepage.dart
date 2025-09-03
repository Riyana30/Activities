import 'package:flutter/material.dart';
class Myhomepage extends StatelessWidget{
  Myhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        leading: Icon(Icons.settings),
        title: Text("Home",
        style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
        actions: [
          Icon(Icons.search),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
        
          child: Column(
      
            children: [
              CircleAvatar(radius: 100,
              backgroundColor: Colors.green,
              child: Icon(Icons.person,color: Colors.white,size: 80,),),
                SizedBox(height: 50.0),
                        Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
                 child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                 ),),
                 SizedBox(height: 20.0),
                        Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
                 child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                 ),),
                 SizedBox(height: 60.0),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      print('Done clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      
                      backgroundColor: Colors.green,shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                        
                        
                      ),fixedSize: Size(190, 60)
                    ), child: Text('Done',style: TextStyle(color: Colors.white,fontSize: 20),),),
                    SizedBox(width: 10),
                    
                    ElevatedButton(onPressed: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                        
                          content: Text('Are you sure?'),
                          actions: <Widget>[
                            TextButton( child: Text('Cancel'),onPressed: (){
                              Navigator.of(context).pop();
                            },
                          ),
                            TextButton(child: Text('Ok'),onPressed: (){
                              Navigator.of(context).pop();
                            }, ),

                          ],
                        );
                      });
                    },
                     child: Text(
                      'clear',style: TextStyle(color: Colors.white,fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),fixedSize: Size(190, 60)
                            )
                   ),
                  ],
                 )
            ],
          ),
        ),
      ),
      




      );

        
        
        
      
    
  }
}