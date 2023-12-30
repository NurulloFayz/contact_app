class Contact{
  String? name;
  String? number;

  Contact({required this.name,required this.number});

  Contact.fromJson(Map<String,dynamic>json):
      name = json['name'],
        number = json['number'];

  Map<String,dynamic> toJson() => {
    'name' : name,
    'number' : number,
  };
}