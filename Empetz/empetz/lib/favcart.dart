import 'package:flutter/material.dart';

class profile1 extends StatefulWidget {
  profile1({super.key});
  @override
  State<profile1> createState() => profilepage();
  // TODO: implement createState
}

class profilepage extends State<profile1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 30, 171),
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'IrishGrover',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 199, 98, 217),
      body: Column(
        children: [
          SizedBox(height: 45),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/buyerdog.jpg'),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 7, 22, 35),
              ),
            ),
          ),
          SizedBox(height: 50),
          ListTile(
            leading: Icon(Icons.person, size: 40, color: Colors.black),

            title: Text(
              'Name',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'R',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.all_inclusive_outlined,
              size: 40,
              color: Colors.black,
            ),
            title: Text(
              'About',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'Always buzy',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone, size: 40, color: Colors.black),
            title: Text(
              'Phone',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              '+91 9123456786',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
        ],
      ),
    );
  }
}

class Favourite extends StatelessWidget {
  Favourite({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 30, 171),
        title: Text(
          'Wishlist',
          style: TextStyle(
            fontFamily: 'IrishGrover',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 199, 98, 217),
    );
  }
}class reporting extends StatefulWidget{
  reporting({super.key});
  @override
  State<reporting> createState()=>report();
}





class report extends State<reporting>{
   bool _ischecked=false;
   bool finance=false;
    bool identity=false;
     bool acc=false;
      bool spam=false;
      bool oth=false;



  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 30, 171),
        title: Text(
          'Report',
          style: TextStyle(
            fontFamily: 'IrishGrover',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 199, 98, 217),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150,),
            Container(
              
              height: 500,
              width: 350,
              decoration: BoxDecoration(color: const Color.fromARGB(255, 209, 123, 225),borderRadius: BorderRadius.circular(45)),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("Reason for reporting ?",style: TextStyle(
                          fontFamily: 'InknutAntiqua',
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                                      ),),
                      ),
                         SizedBox(height: 30,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Checkbox(value: finance, onChanged: (value){
                        setState(() {
                          finance=value!;
                          
                        });
                      }),Text("Financial Statement fraud",style: TextStyle(
                        fontFamily: 'InknutAntiqua',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                                    ),),
                                     SizedBox(height: 30,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Checkbox(value: identity, onChanged: (value){
                        setState(() {
                          identity=value!;
                          
                        });
                      }),Text("Identity Theft",style: TextStyle(
                        fontFamily: 'InknutAntiqua',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                                    ),),
                                      SizedBox(height: 30,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Checkbox(value: acc, onChanged: (value){
                        setState(() {
                          acc=value!;
                          
                        });
                      }),Text("Fake accounts",style: TextStyle(
                        fontFamily: 'InknutAntiqua',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                                    ),),
                    ],
                  ),
                   Row(
                    children: [
                      Checkbox(value: spam, onChanged: (value){
                        setState(() {
                          spam=value!;
                          
                        });
                      }),Text("Spam mails , messages",style: TextStyle(
                        fontFamily: 'InknutAntiqua',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                                    ),),
                    ],
                  ),
                   Row(
                    children: [
                      Checkbox(value: oth, onChanged: (value){
                        setState(() {
                          oth=value!;
                          
                        });
                      }),Text("Other",style: TextStyle(
                        fontFamily: 'InknutAntiqua',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                                    ),),
                    ],
                  ),
                  
                
               
                ],
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>repo()));
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
             child: Text("Submit",style: TextStyle(
                  fontFamily: 'InknutAntiqua',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),)
          ],
        ),
        
      ),
      
    );
  }
}
class repo extends StatelessWidget{
  repo({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 30, 171),
      ),
      backgroundColor:Color.fromARGB(255, 199, 98, 217), 

      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text("your problem has been submitted....",style: TextStyle(
                    fontFamily: 'InknutAntiqua',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
        ),
      ) ,
    );

  }
}











class cart extends StatelessWidget {
  cart({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 30, 171),
        title: Text(
          'Cart',
          style: TextStyle(
            fontFamily: 'IrishGrover',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 199, 98, 217),
    );
  }
}

class ai extends StatelessWidget {
  ai({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 30, 171),
        title: Text(
          'Chat with AI',
          style: TextStyle(
            fontFamily: 'IrishGrover',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 199, 98, 217),
    );
  }
}

class settings extends StatelessWidget {
  settings({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 30, 171),
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'IrishGrover',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 199, 98, 217),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.key, size: 30, color: Colors.black),
            title: Text(
              'Account',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'Security notifications,change number',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock, size: 40, color: Colors.black),
            title: Text(
              'Privacy',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'Block chats,disappearing meassages ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications, size: 40, color: Colors.black),
            title: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'Message,call',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.accessibility, size: 40, color: Colors.black),
            title: Text(
              'Accessibility',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'Animation',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language, size: 40, color: Colors.black),
            title: Text(
              'App language',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'English(device language)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help, size: 40, color: Colors.black),
            title: Text(
              'Help',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'Help center,contact us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
        ],
      ),
    );
  }
}

class seller1 extends StatefulWidget {
  seller1({super.key});
  @override
  State<seller1> createState() => sellerpage();
}

class sellerpage extends State<seller1> {
  String? _selecteditem = "Categories";
  String? _seletedbreed = "Breed Name";
  String? _selectedgender = "Gender";
  bool iscert = false;
  bool ischeked = false;
  bool isparent = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 30, 171),
        title: Text(
          "Cute pets",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'IrishGrover',
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 199, 98, 217),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 380,
                height: 200,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_a_photo, size: 80),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Add Images / Videos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Center(
                    child: Center(
                      child: DropdownButton(
                        value: _selecteditem,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownColor: const Color.fromARGB(255, 225, 158, 237),
                        items:
                            [
                              'Categories',
                              'Dog',
                              'Cat',
                              'Fish',
                              'Birds',
                              'Parrots',
                              'Cow',
                              'Rabbit',
                              'Others',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                        onChanged: (String? newvalue) {
                          setState(() {
                            _selecteditem = newvalue;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Center(
                    child: Center(
                      child: DropdownButton(
                        value: _seletedbreed,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownColor: const Color.fromARGB(255, 225, 158, 237),
                        items:
                            [
                              'Breed Name',
                              'Bulldog',
                              'Poodle',
                              'Pug',
                              'boxer',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                        onChanged: (String? newvalue) {
                          setState(() {
                            _seletedbreed = newvalue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  labelText: 'Pet Nick Name',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        labelText: 'Age ',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(45),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Center(
                    child: Center(
                      child: DropdownButton(
                        value: _selectedgender,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownColor: const Color.fromARGB(255, 225, 158, 237),
                        items: ['Gender', 'Male', 'Female']
                            .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            })
                            .toList(),
                        onChanged: (String? newvalue) {
                          setState(() {
                            _selectedgender = newvalue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: TextField(
                        textAlignVertical: TextAlignVertical.top,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          labelText: 'Height ',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(405),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        labelText: 'Weight ',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(405),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Checkbox(
                  value: ischeked,
                  activeColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(0),
                    side: BorderSide(color: Colors.black, width: 10),
                  ),
                  onChanged: (value) {
                    setState(() {
                      ischeked = value!;
                    });
                  },
                ),
                Text(
                  'Vaccinated',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 30),
                Checkbox(
                  value: iscert,
                  activeColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(0),
                    side: BorderSide(color: Colors.black, width: 10),
                  ),
                  onChanged: (value) {
                    setState(() {
                      ischeked = value!;
                    });
                  },
                ),
                Text(
                  'Certificate',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  labelText: 'DD-MM-YYYY',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                maxLines: 2,

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  labelText: 'Address',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                maxLines: 5,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  labelText: 'Pet Story',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Looking for foster parent',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Checkbox(
                  value: isparent,
                  activeColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(0),
                    side: BorderSide(color: Colors.black, width: 10),
                  ),
                  onChanged: (value) {
                    setState(() {
                      isparent = value!;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  labelText: 'Price',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => postpet()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                backgroundColor: const Color.fromARGB(255, 120, 53, 131),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class postpet extends StatelessWidget {
  postpet({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 150, 30, 171),
      ),
      backgroundColor: Color.fromARGB(255, 199, 98, 217),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/buyerdog.jpg',
                height: 250,
                width: 400,
                fit: BoxFit.fill,
              ),
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Breed :",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,  fontFamily: 'InknutAntiqua',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(width: 220),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit_outlined, size: 35),
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Poomeranian",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,  fontFamily: 'InknutAntiqua',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(width: 30),
                Text(
                  "₹2500",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Age :",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,  fontFamily: 'InknutAntiqua',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(width: 120),
                Text(
                  "Gender :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,  fontFamily: 'InknutAntiqua',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "3 Months",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,  fontFamily: 'InknutAntiqua',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(width: 55),
                Text(
                  "Female",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,  fontFamily: 'InknutAntiqua',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Height :",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,  fontFamily: 'InknutAntiqua',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(width: 100),
                Text(
                  "Weight :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,  fontFamily: 'InknutAntiqua',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "10 inches",
                    style: TextStyle(
                      fontSize: 23, 
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(width: 90),
                Text(
                  "4.5 Kg",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.check_box, size: 30),
                Text(
                  "Vaccinated",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, fontFamily: 'InknutAntiqua',
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(width: 50),
                Icon(Icons.check_box, size: 30),
                Text(
                  "Certificate",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, fontFamily: 'InknutAntiqua',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "14/12/2020",
                style: TextStyle(fontSize: 20,color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Address:",
                style: TextStyle(
                  fontSize: 23, fontFamily: 'InknutAntiqua',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Aitrich Technolgies pvt ltd",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold, fontFamily: 'InknutAntiqua',
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "parayil line",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold, fontFamily: 'InknutAntiqua',
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Mg road",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold, fontFamily: 'InknutAntiqua',
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "680004",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Pet story :",
                style: TextStyle(
                  fontSize: 23, fontFamily: 'InknutAntiqua',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
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
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Icon(Icons.location_on, size: 30),
                ),
                Text(
                  "Ernakulam , Kochi",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold, fontFamily: 'InknutAntiqua',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 111, 34, 125),
                ),
                child: Text(
                  "Post",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white, fontFamily: 'InknutAntiqua',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
