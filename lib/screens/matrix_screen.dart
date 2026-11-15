import 'package:flutter/material.dart';

class MatrixScreen extends StatefulWidget {
  const MatrixScreen({super.key});

  @override
  State<MatrixScreen> createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  int rows = 2;
  int cols = 2;


  List<List<TextEditingController>> matrixA = [];
  List<List<TextEditingController>> matrixB = [];
  String result = '';
  @override
  void initState() {
    super.initState();
    generateMatrices();
  }

  void generateMatrices() {
    matrixA = List.generate(
      rows,
          (_) => List.generate(
        cols,
            (_) => TextEditingController(),
      ),
    );

    matrixB = List.generate(
      rows,
          (_) => List.generate(
        cols,
            (_) => TextEditingController(),
      ),
    );

    setState(() {});
  }

  Widget buildMatrix(
      List<List<TextEditingController>> matrix,
      ) {
    return Column(
      children: List.generate(
        rows,
            (i) => Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: List.generate(
            cols,
                (j) => Container(
              width: 55,
              margin:
              const EdgeInsets.all(4),
              child: TextField(
                controller: matrix[i][j],
                keyboardType:
                TextInputType.number,
                textAlign:
                TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
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
                      10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  List<List<double>> getMatrixValues(
      List<List<TextEditingController>> matrix,
      ) {
    return List.generate(
      rows,
          (i) => List.generate(
        cols,
            (j) =>
        double.tryParse(
          matrix[i][j].text,
        ) ??
            0,
      ),
    );
  }
  void addMatrices() {

    final A =
    getMatrixValues(matrixA);

    final B =
    getMatrixValues(matrixB);

    List<List<double>> resultMatrix =
    List.generate(
      rows,
          (i) => List.generate(
        cols,
            (j) =>
        A[i][j] + B[i][j],
      ),
    );

    showResult(resultMatrix);
  }
  void subtractMatrices() {

    final A =
    getMatrixValues(matrixA);

    final B =
    getMatrixValues(matrixB);

    List<List<double>> resultMatrix =
    List.generate(
      rows,
          (i) => List.generate(
        cols,
            (j) =>
        A[i][j] - B[i][j],
      ),
    );
    showResult(resultMatrix);

  }

  void multiplyMatrices() {

    final A = getMatrixValues(matrixA);
    final B = getMatrixValues(matrixB);

    if (rows != cols) {
      setState(() {
        result =
        "Multiplication currently requires square matrices";
      });
      return;
    }

    List<List<double>> resultMatrix =
    List.generate(
      rows,
          (_) => List.generate(
        cols,
            (_) => 0,
      ),
    );

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        for (int k = 0; k < cols; k++) {

          resultMatrix[i][j] +=
              A[i][k] * B[k][j];
        }
      }
    }

    showResult(resultMatrix);
  }
  void determinantMatrix() {

    final A =
    getMatrixValues(matrixA);

    if (rows != cols) {

      setState(() {
        result =
        "Matrix must be square";
      });

      return;
    }

    if (rows == 2) {

      double det =
          (A[0][0] * A[1][1]) -
              (A[0][1] * A[1][0]);

      setState(() {
        result =
        "Determinant = ${det.toStringAsFixed(2)}";
      });

      return;
    }

    if (rows == 3) {

      double det =

          A[0][0] *
              (A[1][1] * A[2][2] -
                  A[1][2] * A[2][1])

              -

              A[0][1] *
                  (A[1][0] * A[2][2] -
                      A[1][2] * A[2][0])

              +

              A[0][2] *
                  (A[1][0] * A[2][1] -
                      A[1][1] * A[2][0]);

      setState(() {

        result =
        "Determinant = ${det.toStringAsFixed(2)}";
      });

      return;
    }

    setState(() {

      result =
      "Determinant supports 2×2 and 3×3 currently";
    });
  }
  void inverseMatrix() {

    if (rows != 2 || cols != 2) {

      setState(() {

        result =
        "Inverse supports only 2×2";
      });

      return;
    }

    final A =
    getMatrixValues(matrixA);

    double a = A[0][0];
    double b = A[0][1];
    double c = A[1][0];
    double d = A[1][1];

    double det =
        (a * d) - (b * c);

    if (det == 0) {

      setState(() {

        result =
        "Matrix has no inverse";
      });

      return;
    }

    List<List<double>> inverse = [

      [
        d / det,
        -b / det,
      ],

      [
        -c / det,
        a / det,
      ],
    ];

    showResult(inverse);
  }


  void showResult(
      List<List<double>> matrix,
      ) {

    String text = '';

    for (
    int i = 0;
    i < matrix.length;
    i++
    ) {

      text +=
          matrix[i]
              .map(
                (e) =>
                e
                    .toStringAsFixed(
                  2,
                ),
          )
              .join('   ');

      text += '\n';
    }

    setState(() {

      result = text;
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
          'Matrix Calculator',
          style: TextStyle(
            color: Colors.cyanAccent,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding:
        const EdgeInsets.all(16),
        child: Column(
          children: [

            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [

                DropdownButton<int>(
                  value: rows,
                  dropdownColor:
                  const Color(
                    0xFF08111F,
                  ),
                  items: [2, 3, 4, 5, 6]
                      .map(
                        (e) =>
                        DropdownMenuItem(
                          value: e,
                          child: Text(
                            '$e Rows',
                            style:
                            const TextStyle(
                              color:
                              Colors.white,
                            ),
                          ),
                        ),
                  )
                      .toList(),
                  onChanged: (value) {
                    rows = value!;
                    generateMatrices();
                  },
                ),

                const SizedBox(
                  width: 20,
                ),

                DropdownButton<int>(
                  value: cols,
                  dropdownColor:
                  const Color(
                    0xFF08111F,
                  ),
                  items: [2, 3, 4, 5, 6]
                      .map(
                        (e) =>
                        DropdownMenuItem(
                          value: e,
                          child: Text(
                            '$e Cols',
                            style:
                            const TextStyle(
                              color:
                              Colors.white,
                            ),
                          ),
                        ),
                  )
                      .toList(),
                  onChanged: (value) {
                    cols = value!;
                    generateMatrices();
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Matrix A",
              style: TextStyle(
                color: Colors.cyanAccent,
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            buildMatrix(matrixA),

            const SizedBox(height: 25),

            const Text(
              "Matrix B",
              style: TextStyle(
                color: Colors.cyanAccent,
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            buildMatrix(matrixB),

            const SizedBox(height: 25),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [

                ElevatedButton(
                  onPressed: addMatrices,
                  child: const Text("Add"),
                ),

                ElevatedButton(
                  onPressed: subtractMatrices,
                  child: const Text("Subtract"),
                ),

                ElevatedButton(
                  onPressed: multiplyMatrices,
                  child: const Text("Multiply"),
                ),

                ElevatedButton(
                  onPressed: determinantMatrix,
                  child: const Text("Determinant"),
                ),

                ElevatedButton(
                  onPressed: inverseMatrix,
                  child: const Text("Inverse"),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding:
              const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color:
                const Color(
                  0xFF08111F,
                ),
                borderRadius:
                BorderRadius.circular(
                  20,
                ),
              ),
              child: Text(
                result.isEmpty
                    ? "Result will appear here"
                    : result,

                textAlign: TextAlign.center,

                style: const TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}