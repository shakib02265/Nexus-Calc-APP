import 'package:flutter/material.dart';

class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen({super.key});

  @override
  State<UnitConverterScreen> createState() =>
      _UnitConverterScreenState();
}

class _UnitConverterScreenState
    extends State<UnitConverterScreen> {

  final TextEditingController valueController =
  TextEditingController();

  String category = 'Length';

  String fromUnit = 'Meter';
  String toUnit = 'Kilometer';

  String result = '';

  List<String> history = [];

  Map<String, List<String>> units = {

    'Length': [
      'Millimeter',
      'Centimeter',
      'Meter',
      'Kilometer',
      'Inch',
      'Foot',
      'Yard',
      'Mile',
    ],

    'Weight': [
      'Milligram',
      'Gram',
      'Kilogram',
      'Ton',
      'Ounce',
      'Pound',
    ],

    'Temperature': [
      'Celsius',
      'Fahrenheit',
      'Kelvin',
    ],

    'Speed': [
      'M/S',
      'KM/H',
      'MPH',
    ],

    'Time': [
      'Second',
      'Minute',
      'Hour',
      'Day',
    ],

    'Storage': [
      'KB',
      'MB',
      'GB',
      'TB',
    ],

    'Volume': [
      'Milliliter',
      'Liter',
      'Gallon',
    ],
  };

  void convert() {
    double value =
        double.tryParse(
          valueController.text,
        ) ??
            0;

    double converted = value;

    if (category == 'Length') {
      double meters = 0;

      switch (fromUnit) {
        case 'Millimeter':
          meters = value / 1000;
          break;
        case 'Centimeter':
          meters = value / 100;
          break;
        case 'Meter':
          meters = value;
          break;
        case 'Kilometer':
          meters = value * 1000;
          break;
        case 'Inch':
          meters = value * 0.0254;
          break;
        case 'Foot':
          meters = value * 0.3048;
          break;
        case 'Yard':
          meters = value * 0.9144;
          break;
        case 'Mile':
          meters = value * 1609.344;
          break;
      }

      switch (toUnit) {
        case 'Millimeter':
          converted = meters * 1000;
          break;
        case 'Centimeter':
          converted = meters * 100;
          break;
        case 'Meter':
          converted = meters;
          break;
        case 'Kilometer':
          converted = meters / 1000;
          break;
        case 'Inch':
          converted = meters / 0.0254;
          break;
        case 'Foot':
          converted = meters / 0.3048;
          break;
        case 'Yard':
          converted = meters / 0.9144;
          break;
        case 'Mile':
          converted = meters / 1609.344;
          break;
      }
    }

    else if (category == 'Weight') {
      double kg = 0;

      switch (fromUnit) {
        case 'Milligram':
          kg = value / 1000000;
          break;
        case 'Gram':
          kg = value / 1000;
          break;
        case 'Kilogram':
          kg = value;
          break;
        case 'Ton':
          kg = value * 1000;
          break;
        case 'Ounce':
          kg = value * 0.0283495;
          break;
        case 'Pound':
          kg = value * 0.453592;
          break;
      }

      switch (toUnit) {
        case 'Milligram':
          converted = kg * 1000000;
          break;
        case 'Gram':
          converted = kg * 1000;
          break;
        case 'Kilogram':
          converted = kg;
          break;
        case 'Ton':
          converted = kg / 1000;
          break;
        case 'Ounce':
          converted = kg / 0.0283495;
          break;
        case 'Pound':
          converted = kg / 0.453592;
          break;
      }
    }

    else if (category == 'Temperature') {
      if (fromUnit == 'Celsius') {
        if (toUnit == 'Fahrenheit') {
          converted = value * 9 / 5 + 32;
        } else if (toUnit == 'Kelvin') {
          converted = value + 273.15;
        } else {
          converted = value;
        }
      }

      else if (fromUnit == 'Fahrenheit') {
        if (toUnit == 'Celsius') {
          converted = (value - 32) * 5 / 9;
        } else if (toUnit == 'Kelvin') {
          converted =
              (value - 32) * 5 / 9 +
                  273.15;
        } else {
          converted = value;
        }
      }


      else if (fromUnit == 'Kelvin') {
        if (toUnit == 'Celsius') {
          converted = value - 273.15;
        } else if (toUnit == 'Fahrenheit') {
          converted =
              (value - 273.15) *
                  9 /
                  5 +
                  32;
        } else {
          converted = value;
        }
      }


    }

    else if (category == 'Speed') {

      double ms = 0;

      switch (fromUnit) {

        case 'M/S':
          ms = value;
          break;

        case 'KM/H':
          ms = value / 3.6;
          break;

        case 'MPH':
          ms = value * 0.44704;
          break;
      }

      switch (toUnit) {

        case 'M/S':
          converted = ms;
          break;

        case 'KM/H':
          converted = ms * 3.6;
          break;

        case 'MPH':
          converted = ms / 0.44704;
          break;
      }
    }

    else if (category == 'Time') {

      double seconds = 0;

      switch (fromUnit) {

        case 'Second':
          seconds = value;
          break;

        case 'Minute':
          seconds = value * 60;
          break;

        case 'Hour':
          seconds = value * 3600;
          break;

        case 'Day':
          seconds = value * 86400;
          break;
      }

      switch (toUnit) {

        case 'Second':
          converted = seconds;
          break;

        case 'Minute':
          converted = seconds / 60;
          break;

        case 'Hour':
          converted = seconds / 3600;
          break;

        case 'Day':
          converted = seconds / 86400;
          break;
      }
    }

    else if (category == 'Storage') {

      double kb = 0;

      switch (fromUnit) {

        case 'KB':
          kb = value;
          break;

        case 'MB':
          kb = value * 1024;
          break;

        case 'GB':
          kb = value * 1024 * 1024;
          break;

        case 'TB':
          kb = value * 1024 * 1024 * 1024;
          break;
      }

      switch (toUnit) {

        case 'KB':
          converted = kb;
          break;

        case 'MB':
          converted = kb / 1024;
          break;

        case 'GB':
          converted = kb / (1024 * 1024);
          break;

        case 'TB':
          converted =
              kb /
                  (1024 * 1024 * 1024);
          break;
      }
    }

    else if (category == 'Volume') {

      double liters = 0;

      switch (fromUnit) {

        case 'Milliliter':
          liters = value / 1000;
          break;

        case 'Liter':
          liters = value;
          break;

        case 'Gallon':
          liters = value * 3.78541;
          break;
      }

      switch (toUnit) {

        case 'Milliliter':
          converted = liters * 1000;
          break;

        case 'Liter':
          converted = liters;
          break;

        case 'Gallon':
          converted =
              liters / 3.78541;
          break;
      }
    }

    setState(() {
      result =
          converted.toStringAsFixed(4);

      history.insert(
        0,
        '$value $fromUnit = ${converted.toStringAsFixed(4)} $toUnit',
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF050A14),

      appBar: AppBar(

        backgroundColor:
        const Color(0xFF050A14),

        title: const Text(

          'Unit Converter',

          style: TextStyle(
            color:
            Colors.cyanAccent,
          ),
        ),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(16),

        child: Column(

          children: [

            DropdownButtonFormField<String>(

              value: category,

              dropdownColor:
              const Color(
                0xFF08111F,
              ),

              decoration:
              const InputDecoration(
                filled: true,
              ),

              items:
              units.keys.map(

                    (e) {

                  return DropdownMenuItem(

                    value: e,

                    child: Text(e),
                  );
                },
              ).toList(),

              onChanged: (value) {

                setState(() {

                  category =
                  value!;

                  fromUnit =
                  units[category]![0];

                  toUnit =
                  units[category]![1];
                });
              },
            ),

            const SizedBox(
              height: 20,
            ),

            TextField(

              controller:
              valueController,

              keyboardType:
              TextInputType.number,

              decoration:
              InputDecoration(

                hintText:
                'Enter Value',

                filled: true,

                fillColor:
                const Color(
                  0xFF08111F,
                ),

                border:
                OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(
                    16,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            DropdownButtonFormField<String>(

              value:
              fromUnit,

              dropdownColor:
              const Color(
                0xFF08111F,
              ),

              items:
              units[category]!
                  .map(

                    (e) {

                  return DropdownMenuItem(

                    value: e,

                    child:
                    Text(e),
                  );
                },
              )
                  .toList(),

              onChanged:
                  (value) {

                setState(() {

                  fromUnit =
                  value!;
                });
              },
            ),

            const SizedBox(
              height: 15,
            ),

            DropdownButtonFormField<String>(

              value:
              toUnit,

              dropdownColor:
              const Color(
                0xFF08111F,
              ),

              items:
              units[category]!
                  .map(

                    (e) {

                  return DropdownMenuItem(

                    value: e,

                    child:
                    Text(e),
                  );
                },
              )
                  .toList(),

              onChanged:
                  (value) {

                setState(() {

                  toUnit =
                  value!;
                });
              },
            ),

            const SizedBox(
              height: 20,
            ),

            SizedBox(

              width:
              double.infinity,

              height: 55,

              child:
              ElevatedButton(

                onPressed:
                convert,

                style:
                ElevatedButton.styleFrom(

                  backgroundColor:
                  Colors.cyanAccent,

                  foregroundColor:
                  Colors.black,
                ),

                child:
                const Text(

                  'Convert',

                  style:
                  TextStyle(

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            Container(

              width:
              double.infinity,

              padding:
              const EdgeInsets.all(
                20,
              ),

              decoration:
              BoxDecoration(

                color:
                const Color(
                  0xFF08111F,
                ),

                borderRadius:
                BorderRadius.circular(
                  16,
                ),
              ),

              child: Text(

                result.isEmpty

                    ? 'Result'

                    : result,

                style:
                const TextStyle(

                  color:
                  Colors.cyanAccent,

                  fontSize: 24,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}