import 'package:calculator_app/app_theme.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  void Function(String) onButton;
  late Widget child;
  Color backgroundColor;
  EdgeInsetsGeometry padding;
  int flex;
  double elevation;
  Button({
    required this.label,
    required this.onButton,
    this.backgroundColor =Colors.transparent,
    this.padding =EdgeInsets.zero,
    this.flex =1,
    this.elevation =0,
  });

  
  @override
  Widget build(BuildContext context) {
    label =='remove'? child=Icon(Icons.backspace_outlined):child=Text('$label',style: Theme.of(context).textTheme.bodySmall,);
    return Expanded(
      flex: flex,
      child: Padding(
        padding: padding,
        child: ElevatedButton(
            onPressed: (){
              onButton(label);
            },
          style:ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: elevation,
            foregroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
            child: child,
        ),
      ),
    );
  }
}
