import 'package:flutter/material.dart';


class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive UI'),),
      body: LayoutBuilder(builder: (context , Constraints){
        if(Constraints.maxWidth<600){
          return Mobileview();
        }
        else if(Constraints.maxWidth<1200){
          return Tabletview();
        }
        else{
          return Desktopview();
        }
      }),
    );
  }
}
class Mobileview extends StatelessWidget {
  const Mobileview({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Mobile View',style: TextStyle(fontSize: 20),),
    );
  }
}

class Tabletview extends StatelessWidget {
  const Tabletview({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tablet View',style: TextStyle(fontSize: 24),),
    );
  }
}
class Desktopview extends StatelessWidget {
  const Desktopview({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Desktop View',style: TextStyle(fontSize: 28),),
    );
  }
}