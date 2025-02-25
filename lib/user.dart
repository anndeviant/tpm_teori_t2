class Users {
    final int? userId;
    final String fullname;
    final String email;
    final String password;

    Users({
        this.userId,
        required this.fullname,
        required this.email,
        required this.password,
    });

    factory Users.fromMap(Map<String, dynamic> json) => Users(
        userId: json["userId"],
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId,
        "fullname": fullname,
        "email": email,
        "password": password,
    };
}
