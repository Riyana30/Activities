import "package:flutter/material.dart";

class Login extends StatelessWidget{
Login({super.key});
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Login Page',style: TextStyle(color: Colors.black,fontSize: 20),

      ),
      centerTitle: true,),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            SizedBox(height: 250,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(decoration: InputDecoration(labelText: 'Username',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),)),
              
              ),
            ),
            SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(obscureText: true,decoration: InputDecoration(suffix: Icon(Icons.remove_red_eye),labelText: 'Password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),)),
                           
                           ),
             ),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Homepage()));
            },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 199, 124, 118)),
            
             child: Text('Login',style: TextStyle(color: Colors.black),))
            
          ],
        ),
      ) ,

    );
    
  }
}

class Homepage extends StatelessWidget{
  Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Home Page',style: TextStyle(color: Colors.black,fontSize: 20)),centerTitle: true,
       
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(4),
          children:<Widget >[
            DrawerHeader(decoration: BoxDecoration(color: Color.fromARGB(255, 234, 84, 89)),child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person,size: 50,)
                      ),
                      Text('john doe',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  )
                )
              ],
            ),
            ),Divider(),
           ListTile(
            leading: Icon(Icons.person,size: 20,),
            title: Text('Account'),
            onTap: () {
              
            },
           ) ,Divider(),
           ListTile(
            leading: Icon(Icons.settings,size: 20,),
            title: Text('Settings'),
            onTap: () {
              
            },
           ) ,Divider(),
           ListTile(
            leading: Icon(Icons.logout,size: 20,),
            title: Text('Logout'),
            onTap: () {
              
            },
           ) 
        
          ]
      ),
     
      )  ,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                children: [
                
                  Container(
                    height: 150,width: 190,
                    decoration: BoxDecoration(color:const Color.fromARGB(255, 230, 117, 117),borderRadius: BorderRadius.circular(10) ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Item 1',style: TextStyle(color: Colors.black,fontSize: 20),)),
                    ),
                  ),SizedBox(width: 13,),
                  Container(
                    height: 150,width: 190,
                    decoration: BoxDecoration(color:const Color.fromARGB(255, 230, 117, 117),borderRadius: BorderRadius.circular(10) ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Item 2',style: TextStyle(color: Colors.black,fontSize: 20),)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                
                  Container(
                    height: 150,width: 190,
                    decoration: BoxDecoration(color:const Color.fromARGB(255, 230, 117, 117),borderRadius: BorderRadius.circular(10) ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Item 3',style: TextStyle(color: Colors.black,fontSize: 20),)),
                    ),
                  ),SizedBox(width: 13,),
                  Container(
                    height: 150,width: 190,
                    decoration: BoxDecoration(color:const Color.fromARGB(255, 230, 117, 117),borderRadius: BorderRadius.circular(10) ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Item 4',style: TextStyle(color: Colors.black,fontSize: 20),)),
                    ),
                  ),
                ],
              ),SizedBox(height: 30,),
              Row(
                children: [
                
                  Container(
                    height: 150,width: 190,
                    decoration: BoxDecoration(color:const Color.fromARGB(255, 230, 117, 117),borderRadius: BorderRadius.circular(10) ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Item 5',style: TextStyle(color: Colors.black,fontSize: 20),)),
                    ),
                  ),SizedBox(width: 13,),
                  Container(
                    height: 150,width: 190,
                    decoration: BoxDecoration(color:const Color.fromARGB(255, 230, 117, 117),borderRadius: BorderRadius.circular(10) ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Item 6',style: TextStyle(color: Colors.black,fontSize: 20),)),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 30,),
              Row(
                children: [
                
                  Container(
                    height: 150,width: 190,
                    decoration: BoxDecoration(color:const Color.fromARGB(255, 230, 117, 117),borderRadius: BorderRadius.circular(10) ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Item 7',style: TextStyle(color: Colors.black,fontSize: 20),)),
                    ),
                  ),SizedBox(width: 13,),
                  Container(
                    height: 150,width: 190,
                    decoration: BoxDecoration(color:const Color.fromARGB(255, 230, 117, 117),borderRadius: BorderRadius.circular(10) ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Item 8',style: TextStyle(color: Colors.black,fontSize: 20),)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}