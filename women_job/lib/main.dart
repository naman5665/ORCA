import 'package:flutter/material.dart';
import 'package:women_job/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Women Centric Jobs',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Center(child: MyHomePage(title: 'Orca')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title , style: TextStyle(color: Colors.black),),
      ),
      body:SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Image.asset("assets/pic2.png"),
                  SizedBox(height: 100,),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Username',
                      alignLabelWithHint: true,
                    ),
                  ),

                  SizedBox(height: 12.0),

                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 12.0),
                  Center(
                    child: ElevatedButton(
                      child: Text("Sign In"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
