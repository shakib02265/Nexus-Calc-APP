import 'package:flutter/material.dart';

import '../services/currency_service.dart';
import 'settings_screen.dart';
class CurrencyMode extends StatefulWidget {

  const CurrencyMode({super.key});

  @override
  State<CurrencyMode> createState() =>
      _CurrencyModeState();
}

class _CurrencyModeState
    extends State<CurrencyMode> {

  final TextEditingController
  amountController =
  TextEditingController();

  /// DEFAULT
  String from = 'BDT';
  String to = 'USD';

  String result = '0';

  bool loading = false;

  /// CURRENCIES
  final Map<String, String> currencies = {

    'BDT': 'Bangladeshi Taka',
    'USD': 'US Dollar',
    'INR': 'Indian Rupee',
    'EUR': 'Euro',
    'GBP': 'British Pound',
    'AED': 'UAE Dirham',
    'SAR': 'Saudi Riyal',
    'PKR': 'Pakistani Rupee',
    'JPY': 'Japanese Yen',
    'CNY': 'Chinese Yuan',
    'KRW': 'South Korean Won',
    'AUD': 'Australian Dollar',
    'CAD': 'Canadian Dollar',
    'CHF': 'Swiss Franc',
    'SGD': 'Singapore Dollar',
    'MYR': 'Malaysian Ringgit',
    'THB': 'Thai Baht',
    'IDR': 'Indonesian Rupiah',
    'PHP': 'Philippine Peso',
    'VND': 'Vietnamese Dong',
    'HKD': 'Hong Kong Dollar',
    'NZD': 'New Zealand Dollar',
    'SEK': 'Swedish Krona',
    'NOK': 'Norwegian Krone',
    'DKK': 'Danish Krone',
    'ZAR': 'South African Rand',
    'BRL': 'Brazilian Real',
    'MXN': 'Mexican Peso',
    'TRY': 'Turkish Lira',
    'RUB': 'Russian Ruble',
  };

  Future<void> convert() async {

    if (amountController.text.isEmpty) {
      return;
    }

    setState(() {

      loading = true;
    });

    try {

      double amount =
      double.parse(
        amountController.text,
      );

      double converted =
      await CurrencyService.convert(

        from: from,
        to: to,
        amount: amount,
      );

      setState(() {

        result =
            converted.toStringAsFixed(2);
      });

    } catch (e) {

      result = 'Error';
    }

    setState(() {

      loading = false;
    });
  }

  Widget buildDropdown({

    required String value,
    required Function(String?) onChanged,

  }) {

    return Container(

      padding:
      const EdgeInsets.symmetric(

        horizontal: 20,
      ),

      decoration:
      BoxDecoration(

        color:
        const Color(0xFF0B132B),

        borderRadius:
        BorderRadius.circular(
          22,
        ),

        border: Border.all(

          color:
          Colors.cyanAccent
              .withOpacity(0.08),
        ),
      ),

      child:
      DropdownButton<String>(

        value: value,

        dropdownColor:
        const Color(0xFF0B132B),

        isExpanded: true,

        underline:
        const SizedBox(),

        iconEnabledColor:
        Colors.cyanAccent,

        style:
        const TextStyle(

          color:
          Colors.white,

          fontSize: 16,
        ),

        items: currencies.entries
            .map((e) {

          return DropdownMenuItem(

            value: e.key,

            child: Text(

              '${e.key} - ${e.value}',
            ),
          );
        }).toList(),

        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF020817),

      body: SafeArea(

        child: Padding(

          padding:
          const EdgeInsets.all(20),

          child: Column(

            children: [

              const SizedBox(height: 20),

              const Text(

                'CURRENCY',

                style: TextStyle(

                  color:
                  Colors.cyanAccent,

                  fontSize: 28,

                  fontWeight:
                  FontWeight.bold,

                  letterSpacing: 3,
                ),
              ),

              const SizedBox(height: 40),

              /// AMOUNT
              TextField(

                controller:
                amountController,

                keyboardType:
                TextInputType.number,

                style:
                const TextStyle(

                  color:
                  Colors.white,
                ),

                decoration:
                InputDecoration(

                  hintText:
                  'Enter Amount',

                  hintStyle:
                  const TextStyle(

                    color:
                    Colors.white54,
                  ),

                  filled: true,

                  fillColor:
                  const Color(
                    0xFF0B132B,
                  ),

                  border:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius.circular(
                      22,
                    ),

                    borderSide:
                    BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// FROM
              buildDropdown(

                value: from,

                onChanged: (value) {

                  setState(() {

                    from = value!;
                  });
                },
              ),

              const SizedBox(height: 22),

              /// SWAP BUTTON
              GestureDetector(

                onTap: () {

                  setState(() {

                    String temp = from;

                    from = to;

                    to = temp;
                  });
                },

                child: Container(

                  padding:
                  const EdgeInsets.all(16),

                  decoration:
                  BoxDecoration(

                    color:
                    Colors.cyanAccent,

                    borderRadius:
                    BorderRadius.circular(
                      20,
                    ),

                    boxShadow: [

                      BoxShadow(

                        color:
                        Colors.cyanAccent
                            .withOpacity(
                          0.4,
                        ),

                        blurRadius: 14,
                      ),
                    ],
                  ),

                  child: const Icon(

                    Icons.swap_vert_rounded,

                    color:
                    Colors.black,

                    size: 28,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              /// TO
              buildDropdown(

                value: to,

                onChanged: (value) {

                  setState(() {

                    to = value!;
                  });
                },
              ),

              const SizedBox(height: 40),

              /// RESULT
              Container(

                width: double.infinity,

                padding:
                const EdgeInsets.all(28),

                decoration:
                BoxDecoration(

                  gradient:
                  const LinearGradient(

                    colors: [

                      Color(0xFF08111F),
                      Color(0xFF0E1838),
                    ],
                  ),

                  borderRadius:
                  BorderRadius.circular(
                    30,
                  ),

                  border: Border.all(

                    color:
                    Colors.cyanAccent
                        .withOpacity(0.1),
                  ),
                ),

                child: Column(

                  children: [

                    const Text(

                      'RESULT',

                      style: TextStyle(

                        color:
                        Colors.white54,

                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 14),

                    Text(

                      result,

                      style:
                      const TextStyle(

                        color:
                        Colors.cyanAccent,

                        fontSize: 42,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(

                      '$from → $to',

                      style:
                      const TextStyle(

                        color:
                        Colors.white38,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              /// CONVERT BUTTON
              GestureDetector(

                onTap: convert,

                child: Container(

                  width: double.infinity,

                  padding:
                  const EdgeInsets.symmetric(

                    vertical: 20,
                  ),

                  decoration:
                  BoxDecoration(

                    color:
                    Colors.cyanAccent,

                    borderRadius:
                    BorderRadius.circular(
                      24,
                    ),

                    boxShadow: [

                      BoxShadow(

                        color:
                        Colors.cyanAccent
                            .withOpacity(
                          0.5,
                        ),

                        blurRadius: 18,
                      ),
                    ],
                  ),

                  child: Center(

                    child: loading

                        ? const CircularProgressIndicator(
                      color:
                      Colors.black,
                    )

                        : const Text(

                      'CONVERT',

                      style: TextStyle(

                        color:
                        Colors.black,

                        fontSize: 18,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}