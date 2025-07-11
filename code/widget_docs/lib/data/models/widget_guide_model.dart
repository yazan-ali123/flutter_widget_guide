import 'package:widget_docs/domain/entities/widget_guide.dart';

class WidgetGuideModel extends WidgetGuide {
  const WidgetGuideModel({
    required super.name,
    required super.description,
    required super.youtubeVideoId,
    required super.documentationUrl,
  });

  factory WidgetGuideModel.fromJson(Map<String, dynamic> json) {
    return WidgetGuideModel(
      name: json['name'],
      description: json['description'],
      youtubeVideoId: json['youtubeVideoId'],
      documentationUrl: json['documentationUrl'],
    );
  }
}
