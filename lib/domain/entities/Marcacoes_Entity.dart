import 'package:equatable/equatable.dart';

class MarcacoesEntrity extends Equatable{
  late int? MarcacoesId;
  final String? Data;
  final String? Entrada1;
  final String? Saida1;
  final String? Entrada2;
  final String? Saida2;

  MarcacoesEntrity(
      this.Data,
      { this.MarcacoesId,
        this.Entrada1,
        this.Saida1,
        this.Entrada2,
        this.Saida2
      });

  @override
  List<Object?> get props =>[MarcacoesId];
}