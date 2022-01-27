import 'package:diskon/main.dart';
import 'package:diskon/provider/provider.dart';
import 'package:diskon/screens/properti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final tata = Provider.of<PostDataProvider>(context, listen: false);
    tata.getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    // final postMd1 = Provider.of<PostDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Consumer<PostDataProvider>(builder: (context, tata, child) {
        return Container(
          padding: EdgeInsets.all(8.0),
          child: tata.loading
              ? Container(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, bottom: 20),
                      child: Text(
                        tata.post.besaran!.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      child: Text(tata.post.besaran!.descriptions!),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Properti()));
                        },
                        child: child)
                  ],
                ),
        );
      }),
    );
  }
}
