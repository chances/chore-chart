import 'package:chore_chart/providers.dart';
import 'package:flutter/material.dart' hide State;

class VersionLabel extends StatelessWidget {
  const VersionLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: State.appVersion,
        initialData: null,
        builder: (context, AsyncSnapshot<String?> snapshot) => Opacity(
          opacity: snapshot.data?.isEmpty ?? true ? 0 : 1,
          child: Text(
            'v${snapshot.data}',
            style: Theme.of(context)
                .typography
                .black
                .bodyMedium
                ?.apply(fontFamily: 'Readex Pro')
                .copyWith(letterSpacing: 0.0),
          ),
        ),
      ),
    );
  }
}
