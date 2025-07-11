import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:widget_docs/data/models/widget_guide_model.dart';

abstract class WidgetGuideLocalDataSource {
  Future<List<WidgetGuideModel>> getWidgetGuides();
}

class WidgetGuideLocalDataSourceImpl implements WidgetGuideLocalDataSource {
  @override
  Future<List<WidgetGuideModel>> getWidgetGuides() async {
    final jsonString = await rootBundle.loadString('assets/widgets.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => WidgetGuideModel.fromJson(json)).toList();
  }
}
