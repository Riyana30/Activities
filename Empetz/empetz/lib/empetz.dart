import 'dart:async';

import 'package:empetz/favcart.dart';
import 'package:empetz/pets.dart';
import 'package:flutter/material.dart';

class empetz extends StatefulWidget {
  empetz({super.key});
  @override
  State<empetz> createState() => _splashscreen();
 
}

class _splashscreen extends State<empetz> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets, size: 100),
            SizedBox(height: 10),
            Text(
              "Empetz",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'IrishGrover',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class login extends StatelessWidget {
  login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 98, 217),
      body: SingleChildScrollView(
        child: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 270),
                Icon(Icons.person, size: 130),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/homepage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),

                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(height: 190),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class reg extends StatefulWidget {
  reg({super.key});
  @override
  State<reg> createState() => _reg1();
}

class _reg1 extends State<reg> {
  int _selectedValue = 0;
  bool _ischecked = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 98, 217),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Icon(Icons.person_outlined, size: 100),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 15),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Gender:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Radio<int>(
                            value: 1,
                            groupValue: _selectedValue,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20),
                          Row(
                            children: [
                              Radio<int>(
                                value: 2,
                                groupValue: _selectedValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedValue = value!;
                                  });
                                },
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      suffix: Icon(Icons.remove_red_eye),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      suffix: Icon(Icons.remove_red_eye),
                      labelText: 'Confirm password',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Place',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _ischecked,
                        onChanged: (value) {
                          setState(() {
                            _ischecked = value!;
                          });
                        },
                      ),
                      Text(
                        'I agree with terms and conditions',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 150, 30, 171),
        iconTheme: IconThemeData(
          color: Colors.white,size: 30
        ),
          title: Text(
            'Empetz',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'IrishGrover',
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Favourite(),));
              },
              icon: Icon(Icons.favorite, size: 30, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>cart(),));
              },
              icon: Icon(Icons.shopping_cart, size: 30, color: Colors.white),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'BUYER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'SELLER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ), drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.all(0),
          children:<Widget >[
            DrawerHeader(decoration: BoxDecoration(color: Color.fromARGB(255, 150, 30, 171)),child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Text('R',style: TextStyle(fontFamily: 'ÍrishGrover',fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      Text('Name',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  )
                )
              ],
            )
            ),
            ListTile(
              leading: Icon(Icons.home,size: 35,),
              title: Text("Home",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
              onTap: (){
                Navigator.pop(context);
              },
            ),Divider(),
             ListTile(
              leading: Icon(Icons.person,size: 35,),
              title: Text("Profile",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>profile1(),),);
              },
            ),Divider(),
             ListTile(
              leading: Icon(Icons.favorite,size: 35,),
              title: Text("Favourite",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
              onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Favourite(),),);},
            ),Divider(),
            ListTile(
              leading: Icon(Icons.shopping_cart,size: 35,),
              title: Text("Cart",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
              onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>cart(),),);},
            ),Divider(),
            ListTile(
              leading: Icon(Icons.keyboard,size: 35,),
              title: Text("Chat with AI",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ai(),),);},
            ),Divider(),
            ListTile(
              leading: Icon(Icons.settings,size: 35,),
              title: Text("Settings",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>settings(),),);},
            ),Divider(),
          ],
        ),
      ),
        
        backgroundColor: const Color.fromARGB(255, 199, 98, 217),
        
       
        body: TabBarView(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Category , Breed',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        _buildPetCard(context, 'assets/buyerdog.jpg', 'Dog'),
                        _buildPetCard(context, 'assets/cat.png', 'Cat'),
                        _buildPetCard(context, 'assets/fish.png', 'Fish'),
                        _buildPetCard(context, 'assets/birds.jpg', 'Birds'),
                        _buildPetCard(context, 'assets/rabbit.jpg', 'Rabbit'),
                        _buildPetCard(context, 'assets/cow.jpg', 'Cow'),
                        _buildPetCard(context, 'assets/parrot.jpg', 'Parrot'),
                        _buildPetCard(context, 'assets/sheep.jpg', 'Other Pets'),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No Pets registered.......',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>seller1()));

                  }, style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )),child: Text('Add Post',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),))

                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPetCard(BuildContext context, String assetPath, String title) {
    return ElevatedButton(
      onPressed: () {
        if (title == 'Cat') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Cat()),
          );
          } else if (title == 'Dog') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Dog()));
      } else if (title == 'Fish') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Fish()));
      } else if (title == 'Birds') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Birds()));
      } else if (title == 'Rabbit') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Rabbit()));
      } else if (title == 'Cow') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Cow()));
      } else if (title == 'Parrot') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Parrot()));
      } else if (title == 'Other Pets') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Sheep()));
      
        }
      },
      
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 103, 218, 182),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.zero,
      ),
      child: Column(
        children: [
          Image.asset(assetPath, height: 150, width: 150, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

// Corrected Cat page
class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 150, 30, 171),
        title: Text('Cats',style: TextStyle(color: Colors.white,fontFamily: 'IrishGrover',fontSize: 35,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/fav');
          }, icon: Icon(Icons.favorite,size: 30,color: Colors.white,)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart');
          }, icon: Icon(Icons.shopping_cart,size: 30,color: Colors.white,))

        ],
        
      ),
      backgroundColor:Color.fromARGB(255, 199, 98, 217) ,
      body:
      
       SingleChildScrollView(
         child: Column(
           children: [
                SizedBox(height: 30,), Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Category , Breed',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                        ),
                      ),
                ),
            // SizedBox(height: 50,),
              SizedBox(height: 30,),
                    Stack(
              children: [
                SizedBox(height: 50,),
              
               Container(width: 370,height: 130,
                 child: ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>pets()));
                 },style: ElevatedButton.styleFrom(backgroundColor:Colors.white,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                 )), child: Container(
                  width: 370,
                  height: 130,
                  padding: EdgeInsets.all(8),
                  // margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(children: [
                    
                    Text('Minni',style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold,fontFamily: 'IrishGrover'),),
                    Text('Ragdoll',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),),
                    Text('Amount',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),)
                  ],),
                  
                 )  ),
               ),SizedBox(height: 80,),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/cat.png'),
                )
              ],
                   ),
                   SizedBox(height: 30,),
                    Stack(
              children: [
                SizedBox(height: 50,),
              
               Container(width: 370,height: 130,
                 child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor:Colors.white,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                 )), child: Container(
                  width: 370,
                  height: 130,
                  padding: EdgeInsets.all(8),
                  // margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(children: [
                    
                    Text('Rocks',style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold,fontFamily: 'IrishGrover'),),
                    Text('Birman',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),),
                    Text('Amount',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),)
                  ],),
                  
                 )  ),
               ),SizedBox(height: 80,),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/cat2.jpg'),
                )
              ],
                   ),],),)
    );
  }
}
class Dog extends StatefulWidget {
  const Dog({super.key});

  @override
  State<Dog> createState() => _DogState();
}

class _DogState extends State<Dog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 150, 30, 171),
        title: Text('Dogs',style: TextStyle(color: Colors.white,fontFamily: 'IrishGrover',fontSize: 35,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/fav');
          }, icon: Icon(Icons.favorite,size: 30,color: Colors.white,)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart');
          }, icon: Icon(Icons.shopping_cart,size: 30,color: Colors.white,))

        ],
        
      ),
      backgroundColor:Color.fromARGB(255, 199, 98, 217) ,
      body:
      
       SingleChildScrollView(
         child: Column(
           children: [
                SizedBox(height: 30,), Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Category , Breed',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                        ),
                      ),
                ),
            // SizedBox(height: 50,),
              SizedBox(height: 30,),
                    Stack(
              children: [
                SizedBox(height: 50,),
              
               Container(width: 370,height: 130,
                 child: ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>pets()));
                 },style: ElevatedButton.styleFrom(backgroundColor:Colors.white,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                 )), child: Container(
                  width: 370,
                  height: 130,
                  padding: EdgeInsets.all(8),
                  // margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Jessy',style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold,fontFamily: 'IrishGrover'),),
                        SizedBox(width: 50,),
                         IconButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Favourite()));
                        }, icon: Icon(Icons.favorite_border,size: 25,color: Colors.black,)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 50,),
                        Text('poomeranian',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Text('₹2000',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),)
                  ],),
                  
                 )  ),
               ),SizedBox(height: 80,),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/buyerdog.jpg'),
                )
              ],
                   ),
                   SizedBox(height: 30,),
                    Stack(
              children: [
                SizedBox(height: 50,),
              
               Container(width: 370,height: 130,
                 child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor:Colors.white,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                 )), child: Container(
                  width: 350,
                  height: 130,
                  padding: EdgeInsets.all(8),
                  // margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(children: [
                    
                       Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Rockey',style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold,fontFamily: 'IrishGrover'),),
                        SizedBox(width: 50,),
                         IconButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Favourite()));
                        }, icon: Icon(Icons.favorite_border,size: 30,color: Colors.black,)),
                      ],
                    ),
                    Text('Poodle',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),),
                    Text('₹2500',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),),
                    
                  ],),
                  
                 )  ),
               ),SizedBox(height: 80,),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/dog2.png'),
                )
              ],
                   ),
                    SizedBox(height: 30,),
                    Stack(
              children: [
                SizedBox(height: 50,),
              
               Container(width: 370,height: 130,
                 child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor:Colors.white,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                 )), child: Container(
                  width: 370,
                  height: 130,
                  padding: EdgeInsets.all(8),
                  // margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Jimmy',style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold,fontFamily: 'IrishGrover'),),
                        SizedBox(width: 50,),
                         IconButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Favourite()));
                        }, icon: Icon(Icons.favorite_border,size: 30,color: Colors.black,))
                      ],
                    ),
                    Text('Beagle',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),),
                    SizedBox(width: 100,),
                    Text('₹3000',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),),
                  ],),
                  
                 )  ),
               ),SizedBox(height: 80,),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/dogone.jpg'),
                )
              ],
                   ),

           ],
         ),
       ),
    );
  }
}
class Fish extends StatefulWidget {
  const Fish({super.key});

  @override
  State<Fish> createState() => _FishState();
}

class _FishState extends State<Fish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 150, 30, 171),
        title: Text('Fishes',style: TextStyle(color: Colors.white,fontFamily: 'IrishGrover',fontSize: 35,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/fav');
          }, icon: Icon(Icons.favorite,size: 30,color: Colors.white,)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart');
          }, icon: Icon(Icons.shopping_cart,size: 30,color: Colors.white,))

        ],
        
      ),
       backgroundColor:Color.fromARGB(255, 199, 98, 217) ,
      body:
      
       SingleChildScrollView(
         child: Column(
           children: [
                SizedBox(height: 30,), Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Category , Breed',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                        ),
                      ),
                ),
            // SizedBox(height: 50,),
              SizedBox(height: 30,),
                    Stack(
              children: [
                SizedBox(height: 50,),
              
               Container(width: 370,height: 130,
                 child: ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>pets()));
                 },style: ElevatedButton.styleFrom(backgroundColor:Colors.white,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                 )), child: Container(
                  width: 370,
                  height: 130,
                  padding: EdgeInsets.all(8),
                  // margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(children: [
                    
                    Text('Mikki',style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold,fontFamily: 'IrishGrover'),),
                    Text('Koi',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),),
                    Text('Amount',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),)
                  ],),
                  
                 )  ),
               ),SizedBox(height: 80,),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/fish.png'),
                )
              ],
                   ),],),),
    );
  }
}
class Parrot extends StatefulWidget {
  const Parrot({super.key});

  @override
  State<Parrot> createState() => _ParrotState();
}

class _ParrotState extends State<Parrot> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 150, 30, 171),
        title: Text('Parrots',style: TextStyle(color: Colors.white,fontFamily: 'IrishGrover',fontSize: 35,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/fav');
          }, icon: Icon(Icons.favorite,size: 30,color: Colors.white,)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart');
          }, icon: Icon(Icons.shopping_cart,size: 30,color: Colors.white,))

        ],
        
      ),
   );
  }
}

class Birds extends StatefulWidget {
  const Birds({super.key});

  @override
  State<Birds> createState() => _BirdsState();
}

class _BirdsState extends State<Birds> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 150, 30, 171),
        title: Text('Birds',style: TextStyle(color: Colors.white,fontFamily: 'IrishGrover',fontSize: 35,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/fav');
          }, icon: Icon(Icons.favorite,size: 30,color: Colors.white,)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart');
          }, icon: Icon(Icons.shopping_cart,size: 30,color: Colors.white,))

        ],
        
      ),
   );
  }
}

class Cow extends StatefulWidget {
  const Cow({super.key});

  @override
  State<Cow> createState() => _CowState();
}

class _CowState extends State<Cow> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 150, 30, 171),
        title: Text('Cow',style: TextStyle(color: Colors.white,fontFamily: 'IrishGrover',fontSize: 35,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/fav');
          }, icon: Icon(Icons.favorite,size: 30,color: Colors.white,)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart');
          }, icon: Icon(Icons.shopping_cart,size: 30,color: Colors.white,))

        ],
        
      ),
   );
  }
}
class Sheep extends StatefulWidget {
  const Sheep({super.key});

  @override
  State<Sheep> createState() => _SheepState();
}

class _SheepState extends State<Sheep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 150, 30, 171),
        title: Text('Other pets',style: TextStyle(color: Colors.white,fontFamily: 'IrishGrover',fontSize: 35,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/fav');
          }, icon: Icon(Icons.favorite,size: 30,color: Colors.white,)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart');
          }, icon: Icon(Icons.shopping_cart,size: 30,color: Colors.white,))

        ],
        
      ),
    );
  }
}

class Rabbit extends StatefulWidget {
  const Rabbit({super.key});

  @override
  State<Rabbit> createState() => _RabbitState();
}

class _RabbitState extends State<Rabbit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 150, 30, 171),
        title: Text('Rabbits',style: TextStyle(color: Colors.white,fontFamily: 'IrishGrover',fontSize: 35,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/fav');
          }, icon: Icon(Icons.favorite,size: 30,color: Colors.white,)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart');
          }, icon: Icon(Icons.shopping_cart,size: 30,color: Colors.white,))

        ],
        
      ),
    );
  }
}



