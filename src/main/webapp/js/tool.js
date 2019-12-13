// 菜单切换界面
function changeURL(node) {
	// attr返回文档中所有图像的src属性值
	var url = $(node).attr("title");
	//
	// $(node).attr("title",(url+"?handle="+$("#wname").html()));

	$("#myiframe").attr("src",$(node).attr("title"));

	$(node).attr("title",url);
}