class Login{
  var url = Uri.parse(BaseUrl.url.toString() + '/api/v1/login/token');

var body = {
 'username': "admin",
 'password': "admin1" 
};
  var req = http.MultipartRequest('POST', url).fields.addAll(body);

var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode >= 200 && res.statusCode < 300) {
  print(resBody);
}
else {
  print(res.reasonPhrase);
}

}