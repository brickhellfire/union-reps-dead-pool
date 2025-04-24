class Entry {
  final int? id;
  final String manager;
  final List<String> players;
  final String date;
  final double amount;

  Entry({
    this.id,
    required this.manager,
    required this.players,
    required this.date,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'manager': manager,
      'players': players.join(','),
      'date': date,
      'amount': amount,
    };
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      id: map['id'],
      manager: map['manager'],
      players: map['players'].split(','),
      date: map['date'],
      amount: map['amount'],
    );
  }
}
