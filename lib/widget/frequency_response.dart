import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';

double log10(double x) {
  return x > 0 ? log(x) / log(10) : 0;
}

class GraphData {
  final double frequency;
  final double decibal;
  GraphData(this.frequency, this.decibal);
}

Future<List<GraphData>> loadGraphData(String graphPath) async {
  final String data = await rootBundle.loadString(graphPath);
  final List<String> lines = data.split('\n');
  final List<GraphData> graphDataList =
      lines.where((line) => line.trim().isNotEmpty).map((line) {
        final List<String> parts = line.split(RegExp(r'\s+'));
        final double x = log10(double.parse(parts[0]));
        final double y = double.parse(parts[1]);
        return GraphData(x, y);
      }).toList();

  return graphDataList;
}

class FrequencyResponse extends StatefulWidget {
  final String iemName;
  final String graphPath;
  final double graphCorrection;
  const FrequencyResponse({
    super.key,
    required this.iemName,
    required this.graphPath,
    required this.graphCorrection,
  });

  @override
  State<FrequencyResponse> createState() => _FrequencyResponseState();
}

class _FrequencyResponseState extends State<FrequencyResponse> {
  List<GraphData> harmanTarget = [];
  List<GraphData> iemGraph = [];

  @override
  void initState() {
    super.initState();
    loadGraphData('asset/data/harman_target.txt').then((data) {
      if (mounted) {
        setState(() {
          harmanTarget = data;
        });
      }
    });
    loadGraphData(widget.graphPath).then((data) {
      if (mounted) {
        setState(() {
          iemGraph = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (harmanTarget.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        color: Color.fromRGBO(122, 108, 93, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        legend: Legend(isVisible: true),
        primaryYAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          minimum: -30,
          maximum: 20,
          interval: 10,
          labelFormat: '{value}db',
        ),
        primaryXAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          axisLabelFormatter: (AxisLabelRenderDetails details) {
            final value = details.value;

            return ChartAxisLabel(
              '${pow(10, value).round()}hz',
              details.textStyle,
            );
          },
        ),
        series: [
          LineSeries<GraphData, double>(
            name: 'Harman Target',
            color: Color.fromRGBO(221, 201, 180, 1),

            dataSource: harmanTarget,
            xValueMapper: (GraphData harman, _) => harman.frequency,
            yValueMapper: (GraphData harman, _) => harman.decibal - 100.0,
          ),
          LineSeries<GraphData, double>(
            name: widget.iemName,
            color: Color.fromRGBO(42, 61, 69, 1),

            dataSource: iemGraph,
            xValueMapper: (GraphData iem, _) => iem.frequency,
            yValueMapper: (GraphData iem, _) => iem.decibal - widget.graphCorrection,
          ),
        ],
      ),
    );
  }
}
