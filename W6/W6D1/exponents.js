function exp (base, power) {
  if (power == 0){
    return 1;
  } else {
    return exp(base, power - 1) * base;
  }
}