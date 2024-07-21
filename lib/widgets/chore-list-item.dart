import 'package:chore_chart/models.dart';
import 'package:flutter/material.dart';

class ChoreListItemWidget extends StatefulWidget {
  const ChoreListItemWidget({
    super.key,
    required this.chore,
  });

  final Chore? chore;

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
          Tooltip(
            child:
                // FIXME: Update the app's tooltip theme and extract this into a ThemedTooltip stateless widget
                Theme(
              data: ThemeData(
                  checkboxTheme: CheckboxThemeData(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  unselectedWidgetColor:
                      Theme.of(context).tooltipTheme.textStyle?.color),
              child: Checkbox(
                value: widget.chore!.completed,
                onChanged: (isChecked) async {
                  setState(() => widget.chore!.completed = isChecked!);
                },
                side: BorderSide(
                  width: 2,
                  color: Theme.of(context).dividerColor,
                ),
                activeColor: Theme.of(context).indicatorColor,
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
                  Text(
                    widget.chore?.chore ?? 'Unknown Chore',
                    style: Theme.of(context)
                        .typography
                        .black
                        .bodyLarge
                        ?.apply(fontFamily: 'Readex Pro')
                        .copyWith(letterSpacing: 0.0),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: SelectionArea(
                        child: Text(
                      widget.chore?.notes ?? 'Describe this chore.',
                      maxLines: 1,
                      style: Theme.of(context)
                          .typography
                          .black
                          .labelSmall
                          ?.apply(fontFamily: 'Readex Pro')
                          .copyWith(letterSpacing: 0.0),
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
              color: Theme.of(context).iconTheme.color,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
