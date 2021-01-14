const password_input_flag = gon.password_input_flag
const password = document.getElementById('js-password');

$(document).ready(function () {
  if ( password_input_flag ) {
    password.setAttribute('disabled', 'true');
  }
})
