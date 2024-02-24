import 'package:calculator_app/app_theme.dart';
import 'package:calculator_app/widgets/button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentNumber='';
  double result=0;
  String savedNumber='';
  String savedOperator='';
  @override
  Widget build(BuildContext context) {
    var screenHeight =MediaQuery.of(context).size.height;
    var screenWidth =MediaQuery.of(context).size.width;
    void calculate(String operator){
      // switch (operator){
      //   case '+':
      //     result= double.parse(savedNumber)+double.parse(currentNumber);
      //     break;
      //     case '-':
      //     result= double.parse(savedNumber)-double.parse(currentNumber);
      //     break;
      //     case '÷':
      //     result= double.parse(savedNumber)/double.parse(currentNumber);
      //     break;
      //     case 'X':
      //       result= double.parse(savedNumber)*double.parse(currentNumber);
      //       break;
      // }
      // savedNumber=result.toString();
    }
    void onNumberClicked(String number){
      // currentNumber+=number;
      // setState(() {
      //
      // });
    }
    void onOperatorClicked(String operator){
      // if(savedNumber.isEmpty&& result==0){
      //   savedNumber=currentNumber;//saved=1 current=1,
      //   savedOperator=operator;//saved operator = +,
      //  }
      //   else{
      //   calculate(savedOperator);
      // }
      // currentNumber=''; //current='' ,
      // setState(() {});
    }
    List<Widget> buttons=[
      Button(label: '7', onButton: onNumberClicked),
      Button(label: '8', onButton: onNumberClicked),
      Button(label: '9', onButton: onNumberClicked),
      Button(label: '÷', onButton: onOperatorClicked),
      Button(label: '4', onButton: onNumberClicked),
      Button(label: '5', onButton: onNumberClicked),
      Button(label: '6', onButton: onNumberClicked),
      Button(label: 'X', onButton: onOperatorClicked),
      Button(label: '1', onButton: onNumberClicked),
      Button(label: '2', onButton: onNumberClicked),
      Button(label: '3', onButton: onNumberClicked),
      Button(label: '+', onButton: onOperatorClicked),
      Button(label: '.', onButton: onNumberClicked),
      Button(label: '0', onButton: onNumberClicked),
      Button(label: 'remove', onButton: onNumberClicked),
      Button(label: '-', onButton: onOperatorClicked),
      Button(label: '=', onButton: onNumberClicked),
    ];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF2b4667),
              Color(0xFF132a2f),
            ]
        ),
      ),
      height: screenHeight,
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top+screenHeight*0.03,
          ),
          Text(
            currentNumber,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            result.round().toString(),
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 1,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: 15
            ),
            color: AppTheme.grey,
            width: double.infinity,
            height: 1,
          ),
          Expanded(
            flex: 8,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) => buttons[index],
                physics: NeverScrollableScrollPhysics(),
                itemCount: 16,
              ),
          ),
         Expanded(
             child: buttons[16]),
        ],
      ),
    );
  }
}
