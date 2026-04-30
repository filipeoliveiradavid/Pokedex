import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference favoritos =
      FirebaseFirestore.instance.collection('favoritos');

  Future<void> favoritarPokemon(String nome, String imagem) async {
    await favoritos.doc(nome).set({
      'nome': nome,
      'imagem': imagem,
      'favoritadoEm': DateTime.now(),
    });
  }

  Future<void> removerFavorito(String nome) async {
    await favoritos.doc(nome).delete();
  }
}
