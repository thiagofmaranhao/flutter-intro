import 'package:conversor_moeda/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<CurrencyModel> currencies;
  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;
  final TextEditingController toText;
  final TextEditingController fromText;

  HomeController({this.toText, this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert() {
    String text = fromText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;

    if (toCurrency.name == 'Real') {
      returnValue = value * fromCurrency.real;
    } else if (toCurrency.name == 'Dolar') {
      returnValue = value * fromCurrency.dolar;
    } else if (toCurrency.name == 'Euro') {
      returnValue = value * fromCurrency.euro;
    } else if (toCurrency.name == 'Bitcoin') {
      returnValue = value * fromCurrency.bitcoin;
    }

    toText.text = returnValue.toStringAsFixed(2);
  }
}
