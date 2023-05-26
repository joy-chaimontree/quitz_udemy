import 'package:flutter/material.dart';
import 'package:quiz_app/data/summary_items.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {Key? key}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
                (data) {
              return SummaryItems(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
