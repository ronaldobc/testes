import 'package:flutter/material.dart';

class Util {
  
  static String lingua = 'pt-br';

  static void showInSnackBar(String value, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(10),
        content: Text(
          value,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  static Future showDialogMessage(
      String titulo, String conteudo, BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(conteudo),
          actions: <Widget>[
            TextButton(
              child: const Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showConfirmation(
      String titulo,
      String conteudo,
      String positivo,
      String negativo,
      BuildContext context,
      Function funcPositivo,
      Function funcNegativo,
      {botaoCancelar = false}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(conteudo),
          actions: <Widget>[
            (botaoCancelar)
                ? TextButton(
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                : const SizedBox(),
            TextButton(
              child: Text(
                negativo,
                style: const TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                funcNegativo();
              },
            ),
            TextButton(
              child: Text(
                positivo,
                style: const TextStyle(color: Colors.green),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                funcPositivo();
              },
            ),
          ],
        );
      },
    );
  }

 
}
