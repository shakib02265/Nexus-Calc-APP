import 'package:flutter/material.dart';

class NumberSystemScreen extends StatefulWidget {
  const NumberSystemScreen({super.key});

  @override
  State<NumberSystemScreen> createState() =>
      _NumberSystemScreenState();
}

class _NumberSystemScreenState
    extends State<NumberSystemScreen> {

  final TextEditingController inputController =
  TextEditingController();

  String selectedType = 'Decimal';

  String binaryResult = '';
  String decimalResult = '';
  String octalResult = '';
  String hexResult = '';

  void convert() {

    try {

      int decimalValue = 0;

      switch (selectedType) {

        case 'Binary':
          decimalValue =
              int.parse(
                inputController.text,
                radix: 2,
              );
          break;

        case 'Octal':
          decimalValue =
              int.parse(
                inputController.text,
                radix: 8,
              );
          break;

        case 'Hexadecimal':
          decimalValue =
              int.parse(
                inputController.text,
                radix: 16,
              );
          break;

        default:
          decimalValue =
              int.parse(
                inputController.text,
              );
      }

      setState(() {

        decimalResult =
            decimalValue.toString();

        binaryResult =
            decimalValue.toRadixString(2);

        octalResult =
            decimalValue.toRadixString(8);

        hexResult =
            decimalValue
                .toRadixString(16)
                .toUpperCase();
      });

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content: Text(
            'Invalid Input',
          ),
        ),
      );
    }
  }

  Widget resultTile(
      String title,
      String value,
      ) {

    return Container(

      margin:
      const EdgeInsets.only(
        bottom: 12,
      ),

      padding:
      const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color:
        const Color(0xFF08111F),

        borderRadius:
        BorderRadius.circular(16),
      ),

      child: Row(

        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,

        children: [

          Text(

            title,

            style:
            const TextStyle(

              color:
              Colors.white70,

              fontSize: 16,
            ),
          ),

          Text(

            value,

            style:
            const TextStyle(

              color:
              Colors.cyanAccent,

              fontSize: 18,

              fontWeight:
              FontWeight.bold,
            ),
          ),
        ],
      ),
    );
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

          'Number System Converter',

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

              value:
              selectedType,

              dropdownColor:
              const Color(
                0xFF08111F,
              ),

              style:
              const TextStyle(
                color:
                Colors.white,
              ),

              decoration:
              InputDecoration(

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

              items: const [

                DropdownMenuItem(
                  value: 'Decimal',
                  child:
                  Text('Decimal'),
                ),

                DropdownMenuItem(
                  value: 'Binary',
                  child:
                  Text('Binary'),
                ),

                DropdownMenuItem(
                  value: 'Octal',
                  child:
                  Text('Octal'),
                ),

                DropdownMenuItem(
                  value:
                  'Hexadecimal',
                  child:
                  Text(
                    'Hexadecimal',
                  ),
                ),
              ],

              onChanged: (value) {

                setState(() {

                  selectedType =
                  value!;
                });
              },
            ),

            const SizedBox(
              height: 20,
            ),

            TextField(

              controller:
              inputController,

              style:
              const TextStyle(
                color:
                Colors.white,
              ),

              decoration:
              InputDecoration(

                hintText:
                'Enter Number',

                hintStyle:
                const TextStyle(
                  color:
                  Colors.white54,
                ),

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

            SizedBox(

              width:
              double.infinity,

              height: 55,

              child:
              ElevatedButton(

                style:
                ElevatedButton.styleFrom(

                  backgroundColor:
                  Colors.cyanAccent,

                  foregroundColor:
                  Colors.black,
                ),

                onPressed:
                convert,

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

            resultTile(
              'Decimal',
              decimalResult,
            ),

            resultTile(
              'Binary',
              binaryResult,
            ),

            resultTile(
              'Octal',
              octalResult,
            ),

            resultTile(
              'Hexadecimal',
              hexResult,
            ),
          ],
        ),
      ),
    );
  }
}