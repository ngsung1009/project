/* 
 * Hovers li's in IE as it does not support CSS hovers on LI tags 
 * Requires the hover style to also apply to the class .over 
*/
function assignHoverNav()
{
	var menu = document.getElementById('main-nav');
	if (!menu) return false;
	var index=0

	var elems = menu.getElementsByTagName('li');
	if (!elems) return false;

	for(index=0;index<elems.length;index++)
	{
		var li = elems[index];
		li.onmouseover = function () 
		{
			this.className += " over";
			
			//if (this.parentNode.parentNode.tagName == 'LI')
			window.status = "Over";
		}

		li.onmouseout = function ()
		{
			
			//if (this.parentNode.parentNode.tagName != 'LI') 
			window.status = "Out";
			this.className=this.className.replace("over", "");
		}
	}

	
}

// 팝업을 사용할 경우 사용 JS
/*

function sp(url)
{
	var a=window.open(''+url,'pp','toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=600,height=508');
}

if (window.attachEvent) window.attachEvent("onload", assignHoverNav);
	else window.onload = assignHoverNav;

*/