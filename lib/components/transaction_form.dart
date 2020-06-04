import 'package:flutter/material.dart';

class TrasactionForm extends StatefulWidget {
  final void Function (String, double) onSubmit;

  TrasactionForm(this.onSubmit);

  @override
  _TrasactionFormState createState() => _TrasactionFormState();
}

class _TrasactionFormState extends State<TrasactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm(){
     final title = titleController.text;
     final value = double.tryParse(valueController.text) ?? 0.0;
    if(title.isEmpty || value <= 0){
      return;
    }
    widget.onSubmit(title,value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation:5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  onSubmitted:(value) => _submitForm(),
                  decoration: InputDecoration(
                    labelText: 'Titulo',
                  ),
                ),
                TextField(
                  controller: valueController,
                  keyboardType: TextInputType.numberWithOptions(decimal:true),
                  onSubmitted:(value) => _submitForm(),
                  decoration: InputDecoration(
                    labelText: 'Valor (R\$)' ,
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(                                     
                     child: Text('Nova Transação'),
                     textColor: Colors.purple,
                     onPressed: _submitForm,
                     ),
                  ],
                ),
                
              ],
              ),
            ),
          );
  }
}