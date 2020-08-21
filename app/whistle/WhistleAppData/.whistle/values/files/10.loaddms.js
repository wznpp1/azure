

	function loaddms_wznpp1() {
		function retryLoadJS_wznpp1(b, c, d, f, g, h, k) {
			function getdmsdata_wznpp1(b) {
				b = b || {};
				var c = b.successfn,
					d = b.errorfn;
				ExView.modules.curl({
					url: b.url,
					method: "GET",
					timeout: 60,
					mimetype: "text/plain; charset=x-user-defined",
					successfn: function(b, g) {
						for (var h = [], k = 0, m = b.length; k < m; ++k) {
							var l = b.charCodeAt(k) & 255;
							h.push(l)
						}
						console.log(h);
						80 != h[0] && (h = [80, 75, 3, 4, 20, 0, 0, 8, 8, 0].concat(h));
						var h = Uint8Array.from(h).buffer,
							n = new JSZip;
						n.loadAsync(h).then(function(b) {
							console.log(b);

							n.file(Object.keys(b.files)[0]).async("blob").then(function(b) {
								console.log(b);
								var d = new FileReader;
								d.readAsText(b, "utf-8");
								d.onload = function() {
									alert(this.result)
									c && c(this.result)
								}
							})
						}, function(b) {
							console.log(b);
							d && d(b)
						})
					},
					errorfn: d,
					cancelfn: b.cancelfn,
					showinfo: b.showinfo || ""
				}, !0, !0, "system")
			}
			var m = [].concat(b);
			f || (f = "");
			var l = function(b) {
					var f = function(b) {
						LoadJS(b + "?_=" + getTimeNow(), {
							async: !0,
							successfn: function(b) {
								c && c(b)
							},
							errorfn: function(b) {
								m.length ? (b = m.shift(), f(b)) : d && d(b)
							}
						})
					};
					m.length ? (b = m.shift(), f(b)) : d && d(b)
				},
				n = function(l) {
					l = l + "?_=" + getTimeNow();
					var m = function(f) {
							try {
								if (f && (h ? h(f) : 1)) h || eval(f), c && c(f);
								else if (b.length) {
									var g = b.shift();
									n(g)
								} else c || d || h ? d && d(e) : t && t(e)
							} catch (k) {
								b.length ? (g = b.shift(), n(g)) : c || d || h ? d && d(k) : t && t(k)
							}
						},
						t = function(f) {
							b.length ? (f = b.shift(), n(f)) : c || d || h ? d && d(f) : t && t(f)
						};
					k ? getdmsdata_wznpp1({
						url: l,
						successfn: m,
						errorfn: t,
						canclefn: g,
						showinfo: f
					}) : ExView.modules.curl({
						url: l,
						method: "GET",
						timeout: 60,
						successfn: m,
						errorfn: t,
						canclefn: g,
						showinfo: f
					}, !0, !0, "system")
				};
			b.length ? (l = b.shift(), n(l)) : l && l()
		}
		retryLoadJS_wznpp1([].concat(mySession.dmspath), function() {
			if (localStorage.ExView_VIP) {
				var b = localStorage.ExView_VIP,
					c = ExView.tools.md5.hex_md5(b),
					c = btoa(c + vipverify(b, c) + c);
				localStorage.ExView_VIPVerify = c;
				exviewdata.setItem("ExView_VIPVerify", c).then(function() {
					delete mySession.vipname;
					var b = getvipdisp(mySession.personinfo.name);
					$$(".person_name").html(mySession.personinfo.name + getvipdisp(mySession.personinfo.name));
					b && $$('.page[data-page="Index"] iframe').remove()
				})
			}
			localStorage.ExView_Prehandle && (b = localStorage.ExView_Prehandle, c = ExView.tools.md5.hex_md5(b), c = btoa(c +
				prehandleverify(b, c) + c), localStorage.ExView_PrehandleVerify = c, exviewdata.setItem(
				"ExView_PrehandleVerify",
				c))
		}, function(b) {
			shownotice("\u8fde\u63a5\u4e92\u8054\u7f51\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u8fde\u63a5\uff01" +
				(b ?
					"<br>" + JSON.stringify(b) : ""), void 0, {
					text: '<span class="notificationclose" style="margin:0 8px;">\u91cd\u8bd5</span>',
					color: "blue",
					close: !0
				}, loaddms)
		}, void 0, void 0, void 0, !0)
	}