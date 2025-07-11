import 'package:flutter/material.dart';
import 'package:widget_docs/domain/entities/widget_guide.dart';
import 'package:widget_docs/presentation/bloc/widget_guide_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_docs/presentation/pages/widget_detail_page.dart';

class WidgetListPage extends StatelessWidget {
  const WidgetListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Guide'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: BlocBuilder<WidgetGuideBloc, WidgetGuideState>(
        builder: (context, state) {
          if (state is WidgetGuideLoading || state is WidgetGuideInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WidgetGuideLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: state.guides.length,
              itemBuilder: (context, index) {
                final guide = state.guides[index];
                return _buildWidgetListItem(context, guide);
              },
            );
          } else if (state is WidgetGuideError) {
            return Center(
              child: Text('Failed to load widgets: ${state.message}'),
            );
          }
          return const Center(child: Text('Something went wrong!'));
        },
      ),
    );
  }

  Widget _buildWidgetListItem(BuildContext context, WidgetGuide guide) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        leading: Icon(
          Icons.widgets_rounded,
          color: Theme.of(context).colorScheme.primary,
          size: 30,
        ),
        title: Text(
          guide.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          guide.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WidgetDetailPage(guide: guide),
            ),
          );
        },
      ),
    );
  }
}
