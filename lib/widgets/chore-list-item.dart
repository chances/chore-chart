import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoreListItemWidget extends StatefulWidget {
  const ChoreListItemWidget({
    super.key,
    required this.chore,
  });

  final ChoresRow? chore;

  @override
  State<ChoreListItemWidget> createState() => _ChoreListItemWidgetState();
}

class _ChoreListItemWidgetState extends State<ChoreListItemWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AlignedTooltip(
            content: Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                'Toggle ${widget.chore?.chore}',
                style: Theme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            offset: 4.0,
            preferredDirection: AxisDirection.down,
            borderRadius: BorderRadius.circular(8.0),
            backgroundColor: Theme.of(context).secondaryBackground,
            elevation: 4.0,
            tailBaseWidth: 24.0,
            tailLength: 12.0,
            waitDuration: Duration(milliseconds: 100),
            showDuration: Duration(milliseconds: 1500),
            triggerMode: TooltipTriggerMode.tap,
            child: Theme(
              data: ThemeData(
                checkboxTheme: CheckboxThemeData(
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                unselectedWidgetColor:
                    Theme.of(context).secondaryText,
              ),
              child: Checkbox(
                value: _model.checkboxValue ??= widget.chore!.completed,
                onChanged: (newValue) async {
                  setState(() => _model.checkboxValue = newValue!);
                },
                side: BorderSide(
                  width: 2,
                  color: Theme.of(context).secondaryText,
                ),
                activeColor: Theme.of(context).secondary,
                checkColor: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.chore?.chore ?? 'Unknown Chore'),
                    style: Theme.of(context).bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: SelectionArea(
                        child: Text(widget.chore?.notes ?? 'Describe this chore.'),
                      maxLines: 1,
                      style: Theme.of(context).labelSmall.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    )),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Icon(
              Icons.chevron_right_rounded,
              color: Theme.of(context).secondaryText,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
