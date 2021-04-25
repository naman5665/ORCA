import 'package:flutter/material.dart';
import 'package:women_job/JobInformation.dart';
import 'models/catalog.dart';

class ItemWidget extends StatelessWidget {

  final Item item;

  const ItemWidget({Key key, @required this.item})
      : assert(item!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JobInfo(item: item)),
          );
        },
        minVerticalPadding: 20.0,
        title: Text(item.company, style: TextStyle(fontSize: 30.0),),
        subtitle: Text(item.title, style: TextStyle(fontSize: 15.0),),
        trailing: Icon(Icons.arrow_forward_ios_sharp),
      ),
    );
  }
}
