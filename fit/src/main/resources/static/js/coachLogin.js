$().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
  $("#signupForm").validate({
    rules: {
      uPhone: {
        required: true,
        minlength: 11
      },
      uPsw: {
        required: true,
        minlength: 6
      },
    messages: {
      uPhone: {
        required: "请输入账号",
        minlength: "帐号必需由11个数字组成"
      },
      uPsw: {
        required: "请输入密码",
        minlength: "密码长度不能小于 6个字母"
      }
    })
});