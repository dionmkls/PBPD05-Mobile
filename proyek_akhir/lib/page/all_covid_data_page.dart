import 'package:flutter/material.dart';
import 'package:proyek_akhir/model/covidData.dart';


class CovDataPage extends StatefulWidget {
  const CovDataPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CovDataPage> createState() => _CovDataPageState();
}

class _CovDataPageState extends State<CovDataPage> {
  CovidData covidData = CovidData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: FutureBuilder<List>(
              future: covidData.getAllCovidData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                              title: Column(
                            children: [
                              Text(
                                  snapshot.data![i]['fields']['bulan'] +
                                      ' (' +
                                      snapshot.data![i]['fields']['tahun'] +
                                      ') ',
                                  style: TextStyle(fontSize: 12)),
                              Text(
                                  'Tambahan Kasus Positif: ' +
                                      snapshot.data![i]['fields']
                                          ['penambahanKasusPositif'],
                                  style: TextStyle(fontSize: 12)),
                              Text(
                                  'Jumlah Kumulatif Kasus Positif: ' +
                                      snapshot.data![i]['fields']
                                          ['positifKumulatif'],
                                  style: TextStyle(fontSize: 12)),
                            ],
                          )),
                        );
                      });
                } else {
                  return const Center(
                    child: Text('Data tidak ditemukan!'),
                  );
                }
              }),
        ));
  }
}
