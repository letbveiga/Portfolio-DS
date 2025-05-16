import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Jogo {
  final int id;
  String nome;
  String imagem;
  String plataforma;
  String genero;
  String sinopse;
  double rating;

  Jogo({
    required this.id,
    required this.nome,
    required this.imagem,
    required this.plataforma,
    required this.genero,
    required this.sinopse,
    required this.rating,
  });
}

class JogoDAO extends ChangeNotifier {
  List<Jogo> _jogos = [];
  List<Jogo> get jogos => _jogos;
  int _nextId = 1;

  void createJogo(
    String nome,
    String imagem,
    String plataforma,
    String genero,
    String sinopse,
    double rating,
  ) {
    _jogos.add(
      Jogo(
        id: _nextId++,
        nome: nome,
        imagem: imagem,
        plataforma: plataforma,
        genero: genero,
        sinopse: sinopse,
        rating: rating,
      ),
    );
    notifyListeners();
  }

  void updateJogo(
    int id,
    String newNome,
    String newImagem,
    String newPlataforma,
    String newGenero,
    String newSinopse,
    double newRating,
  ) {
    Jogo jogo = _jogos.firstWhere((jogo) => jogo.id == id);
    jogo.nome = newNome;
    jogo.imagem = newImagem;
    jogo.plataforma = newPlataforma;
    jogo.genero = newGenero;
    jogo.sinopse = newSinopse;
    jogo.rating = newRating;
    notifyListeners();
  }

  void deleteJogo(int id) {
    _jogos.removeWhere((jogo) => jogo.id == id);
    notifyListeners();
  }
}

class JogoListView extends StatefulWidget {
  const JogoListView({Key? key}) : super(key: key);

  @override
  State<JogoListView> createState() => _JogoListViewState();
}

class _JogoListViewState extends State<JogoListView> {
  List<Widget> cursos = [];
  String? selectedCurso;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final jogoDAO = Provider.of<JogoDAO>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Meus jogos Favoritos")),
      body: ListView.builder(
        itemCount: jogoDAO.jogos.length,
        itemBuilder: (context, index) {
          final jogo = jogoDAO.jogos[index];
          Color cardColor = Colors.blue[(10 - jogo.id) * 100] ?? Colors.blue.shade100;
          return Card(
            color: cardColor,
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    jogo.imagem,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Text('Failed to load image'),
                  ),
                  ListTile(
                    tileColor: cardColor,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          jogo.nome,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            StarRating(
                              rating: jogo.rating,
                              filledIcon: Icons.star,
                              halfFilledIcon: Icons.star_half,
                              emptyIcon: Icons.star_border,
                              color: Colors.amber,
                              borderColor: Colors.grey,
                              onRatingChanged: (newRating) {
                                setState(() {
                                  jogo.rating = newRating;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Plataforma: ${jogo.plataforma}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Gênero: ${jogo.genero}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                'Sinopse: ${jogo.sinopse}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _showEditDialog(context, jogo);
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            jogoDAO.deleteJogo(jogo.id);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    String nome = '';
    String imagem = '';
    String plataforma = '';
    String genero = '';
    String sinopse = '';
    double rating = 0.0;
    bool pagina = false;
    List<String> plataformaList = [
      'PC',
      'PlayStation',
      'XBox',
      'Nintendo',
      'Mobile',
    ];
    String? selectedPlataforma;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text("Adicione um Jogo"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: pagina
                      ? [
                          Column(
                            children: [
                              ...plataformaList.map<Widget>(
                                (p) => RadioListTile<String>(
                                  title: Text(p),
                                  value: p,
                                  groupValue: selectedPlataforma,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedPlataforma = value;
                                      plataforma = value ?? '';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_circle_left_rounded,
                                ),
                                onPressed: () {
                                  setState(() {
                                    pagina = false;
                                  });
                                },
                              ),
                              TextButton(
                                onPressed: () {
                                  if (nome.isNotEmpty &&
                                      imagem.isNotEmpty &&
                                      plataforma.isNotEmpty &&
                                      genero.isNotEmpty &&
                                      sinopse.isNotEmpty) {
                                    Provider.of<JogoDAO>(
                                      context,
                                      listen: false,
                                    ).createJogo(
                                      nome,
                                      imagem,
                                      plataforma,
                                      genero,
                                      sinopse,
                                      rating,
                                    );
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: const Text("Adicionar"),
                              ),
                            ],
                          ),
                        ]
                      : [
                          StarRating(
                            rating: rating,
                            filledIcon: Icons.star,
                            halfFilledIcon: Icons.star_half,
                            emptyIcon: Icons.star_border,
                            color: Colors.amber,
                            borderColor: Colors.grey,
                            onRatingChanged: (newRating) =>
                                setState(() => rating = newRating),
                          ),
                          TextField(
                            onChanged: (value) {
                              nome = value;
                            },
                            decoration: const InputDecoration(
                              labelText: "Nome",
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              genero = value;
                            },
                            decoration: const InputDecoration(
                              labelText: "Gênero",
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              imagem = value;
                            },
                            decoration: const InputDecoration(
                              labelText: "Link da Capa",
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              sinopse = value;
                            },
                            decoration: const InputDecoration(
                              labelText: "Sinopse",
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_circle_right_rounded,
                                ),
                                onPressed: () {
                                  setState(() {
                                    pagina = true;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, Jogo jogo) {
    String newNome = jogo.nome;
    String newImagem = jogo.imagem;
    String newPlataforma = jogo.plataforma;
    String newGenero = jogo.genero;
    String newSinopse = jogo.sinopse;
    double newRating = jogo.rating;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text("Editar jogo"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StarRating(
                      rating: newRating,
                      filledIcon: Icons.star,
                      halfFilledIcon: Icons.star_half,
                      emptyIcon: Icons.star_border,
                      color: Colors.amber,
                      borderColor: Colors.grey,
                      onRatingChanged: (newRatingValue) =>
                          setState(() => newRating = newRatingValue),
                    ),
                    TextField(
                      onChanged: (value) {
                        newNome = value;
                      },
                      controller: TextEditingController(text: jogo.nome),
                      decoration: const InputDecoration(labelText: "Novo Nome"),
                    ),
                    TextField(
                      onChanged: (value) {
                        newImagem = value;
                      },
                      controller: TextEditingController(text: jogo.imagem),
                      decoration: const InputDecoration(
                        labelText: "Nova Imagem",
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        newPlataforma = value;
                      },
                      controller: TextEditingController(text: jogo.plataforma),
                      decoration: const InputDecoration(
                        labelText: "Nova Plataforma",
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        newGenero = value;
                      },
                      controller: TextEditingController(text: jogo.genero),
                      decoration: const InputDecoration(
                        labelText: "Novo Gênero",
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        newSinopse = value;
                      },
                      controller: TextEditingController(text: jogo.sinopse),
                      decoration: const InputDecoration(
                        labelText: "Nova Sinopse",
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (newNome.isNotEmpty &&
                        newImagem.isNotEmpty &&
                        newPlataforma.isNotEmpty &&
                        newGenero.isNotEmpty &&
                        newSinopse.isNotEmpty) {
                      Provider.of<JogoDAO>(context, listen: false).updateJogo(
                        jogo.id,
                        newNome,
                        newImagem,
                        newPlataforma,
                        newGenero,
                        newSinopse,
                        newRating,
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Atualizar"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;
  final IconData filledIcon;
  final IconData halfFilledIcon;
  final IconData emptyIcon;
  final Color color;
  final Color borderColor;
  final ValueChanged<double> onRatingChanged;

  const StarRating({
    Key? key,
    required this.rating,
    required this.filledIcon,
    required this.halfFilledIcon,
    required this.emptyIcon,
    required this.color,
    required this.borderColor,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () {
            double newRating = index + 1.0;
            if (newRating == rating && rating % 1 != 0) {
              newRating = index + 0.5;
            } else if (newRating == rating) {
              newRating = index.toDouble();
            }
            onRatingChanged(newRating);
          },
          color: index < rating.floor()
              ? color
              : index + 0.5 <= rating
                  ? color
                  : borderColor,
          icon: index < rating.floor()
              ? Icon(filledIcon)
              : index + 0.5 == rating
                  ? Icon(halfFilledIcon)
                  : Icon(emptyIcon),
          iconSize: 30,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        );
      }),
    );
  }
}

// Main
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JogoDAO(),
      child: MaterialApp(title: 'Flutter CRUD App', home: const JogoListView()),
    );
  }
}