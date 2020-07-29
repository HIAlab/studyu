import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../models/designer_state.dart';

class MetaDataDesigner extends StatefulWidget {
  @override
  _MetaDataDesignerState createState() => _MetaDataDesignerState();
}

class _MetaDataDesignerState extends State<MetaDataDesigner> {
  LocalStudy _draftStudy;

  @override
  void initState() {
    super.initState();
    _draftStudy = context.read<DesignerModel>().draftStudy;
  }

  final GlobalKey<FormBuilderState> _editFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FormBuilder(
              key: _editFormKey,
              autovalidate: true,
              // readonly: true,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                      onChanged: _saveFormChanges,
                      attribute: 'title',
                      maxLength: 40,
                      decoration: InputDecoration(labelText: 'Title'),
                      initialValue: _draftStudy.title),
                  FormBuilderTextField(
                      onChanged: _saveFormChanges,
                      attribute: 'description',
                      decoration: InputDecoration(labelText: 'Description'),
                      initialValue: _draftStudy.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveFormChanges(value) {
    _editFormKey.currentState.save();
    if (_editFormKey.currentState.validate()) {
      setState(() {
        _draftStudy
          ..title = _editFormKey.currentState.value['title']
          ..description = _editFormKey.currentState.value['description'];
      });
      print('saved');
      print(_draftStudy.studyDetails.interventions);
      // TODO: show dialog "saved"
    }
  }
}
