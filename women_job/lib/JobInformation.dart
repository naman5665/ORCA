import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'models/catalog.dart';


class JobInfo extends StatefulWidget {

  final Item item;

  const JobInfo({Key key, @required this.item})
      : assert (item!=null),
        super(key: key);


  @override
  _JobInfoState createState() => _JobInfoState();
}

class _JobInfoState extends State<JobInfo> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Orca" , style: TextStyle(color: Colors.black),),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[

            Image.asset("assets/pic1.jpeg"),

            SizedBox(height: 16.0,),

            Center(
              child: Card(
                child: Column(
                  children: <Widget>[

                    SizedBox(height: 16.0,),

                    Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(children :[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Company' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.item.company , style: TextStyle(fontSize: 25),),
                            ),
                          ]),
                          TableRow(children :[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Title' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.item.title , style: TextStyle(fontSize: 25),),
                            ),
                          ]),
                          TableRow(children :[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Location' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.item.location , style: TextStyle(fontSize: 25),),
                            ),
                          ]),
                        ]
                    ),

                    SizedBox(height: 200.0,),
                    ElevatedButton(
                        onPressed: (){},
                        child: Text("Apply Now")
                    )

                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
