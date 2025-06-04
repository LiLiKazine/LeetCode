function decrypt(code, k) {
    if (k === 0) {
        return Array(code.length).fill(0);
    }
    const len = code.length;
    const ans = Array(len);
    let r = k > 0 ? k + 1 : len;
    k = Math.abs(k);
    let s = 0;
    for (let i = r - k; i < r; i++) {
        s += code[i]; // 计算 ans[0]
    }
    for (let i = 0; i < len; i++) {
        ans[i] = s;
        s += code[r % len] - code[(r - k) % len];
        r++;
    }
    return ans;
}

console.log(decrypt([2,4,9,3], -2));
