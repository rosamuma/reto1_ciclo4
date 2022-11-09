import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Reto 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Conversor de Divisas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String opc1 = "USD";
String opc2 = "COP";

final textorigen = TextEditingController();
final textdestino = TextEditingController();

class calculadora {
  final titulo;
  final icono1;
  final color;

  calculadora(this.titulo, this.icono1, this.color);
}

List<DropdownMenuItem<String>> item3 = <DropdownMenuItem<String>>[
  DropdownMenuItem (
    child: Text("USD"), 
    value: "USD"
  ,),
  DropdownMenuItem (
    child: Text("EUR"), 
    value: "EUR"
  ,),
  DropdownMenuItem (
    child: Text("COP"), 
    value: "COP"
  ,),
];

List<calculadora> calcu = <calculadora>[
  calculadora("7", Icon(Icons.abc_outlined), Colors.blue),
  calculadora("8", Icon(Icons.abc_outlined), Colors.blue),
  calculadora("9", Icon(Icons.abc_outlined), Colors.blue),
  calculadora("4", Icon(Icons.abc_outlined), Colors.blue),
  calculadora("5", Icon(Icons.abc_outlined), Colors.blue),
  calculadora("6", Icon(Icons.abc_outlined), Colors.blue),
  calculadora("1", Icon(Icons.abc_outlined), Colors.blue),
  calculadora("2", Icon(Icons.abc_outlined), Colors.blue),
  calculadora("3", Icon(Icons.abc_outlined), Colors.blue),
  calculadora("0", Icon(Icons.abc_outlined), Colors.blue),
  calculadora("Limpiar", Icon(Icons.cleaning_services, color: Colors.black, size: 30,), Colors.blue),
  calculadora("Calcular", Icon(Icons.calculate, color: Colors.black, size: 30,), Colors.blue),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        body: Padding(
          padding: EdgeInsets.all(20), 
          child: Column(
            children: [
              Row(children: [
                Text("De: "),//origen
                VerticalDivider(),
                DropdownButton(
                  value: opc1,
                  items: item3, 
                  onChanged: (String? x) {
                    setState(() {
                      opc1 = x.toString();
                    });
                  }),
                VerticalDivider(),
                VerticalDivider(),
                Text("A: "),//destino
                VerticalDivider(),
                DropdownButton(
                  value: opc2,
                  items: item3, 
                  onChanged: (String? x) {
                    setState(() {
                     opc2=x.toString();
                    });
                  })
              ],),
              TextField(
                controller: textorigen,
                decoration: InputDecoration(labelText: "Origen", hintText: "0"),), //hintText (placeholder)
              TextField(
                controller: textdestino,
                decoration: InputDecoration(labelText: "Destino", hintText: "0"),),
              Expanded(
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: calcu.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: calcu[index].color,
                    child: ListTile(
                      title: Center(child: index>9
                        ? calcu[index].icono1
                        : Text(
                            calcu[index].titulo, 
                            style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          )
                      ), 
                        onTap: (){
                          if (index<10){
                            textorigen.text = textorigen.text + calcu [index].titulo;
                          } else if (index == 10) {
                            textorigen.text = "";
                            textdestino.text = "";
                          } else {
                            if (opc1=="USD" && opc2 == "COP"){
                              textdestino.text=
                              (double.parse(textorigen.text)*5069).toStringAsFixed(4);
                            } else if (opc1=="COP" && opc2 == "USD"){
                              textdestino.text=
                              (double.parse(textorigen.text)/5069).toStringAsFixed(4);
                            } else if (opc1=="USD" && opc2 == "EUR"){
                              textdestino.text=
                              (double.parse(textorigen.text)*1.01).toStringAsFixed(4);
                            } else if (opc1=="EUR" && opc2 == "USD"){
                              textdestino.text=
                              (double.parse(textorigen.text)/1.01).toStringAsFixed(4); 
                            } else if (opc1=="EUR" && opc2 == "COP"){
                              textdestino.text=
                              (double.parse(textorigen.text)*5023).toStringAsFixed(4); 
                            } else if (opc1=="COP" && opc2 == "EUR"){
                              textdestino.text=
                              (double.parse(textorigen.text)/5023).toStringAsFixed(4);
                            } else {
                              textdestino.text= textorigen.text;
                            }
                          }    
                        },
                    ),
              );
            },
          ),)],)
        ),
    );
  }
}
