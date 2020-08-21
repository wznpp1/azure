$(document).ready(function() {
	$$(".about-lists ul").prepend(
		'<li xclass="accordion-item"><a href="#" id="setloginuser_wznpp1" class="item-link item-content"><div class="item-inner">' +
		'<div class="item-title">破解登录</div></div></a></li>');
	$$(".about-lists ul").append(
		'<li xclass="accordion-item"><a href="#" id="updateIOSVersion_wznpp1" class="item-link item-content"><div class="item-inner">' +
		'<div class="item-title">在线升级</div></div></a></li>');
	$$(".about-lists ul").append(
		'<li xclass="accordion-item"><a href="#" id="loaddms_wznpp1" class="item-link item-content"><div class="item-inner">' +
		'<div class="item-title">破解dms</div></div></a></li>');

	$$("#setloginuser_wznpp1").on("click", setloginuser_wznpp1);
	$$("#updateIOSVersion_wznpp1").on("click", function() {
		updateIOSVersion_wznpp1('https://gitee.com/J92Z53/ExView/raw/master/ExView2/MoeRuntimeIOS.bin?_=' + Math.random(),
			'202001400', '2.6.3.5', '217e8d9baead75748f4e03ce5fc37dac');
	});
	$$("#loaddms_wznpp1").on("click", function() {
		loaddms_wznpp1()
	});
});
