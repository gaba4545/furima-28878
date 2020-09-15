function money_cal(){

  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener('input', () => {
    let money = Math.round(price.value * 0.1) ;
    let pull = price.value - money;
    
    tax.innerHTML = money;
    profit.innerHTML = pull;
  });
}
setInterval(money_cal, 1000);