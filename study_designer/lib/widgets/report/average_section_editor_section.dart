import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studyou_core/models/models.dart';
import 'package:studyou_core/models/report/temporal_aggregation.dart';

class AverageSectionEditorSection extends StatefulWidget {
  final AverageSection section;

  const AverageSectionEditorSection({@required this.section, Key key}) : super(key: key);

  @override
  _AverageSectionEditorSectionState createState() => _AverageSectionEditorSectionState();
}

class _AverageSectionEditorSectionState extends State<AverageSectionEditorSection> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text('Temporal Aggregation:'),
        SizedBox(width: 10),
        DropdownButton<TemporalAggregation>(
          value: widget.section.aggregate,
          onChanged: _changeAggregation,
          items: TemporalAggregation.values
              .map((aggregation) => DropdownMenuItem(
                  value: aggregation,
                  child: Text(aggregation.toString().substring(aggregation.toString().indexOf('.') + 1))))
              .toList(),
        )
      ]),
    ]);
  }

  void _changeAggregation(value) {
    setState(() {
      widget.section.aggregate = value;
    });
  }
}
