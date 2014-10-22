function changePhoneNumber(number){
  if (number.match(/\d/g) != null) {
    if (window.phone_type == 1) {
      if (currentCall == null) {
        $("#calleeText").val(number.match(/\d/g).join(''));
        $("#calleeText").trigger('keyup');
        if (isLogged && (window.auto_dial == true) && ($("#calleeText").val() != '')) {
          call();
        }
      }
    } else if ((window.phone_type == 2)) {
      $("#PhoneNumber").val(number.match(/\d/g).join(''));
      if ((window.auto_dial == true) && ($("#PhoneNumber").val() != '')) {
        document.applets[0].API_Call(1, number.match(/\d/g).join(''));
      }
    }
  }
}