import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String id) onRemove;

  const TransactionList(this.transactions, this.onRemove, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                SizedBox(height: constraints.maxHeight * 0.05),
                Text(
                  'Nenhuma Transação Cadastrada!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Container(
                  height: constraints.maxHeight * 0.60,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final e = transactions[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          'R\$${e.value}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    e.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(e.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 480
                      ? TextButton.icon(
                          onPressed: () => onRemove(e.id),
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          label: Text(
                            'Excluir',
                            style: TextStyle(
                              color: Theme.of(context).errorColor
                            ),
                          ),
                        )
                      : IconButton(
                          onPressed: () => onRemove(e.id),
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                        ),
                ),
              );
            });
  }
}
