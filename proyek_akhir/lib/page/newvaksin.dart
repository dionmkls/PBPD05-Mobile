import 'package:flutter/material.dart';
import 'package:proyek_akhir/model/covidData.dart';


class ChartPage extends StatefulWidget {
  const ChartPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {

  CovidData covidData = CovidData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: FutureBuilder(
              future: covidData.getVaksinData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (snapshot.hasData) {
                    int total_penduduk = snapshot.data['total_penduduk'];
                    int vaccineAtLeast1Dose = snapshot.data['vaccineAtLeast1Dose'];
                    int fullyVaccinated = snapshot.data['fullyVaccinated'];
                    int get1stDose = snapshot.data['get1stDose'];
                    int notVaccinated = snapshot.data['notVaccinated'];
                  return ListView.builder(

                      itemCount: 1,
                      itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                              title: Column(
                            children: [
                              Text('Sasaran vaksinasi: $total_penduduk',
                                  style: TextStyle(fontSize: 12)),
                              Text('Sudah Vaksin (minimal 1 kali): $vaccineAtLeast1Dose',
                                  style: TextStyle(fontSize: 12)),
                              Text('Sudah 2 kali Vaksin: $fullyVaccinated',
                                  style: TextStyle(fontSize: 12)),
                              Text('Baru 1 kali vaksin: $get1stDose',
                                  style: TextStyle(fontSize: 12)),
                              Text('Belum Divaksin: $notVaccinated',
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
