import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoChoresWidget extends StatelessWidget {
  const NoChoresWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //FaIcon(
          //  FontAwesomeIcons.broom,
          //  color: Theme.of(context).secondaryText,
          //  size: 72.0,
          //),
          SizedBox.withSize(72, 72),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              'No Chores',
              style: Theme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: AutoSizeText(
              'Cleanup your act and schedule a chore.',
              textAlign: TextAlign.center,
              style: Theme.of(context).labelMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
