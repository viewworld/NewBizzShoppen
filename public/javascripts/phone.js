function changePhoneNumber(number){
  if (number.match(/\d/g) != null) {
    if (PHONE_TYPE == 1) {
      if (currentCall == null) {
        $("#calleeText").val(number.match(/\d/g).join(''));
        $("#calleeText").trigger('keyup');
        if (isLogged && (window.auto_dial == true) && ($("#calleeText").val() != '')) {
          call();
        }
      }
    } else if ((PHONE_TYPE == 2) && (window.auto_dial == true)) {
      document.applets[0].API_Call(1, number.match(/\d/g).join(''));
    }
  }
}