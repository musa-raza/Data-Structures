function isUnique(str) {
  let seen = {};
  for (let i = 0; i < str.length; i++) {
    let char = str[i];
    if (char === " ") {
      continue;
    }
    if (!seen[char]) {
       seen[char] = 1;
     } else {
      return false;
     }
  }
  return true;
}
