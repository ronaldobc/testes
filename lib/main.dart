
import 'package:flutter/material.dart';
import 'package:teste/util.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Map<String, dynamic>> lista = []; 

  @override
  void initState() {
    super.initState();

    for(var x = 1; x<=50; x++) {
      lista.add({'id': x, 'titulo': 'Item $x', 'subtitulo': 'Subtitulo item $x'});
    }
  }

  var rolagemController = ScrollController();

  Future atualizar() async {
    Util.showDialogMessage('Listas', 'Atualizou a lista', context);
    return true;
  }

  void clicou(Map<String, dynamic> item) {
    Util.showDialogMessage('Listas', item['titulo'], context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  'Exemplo de Listagem',
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: atualizar,
                  child: RawScrollbar(
                    controller: rolagemController,
                    thumbColor: Colors.red,
                    radius: const Radius.circular(20),
                    thickness: 5,
                    isAlwaysShown: true,
                    child: ListView.separated(
                      controller: rolagemController,
                      separatorBuilder: (context, index) => const Divider(indent: 50, endIndent: 50,),
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), //  
                      itemCount: lista.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          minLeadingWidth: 20,
                          onTap: () => clicou(lista[i]),
                          leading: const Icon(Icons.alarm_sharp),
                          title: Text(lista[i]['titulo']),
                          subtitle: Text(lista[i]['subtitulo']),
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
