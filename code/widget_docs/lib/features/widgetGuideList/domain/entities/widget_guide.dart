import 'package:equatable/equatable.dart';

class WidgetGuide extends Equatable {
  final String name;
  final String description;
  final String youtubeVideoId;
  final String documentationUrl;

  const WidgetGuide({
    required this.name,
    required this.description,
    required this.youtubeVideoId,
    required this.documentationUrl,
  });

  @override
  List<Object?> get props => [name, youtubeVideoId];
}
