const pay = () => {
  Payjp.setPublicKey("pk_test_1c946372aaf491e628c90540");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buying[number]"),
      cvc: formData.get("buying[cvc]"),
      exp_month: formData.get("buying[exp_month]"),
      exp_year: `20${formData.get("buying[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }
    });
  });
};

window.addEventListener("load", pay);