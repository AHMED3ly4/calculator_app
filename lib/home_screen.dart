import 'package:calculator_app/app_theme.dart';
import 'package:calculator_app/setting_provider.dart';
import 'package:calculator_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  void calculate(operator){
    if(currentNumber.isEmpty ){
      return;
    }
    switch (operator){
      case '+':
        result= double.parse(savedNumber)+double.parse(currentNumber);
        break;
      case '-':
        result= double.parse(savedNumber)-double.parse(currentNumber);
        break;
      case '÷':
        result= double.parse(savedNumber)/double.parse(currentNumber);
        break;
      case 'X':
        result= double.parse(savedNumber)*double.parse(currentNumber);
        break;
    }
    savedNumber=result.toString();
  }
  void onOperatorClicked(String operator){
    if(savedNumber.isEmpty){
      savedNumber=currentNumber;
    }else{
      calculate(savedOperator);
    }
    savedOperator=operator;
    currentNumber='';
    setState(() {});
  }
  void onNumberClicked(String number){
    if(number=='0'&& currentNumber =='0'){
      return;
    }else if(currentNumber=='0'){
      currentNumber='';
    }
    if(result!=0 &&savedOperator.isEmpty){
      result=0;
      savedNumber='';
    }
    currentNumber+=number;
    setState(() {

    });
  }
  void onRemoveClicked(String number){
    if(currentNumber.isNotEmpty){
      currentNumber= currentNumber.substring(1,currentNumber.length);
    }
    setState(() {

    });
  }
  void onDotClicked(String dot){
    if(!currentNumber.contains(dot)){
      currentNumber += dot;
    }
    setState(() {

    });
  }
  void onEqualClicked(String equal){
    calculate(savedOperator);
    currentNumber='';
    savedOperator='';
    setState(() {

    });
  }
  void onPercentClicked(String percent){
    if(currentNumber.isEmpty) return;
    currentNumber= '${double.parse(currentNumber)/100}';
    setState(() {});
  }
  void onClearClicked(String _){
    savedNumber='';
    savedOperator='';
    currentNumber='';
    result=0;
    setState(() {});
  }
  void onPlusNegativeClicked(String _){
    if(currentNumber.isEmpty){
      result=0;
      savedNumber='';
      currentNumber+='-';
    }else{
      currentNumber ='${double.parse(currentNumber)*-1}';
    }
    setState(() {});
  }
  int getResultDecimalNumbers(){
    double resultFraction =result - result.toInt();
    int resultDecimalNumbers = resultFraction.toString().length-3;
    resultDecimalNumbers > 2? resultDecimalNumbers=2 : null;
    return resultDecimalNumbers;
  }

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of(context);
    var screenHeight =MediaQuery.of(context).size.height;
    var screenWidth =MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: settingProvider.appMode == ThemeMode.dark? const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF2b4667),
                    Color(0xFF132a2f),
                  ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ): BoxDecoration(color: AppTheme.white),
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
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        savedOperator,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          result.toStringAsFixed(getResultDecimalNumbers()),
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 2
                  ),
                  color: AppTheme.grey,
                  width: double.infinity,
                  height: 1,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(label: 'C', onButton: onClearClicked),
                      Button(label: '+/-', onButton: onPlusNegativeClicked),
                      Button(label: '%', onButton: onPercentClicked),
                      Button(label: '÷', onButton: onOperatorClicked),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(label: '7', onButton: onNumberClicked),
                      Button(label: '8', onButton: onNumberClicked),
                      Button(label: '9', onButton: onNumberClicked),
                      Button(label: 'X', onButton: onOperatorClicked),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(label: '4', onButton: onNumberClicked),
                      Button(label: '5', onButton: onNumberClicked),
                      Button(label: '6', onButton: onNumberClicked),
                      Button(label: '+', onButton: onOperatorClicked),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(label: '1', onButton: onNumberClicked),
                      Button(label: '2', onButton: onNumberClicked),
                      Button(label: '3', onButton: onNumberClicked),
                      Button(label: '-', onButton: onOperatorClicked),

      
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(label: '.', onButton: onDotClicked),
                      Button(label: '0', onButton: onNumberClicked),
                      Button(label: 'remove', onButton: onRemoveClicked),
                      Button(
                        label: '=',
                        onButton: onEqualClicked,
                        backgroundColor: const Color(0xF51ec9d8),
                        padding: const EdgeInsets.all(10),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top,
            ),
            child: Switch(
                value: settingProvider.appMode == ThemeMode.dark,
                onChanged:(isDark) {if(isDark){
                  settingProvider.changeAppTheme(ThemeMode.dark);
                }else{
                  settingProvider.changeAppTheme(ThemeMode.light);
                }},
              thumbColor: MaterialStatePropertyAll(AppTheme.grey),
              activeTrackColor: AppTheme.black,
              thumbIcon:settingProvider.appMode ==ThemeMode.light?
              const MaterialStatePropertyAll(Icon(Icons.wb_sunny_rounded)): const MaterialStatePropertyAll(Icon(Icons.nightlight)),
            ),
          ),
        ],
      ),
    );
  }
}
