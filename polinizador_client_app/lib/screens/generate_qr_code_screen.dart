import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';

import '../models/product.dart';

class GenerateQRCodeScreen extends StatefulWidget {
  const GenerateQRCodeScreen();

  @override
  _GenerateQRCodeScreenState createState() => _GenerateQRCodeScreenState();
}

class _GenerateQRCodeScreenState extends State<GenerateQRCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title;
  String _description;
  String _price;
  String _imageUrl;
  QrImage _qrCode;

  void _saveForm() {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    final product = Product(
      id: Uuid().v1(),
      name: _title,
      description: _description,
      price: double.parse(_price),
      imageUrl: _imageUrl,
    );
    _qrCode = QrImage(
      data: product.toJson(),
      size: 200,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gerar QR Code')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTitleField(label: 'Título'),
                _buildDescriptionField(label: 'Descrição'),
                _buildPriceField(label: 'Preço'),
                _buildUrlField(label: 'URL de imagem'),
                const SizedBox(height: 20),
                if (_qrCode != null) _qrCode,
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text('GERAR QR CODE'),
                    onPressed: _saveForm,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleField({String label}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      onSaved: (newValue) => _title = newValue,
      validator: (value) => value.isEmpty ? 'Campo obrigatório' : null,
    );
  }

  Widget _buildDescriptionField({String label}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      onSaved: (newValue) => _description = newValue,
      validator: (value) => value.isEmpty ? 'Campo obrigatório' : null,
    );
  }

  Widget _buildPriceField({String label}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      onSaved: (newValue) => _price = newValue,
      validator: (value) => value.isEmpty ? 'Campo obrigatório' : null,
    );
  }

  Widget _buildUrlField({String label}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      onSaved: (newValue) => _imageUrl = newValue,
      validator: (value) => value.isEmpty ? 'Campo obrigatório' : null,
    );
  }
}
