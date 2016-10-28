angular
  .module("myApp")
  .controller("LogoutCtrl", LogoutCtrl)

  function LogoutCtrl() {

    var self = this;

  self.loggingOut = function() {
    console.log("THE FUNCTION!!!")
    sessionStorage.clear();
}
}
