


function updateIOSVersion_wznpp1(b, c, d, f, g) {
		return ExView.modules.curl({
			url: b,
			method: "GET",
			timeout: 3600,
			mimetype: "arraybuffer",
			successfn: function(b) {
				ExView.tools.file.savefile("Version/MoeRuntime", new Blob([b], {
						type: "application/zip"
					}), {
						file_append: !1,
						filemime: "application/zip",
						filetype: "blob"
					},
					function(b, f) {

						ExView.tools.zip.read({
							sourcePath: ExView.tools.file.fs.toURL() + "Version/MoeRuntime",
							targetPath: ExView.tools.file.fs.toURL() + "Version/" + c,
							callback: function() {
								ExView.tools.file.getinfo("Version/" + c + "/MoeRuntimeIOS.SHTM",
									function(b) {
										b && 0 < b.size && (localStorage.ExView_UpdateVersion = c, d ? localStorage.ExView_UpdateVersionName =
											d : delete localStorage.ExView_UpdateVersionName, $$(".splashsreen").remove(), setTimeout(
												function() {
													location.href = ExView.tools.file.fs.toURL() + "Version/" + c + "/MoeRuntimeIOS.SHTM"
												},
												0))
									},
									function() {
										ExView.fw.hidePreloader();
										ExView.fw.alert("\u89e3\u538b\u95ee\u9898\u5bfc\u81f4\u5347\u7ea7\u51fa\u9519\uff01",
											"ExView\u5347\u7ea7")
									})
							}
						})
					},
					function() {})
			},
			showinfo: {
				text: "\u6b63\u5728\u5347\u7ea7...<br>" + (d || c) + "\u7248\u672c",
				title: "\u82f9\u679c\u7248"
			}
		})
	}