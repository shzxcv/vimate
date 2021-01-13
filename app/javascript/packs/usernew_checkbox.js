const checkbox = document.getElementById('user_agreement');
const submit = document.getElementById('js-submit');

//validation対策
if (checkbox.checked) {
  submit.disabled = false;
} else {
  submit.disabled = true;
}

checkbox.addEventListener('change', function() {
  if (this.checked) {
    submit.disabled = false;
  } else {
    submit.disabled = true;
  }
})
