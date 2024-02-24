import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  void Function(String) onButton;
  late Widget child;
  Button({required this.label,required this.onButton});

  
  @override
  Widget build(BuildContext context) {
    label =='remove'? child=Icon(Icons.backspace_outlined):child=Text('$label');
    return TextButton(
      onPressed: (){
        onButton(label);
      },
      child: child,
      style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(Theme.of(context).textTheme.bodySmall),
          foregroundColor: MaterialStatePropertyAll(Theme.of(context).textTheme.bodySmall!.color)
      ),
    );
  }
}
