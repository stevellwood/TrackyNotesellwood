app.controller("LoginCtrl", LoginCtrl)

  LoginCtrl.$inject = ["$http", "$window"]

  function LoginCtrl($http, $window) {

    var self = this;

  self.getLogin = function(username, pass) {
    var login = {};
    // login.id = 1000;
    login.user_name = username;
    console.log(username)
    login.password = pass;
    console.log(pass)
    // console.log(login)
    $http({
        method: "POST",
        url: 'http://localhost:8080/login',
        data: login
      })
  			.then(function(resp) {
  				console.log("SUCCESS: " + resp)
          if(resp.data > 3) {
            sessionStorage.setItem("globaluserid", resp.data);
            console.log(sessionStorage.getItem("globaluserid"));
            $window.location.href = '/#/home';
          } else {
            $window.alert("Incorrect Login/Password");
          }
  			});
}
}
