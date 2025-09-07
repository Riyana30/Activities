import 'package:empetz/favcart.dart';
import 'package:flutter/material.dart';

class pets extends StatefulWidget {
  pets({super.key});
  @override
  State<pets> createState() => _dogpage();
  // TODO: implement createState
}

class _dogpage extends State<pets> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 150, 30, 171),
         actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/fav');
          }, icon: Icon(Icons.favorite,size: 30,color: Colors.white,)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart');
          }, icon: Icon(Icons.shopping_cart,size: 30,color: Colors.white,))

        ],
       
      ),
      backgroundColor: Color.fromARGB(255, 199, 98, 217),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Center(
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('assets/buyerdog.jpg'),
                          
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 120,),
                  Column(
                    children: [
                      Center(child: Text('Jessy',style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold,fontFamily: 'IrishGrover'),)),
                      Text("poomeranian",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'InknutAntiqua'),),
                    ],
                  ),
                 SizedBox(width: 70,),
                  Column(
                    children: [
                       IconButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>reporting()));
                      }, icon: Icon(Icons.report,color: Colors.black,)),
                      IconButton(onPressed: (){
                        Navigator.pushNamed(context, '/fav');
                      }, icon: Icon(Icons.favorite,color: Colors.black,)),
                      IconButton(onPressed: (){
                        Navigator.pushNamed(context, '/share');
                      }, icon: Icon(Icons.share,color: Colors.black,)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                Container(
                  width: 120,height: 80,
                  decoration: BoxDecoration(color:  const Color.fromARGB(255, 224, 168, 234),borderRadius: BorderRadius.circular(20)),
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [Text("3 Months",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'InknutAntiqua'),),
                        Text("Age",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'InknutAntiqua'),),
                    
                    
                      ],
                    
                    ),
                  ),
                ),
                 Container(
                  width: 120,height: 80,
                  decoration: BoxDecoration(color: const  Color.fromARGB(255, 224, 168, 234),borderRadius: BorderRadius.circular(20)),
               
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [Text("4.3 Kg",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'InknutAntiqua'),),
                        Text("Weight",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'InknutAntiqua'),),
                    
                    
                      ],
                    
                    ),
                  ),
                ),
                  
                ],
              ),
              SizedBox(height: 20,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                Container(
                  width: 120,height: 80,
                  decoration: BoxDecoration(color: const  Color.fromARGB(255, 224, 168, 234),borderRadius: BorderRadius.circular(20)),
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [Text("11 Inches",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'InknutAntiqua'),),
                        Text("Height",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'InknutAntiqua'),),
                    
                    
                      ],
                    
                    ),
                  ),
                ),
                 Container(
                  width: 120,height: 80,
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 224, 168, 234),borderRadius: BorderRadius.circular(20)),
               
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [Text("Female",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'InknutAntiqua'),),
                        Text("Gender",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'InknutAntiqua'),),
                    
                    
                      ],
                    
                    ),
                  ),
                ),
                  
                ],
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Vaccinated on 10/08/2022",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'InknutAntiqua'),),
              ),
              SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                    width: 400,height: 100,
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 224, 168, 234),borderRadius: BorderRadius.circular(20)),
                 
                    child: Row(
                      children: [
                        SizedBox(width: 30,),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Text("R",style: TextStyle(color: Colors.black,fontSize: 20,),),
                        ),
                        SizedBox(width: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30,),
                            Text('Mai',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'InknutAntiqua'),),
                             
                            Text('Posted one day ago..',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: 'InknutAntiqua'),),
                          ],
                        ),
                        
                      ],
                      
                 
                 
                    ),
                    
                 
                    
                  ),
               ),
               SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 18),
                 child: Text('Pet Story',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,fontFamily: 'InknutAntiqua'),),
               ), SizedBox(height: 20,),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "This litle sweetie is 3 months year Female dog.she has been at the shelter since she was born,and we’d really love to see her get into a new home soon!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'InknutAntiqua',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>chat()));
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                 child: Row(
                   children: [
                    Icon(Icons.chat,size: 40,color: Colors.black,),
                    SizedBox(width: 10,),
                     Text("CHAT", style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InknutAntiqua',
                          color: Colors.black,
                        ),),
                   ],
                 )), ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                 child: Row(
                   children: [
                    Icon(Icons.phone_in_talk_outlined,size: 40,color: Colors.black,),
                    SizedBox(width: 10,),
                     Text("CALL", style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InknutAntiqua',
                          color: Colors.black,
                        ),),
                   ],
                 )),
              ],
            ),
             

            ],
          ),
        ),
      ),
    );
  }
}

class chat extends StatelessWidget{
  chat({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 150, 30, 171),
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,child: Text('R',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
          
        ),
        title: Text('John', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InknutAntiqua',
                          color: Colors.black,
                        ),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam,size: 30,color: Colors.white,)),
           IconButton(onPressed: (){}, icon: Icon(Icons.call,size: 30,color: Colors.white,)),
           IconButton(onPressed: (){}, icon: Icon(Icons.menu,size: 30,color: Colors.white,)),
           

        ],

      ),
      backgroundColor: Color.fromARGB(255, 199, 98, 217),
      body: Column(
        children: [
          Container(

          )
        ],
      ),
    );
  }
}