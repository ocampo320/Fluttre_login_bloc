import 'dart:async';

class Validate {
  final validateEmail=StreamTransformer<String,String>.fromHandlers(
      handleData: (email, sink) {
        if( email.contains('@')){
          sink.add(email);
        }else{
          sink.addError("Emil invalidate");
        }
      }

  );
  final validatePassword=StreamTransformer<String,String>.fromHandlers(
      handleData: (pass, sink) {
        if( pass.length>3){
          sink.add(pass);
        }else{
          sink.addError("Password invalidate");
        }
      }

  );
}