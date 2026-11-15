import 'dart:convert';

import 'package:http/http.dart'
as http;

class CurrencyService {

  static Future<double> convert({

    required String from,
    required String to,
    required double amount,

  }) async {

    final url = Uri.parse(

      'https://open.er-api.com/v6/latest/$from',
    );

    final response =
    await http.get(url);

    if (response.statusCode == 200) {

      final data =
      jsonDecode(response.body);

      final rates =
      data['rates'];

      if (rates[to] != null) {

        double rate =
        (rates[to] as num)
            .toDouble();

        return amount * rate;
      }

      else {

        throw Exception(
          'Currency not supported',
        );
      }
    }

    else {

      throw Exception(
        'API failed',
      );
    }
  }
}