class Users {
    final int? userid;
    final String fullname;
    final String email;
    final String password;

    Users({
        this.userid,
        required this.fullname,
        required this.email,
        required this.password,
    });

    factory Users.fromMap(Map<String, dynamic> json) => Users(
        userid: json["userid"],
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "userid": userid,
        "fullname": fullname,
        "email": email,
        "password": password,
    };
}
