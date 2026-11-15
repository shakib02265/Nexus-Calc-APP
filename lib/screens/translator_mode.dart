import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatorMode extends StatefulWidget {
  const TranslatorMode({super.key});

  @override
  State<TranslatorMode> createState() =>
      _TranslatorModeState();
}

class _TranslatorModeState
    extends State<TranslatorMode> {

  final TextEditingController inputController =
  TextEditingController();

  final GoogleTranslator translator =
  GoogleTranslator();

  String translatedText = '';

  bool isLoading = false;

  String fromLanguage = 'English';
  String toLanguage = 'Bangla';

  final List<String> languages = [

    'English',
    'Bangla',
    'Hindi',
    'Arabic',
    'Urdu',
  ];

  final Map<String, String> languageCodes = {

    'English': 'en',
    'Bangla': 'bn',
    'Hindi': 'hi',
    'Arabic': 'ar',
    'Urdu': 'ur',
  };

  Future<void> translateText() async {

    String text =
    inputController.text.trim();

    if (text.isEmpty) return;

    setState(() {

      isLoading = true;
    });

    try {

      final translation =
      await translator.translate(

        text,

        from:
        languageCodes[fromLanguage]!,

        to:
        languageCodes[toLanguage]!,
      );

      setState(() {

        translatedText =
            translation.text;
      });

    } catch (e) {

      setState(() {

        translatedText =
        'Translation Failed';
      });

    } finally {

      setState(() {

        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF050A14),

      body: SafeArea(

        child: SingleChildScrollView(

          padding:
          const EdgeInsets.all(16),

          child: Column(

            children: [

              const SizedBox(height: 20),

              const Text(

                "TRANSLATOR",

                style: TextStyle(

                  color:
                  Colors.cyanAccent,

                  fontSize: 26,

                  fontWeight:
                  FontWeight.bold,

                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 25),

              Row(

                children: [

                  Expanded(

                    child:
                    DropdownButtonFormField<String>(

                      value:
                      fromLanguage,

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

                      items:
                      languages.map(

                            (lang) {

                          return DropdownMenuItem(

                            value: lang,

                            child:
                            Text(lang),
                          );
                        },
                      ).toList(),

                      onChanged:
                          (value) {

                        setState(() {

                          fromLanguage =
                          value!;
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: 10),

                  IconButton(

                    onPressed: () {

                      setState(() {

                        final temp =
                            fromLanguage;

                        fromLanguage =
                            toLanguage;

                        toLanguage =
                            temp;
                      });
                    },

                    icon: const Icon(

                      Icons.swap_horiz,

                      color:
                      Colors.cyanAccent,

                      size: 32,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(

                    child:
                    DropdownButtonFormField<String>(

                      value:
                      toLanguage,

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

                      items:
                      languages.map(

                            (lang) {

                          return DropdownMenuItem(

                            value: lang,

                            child:
                            Text(lang),
                          );
                        },
                      ).toList(),

                      onChanged:
                          (value) {

                        setState(() {

                          toLanguage =
                          value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              TextField(

                controller:
                inputController,

                maxLines: 6,

                style:
                const TextStyle(
                  color:
                  Colors.white,
                ),

                decoration:
                InputDecoration(

                  hintText:
                  "Enter text",

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
                      20,
                    ),
                  ),

                  enabledBorder:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius.circular(
                      20,
                    ),

                    borderSide:
                    BorderSide(

                      color:
                      Colors.cyanAccent
                          .withOpacity(
                        0.3,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

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

                    shape:
                    RoundedRectangleBorder(

                      borderRadius:
                      BorderRadius.circular(
                        16,
                      ),
                    ),
                  ),

                  onPressed: () async {

                    await translateText();
                  },

                  child: isLoading

                      ? const SizedBox(

                    width: 24,
                    height: 24,

                    child:
                    CircularProgressIndicator(

                      strokeWidth: 3,

                      color:
                      Colors.black,
                    ),
                  )

                      : const Text(

                    "Translate",

                    style:
                    TextStyle(

                      fontSize: 18,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

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
                    20,
                  ),

                  border:
                  Border.all(

                    color:
                    Colors.cyanAccent
                        .withOpacity(
                      0.2,
                    ),
                  ),
                ),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    const Text(

                      "Translation",

                      style: TextStyle(

                        color:
                        Colors.cyanAccent,

                        fontSize: 16,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(

                      translatedText
                          .isEmpty

                          ? 'Translation will appear here'

                          : translatedText,

                      style:
                      const TextStyle(

                        color:
                        Colors.white,

                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}