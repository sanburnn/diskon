import 'package:diskon/provider/provider.dart';
import 'package:diskon/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KosanPage extends StatefulWidget {
  KosanPage({Key? key}) : super(key: key);

  @override
  State<KosanPage> createState() => _KosanPageState();
}

class _KosanPageState extends State<KosanPage> {
  final con = PostDataProvider();
  final titleController = TextEditingController();
  final userIdController = TextEditingController();

  void kirimGaji() {
    String title = titleController.text;
    String userId = userIdController.text;

    if (titleController.text != '' || userIdController.text != '') {
      con.kirimGaji(context, title, userId);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   final data = Provider.of<PostDataProvider>(context, listen: false);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: 65,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 32,
                      color: Color(0xff85d0757),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: 'Enter title'),
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Enter userId'),
                      controller: userIdController,
                    ),
                    // TextField(
                    //   decoration: InputDecoration(hintText: 'Enter userId'),
                    //   controller: ageController,
                    // ),
                    TextButton(
                        onPressed: () => kirimGaji(), child: Text('Submit'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
