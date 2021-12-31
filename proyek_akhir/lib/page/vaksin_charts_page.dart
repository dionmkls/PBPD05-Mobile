import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class VaksinChartsPage extends StatelessWidget {
  const VaksinChartsPage({Key? key}) : super(key: key);
  static final List<Vaksinasi> vaksinasiData = [
    Vaksinasi('Sudah vaksin 2 kali', 40, Colors.purple.shade300),
    Vaksinasi('Baru vaksin 1 kali', 10, Colors.purple.shade200),
    Vaksinasi('Belum vaksin', 50, Colors.purple.shade100)
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Vaksinasi, String>> series = [
      charts.Series(
        data: vaksinasiData,
        id: "Vaksinasi Indonesia",
        domainFn: (Vaksinasi pops, _) => pops.statusVaksinasi,
        measureFn: (Vaksinasi pops, _) => pops.jumlahVaksinasi,
        colorFn: (Vaksinasi pops, _) =>
            charts.ColorUtil.fromDartColor(pops.barColor),
      )
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Statistik Vaksin Indonesia'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: charts.PieChart(series),
            
          ),
        ),
      ),
    );
  }
}

class Vaksinasi {
  final String statusVaksinasi;
  final int jumlahVaksinasi;
  final Color barColor;

  Vaksinasi(this.statusVaksinasi, this.jumlahVaksinasi, this.barColor);
}
