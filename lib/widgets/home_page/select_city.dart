import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/helpers/data_helper.dart';
import 'package:weatherapp/models/city.dart';
import 'package:weatherapp/widgets/animator.dart';

class SelectCity extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {


  void selectCity(City value){
    DataHelper.selectedCity = value;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 30,
      child: WidgetAnimator(
          fromTop: true,fromLeft: true, delay: 300,
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                flex: 40,
                child: Text('Select City',style: TextStyle(
                  fontSize: 26
                ),),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 60,
                child: CustomRadioButton(
                  unSelectedColor: Theme.of(context).canvasColor,
                  buttonTextStyle: ButtonTextStyle(
                    unSelectedColor: Theme.of(context).primaryColor
                  ),
                  buttonLables: [
                    DataHelper.cityDubai.cityName,
                    DataHelper.cityAleppo.cityName,
                    DataHelper.cityMoscow.cityName
                  ],
                  buttonValues: [
                    DataHelper.cityDubai,
                    DataHelper.cityAleppo,
                    DataHelper.cityMoscow
                  ],
                  defaultSelected: DataHelper.cityDubai,
                  radioButtonValue: (value) => selectCity(value) ,
                  selectedColor: Theme.of(context).accentColor,
                ),


              )

            ],
          ),
        ),
      ),
    );
  }

}
