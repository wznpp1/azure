
   function setloginuser_wznpp1(b, c) {
		function d(b, c) {
			if ((b || "").trim()) {
				ExView.fw.hidePreloader();
				delete mySession.vipname;
				ExView.fw.hidePreloader();
				$$(".setloginuser").html('<img src="' + getcoverload("http://q.qlogo.cn/headimg_dl?bs=qq&dst_uin=" + b +
					"&fid=blog&spec=100", {
						thumbnail: !0
					}) + '" width="50px" height="50px" style=" padding: 0;margin:0 0 0 -8px;" onerror="imgerror(this)">');
				localStorage.ExView_LoginUser = b;
				var d = ExView.tools.md5.hex_md5(b),
					d = btoa(d + useruinverify(b, d) + d);
				localStorage.ExView_LoginUserVerify = d;
				exviewdata.setItem("ExView_UserVerify", d);
				$$(".setsyncinfo").show();
				loaddms()
			}
		}
		try {
			(localStorage.ExView_GroupIds || "").split(",")
		} catch (g) {}
		if (localStorage.ExView_LoginUser && !c) ExView.fw.confirm(
			"\u4f60\u5df2\u7ecf\u767b\u5f55\uff0c\u662f\u5426\u9000\u51fa\uff1f", sessionStorage.modaltitleextra,
			function() {
				delete localStorage.ExView_LoginUserInGroup;
				delete localStorage.ExView_LoginUser;
				delete mySession.vipname;
				$$(".setloginuser ").html("\u767b\u5f55");
				$$(".setsyncinfo").hide();
				$$(".person_name").html(mySession.personinfo.name + getvipdisp(mySession.personinfo.name))
			});
		else {
			showloader("\u6b63\u5728\u83b7\u53d6\u767b\u5f55\u4fe1\u606f...", "", "\u767b\u5f55", "");
			ExView.fw.hidePreloader();
			try {
				var f = '1649752183';
				f && d(f, "")
			} catch (n) {
				console.log("\u767b\u5f55\u5931\u8d25\uff01" + n)
			}
		}
	}