import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Coba Pertama Saya',
      home: ClickMeApp()
    );
  }
}

class ClickMeApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> ChangeText();

}

class ChangeText extends State<ClickMeApp>{

  final myController= TextEditingController();
  final myGlobalController = GlobalKey<FormState>();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void sayHello(){
    if(myGlobalController.currentState.validate()){
      showDialog(context: context,builder:(context) {
        return AlertDialog(content: Text("Hello "+myController.text),);
      });
    }else{

    }

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body:Form(key: myGlobalController,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          validator: (value){
            if(value.isEmpty)
              return "Please Enter Your Name";

          },
          controller: myController,
          decoration: InputDecoration(hintText: 'Enter Your Name'),

        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),child:
            RaisedButton(onPressed: sayHello,child: Text("Say Hi!"),)
          ,)
      ],),)
    );
  }

}
