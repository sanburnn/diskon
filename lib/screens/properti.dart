import 'package:diskon/main.dart';
import 'package:diskon/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class Properti extends StatefulWidget {
  Properti({Key? key}) : super(key: key);

  @override
  State<Properti> createState() => _PropertiState();
}

class _PropertiState extends State<Properti> {
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  void init() async {
    final prov = Provider.of<PostDataProvider>(context, listen: false);
    setState(() {
      isLoading = true;
    });
    await prov.getMahasiswa();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Consumer<PostDataProvider>(
        builder: (context, value, child) {
          final bala = value.maha;
          // var list = maha.maha.data!.length;
          if (isLoading) {
            return Column(
              children: [
                Center(
                  child: Lottie.asset('assets/lottie/sliders.json'),
                ),
                Text(
                  'Loading Data .. ...',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            );
          }

          if (bala.isEmpty) {
            return Center(
              child: Text('Barang Kosong'),
            );
          }
          return ListView(
            padding: EdgeInsets.all(8.0),
            children: bala
                .map((maha) => Card(
                      child: Column(
                        children: [
                          Text(maha.nama!),
                          Text(maha.jurusan!),
                          Text(maha.alamat!)
                        ],
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
