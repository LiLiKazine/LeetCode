
function TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}

/**
 * @param {TreeNode} root
 * @return {boolean}
 */
var checkTree = function(root) {
    let leftVal = root.left.val;
    let rightVal = root.right.val;
    return root.val === leftVal + rightVal;
};