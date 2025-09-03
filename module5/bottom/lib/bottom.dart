import 'package:flutter/material.dart';
class bottom1 extends StatelessWidget{
  bottom1({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          showModalBottomSheet(context: context, builder: (BuildContext context){
            return Container(
              height: 200,
              color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Model Bottomsheet'),
                    ElevatedButton(onPressed: ()=>Navigator.pop(context), child: Text('Close bottomsheet'))
                  ],
                ),
              ),
            );
          });
          
        }, child: Text('Showmodelbottomset')),
        
      ),
    );
  }
}