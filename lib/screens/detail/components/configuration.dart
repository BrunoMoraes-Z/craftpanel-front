import 'package:craft_panel/components/my_button.dart';
import 'package:craft_panel/components/my_text_field.dart';
import 'package:craft_panel/constants.dart';
import 'package:flutter/material.dart';

class Configuration extends StatelessWidget {
  const Configuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConfigurationField(
                label: 'Memória Ram',
                onChange: (v) {},
              ),
              ConfigurationField(
                label: 'Nome do Servidor',
                onChange: (v) {},
              ),
              ConfigurationField(
                label: 'Porta',
                onChange: (v) {},
              ),
            ],
          ),
          SizedBox(width: 48),
          Container(
            padding: const EdgeInsets.only(top: 24),
            child: MyButton(
              text: 'Salvar',
              onClick: () {},
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }
}

class ConfigurationField extends StatelessWidget {
  const ConfigurationField({
    Key? key,
    required this.label,
    required this.onChange,
  }) : super(key: key);

  final String label;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
        SizedBox(height: 8),
        MyTextField(
          '',
          onChange: onChange,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
