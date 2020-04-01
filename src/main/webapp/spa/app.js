
var list = {
	templateUrl: 'tpl/blog/index.html',
	dataUrl: 'api/blog/index.jsp',
	submit: function(f) {
		alert('회원 검색폼 서브밋');
	}
};
var menu = {
	templateUrl: 'tpl/menu/menu.html',
	dataUrl: 'api/menu/menu.jsp',
	submit: function(f) {
		alert('Error');
	}
};

var user = {
	templateUrl: 'tpl/user/index.html',
	dataUrl: 'api/user/index.jsp',
	submit: function(f) {
		alert('Error');
	}
};

var edit = {
	templateUrl: 'tpl/blog/edit.html',
	dataUrl: 'api/blog/edit.jsp',
	success: function(ret) {
		location.href = '#/list';
	}
};

var view = {
	templateUrl: 'tpl/blog/view.html',
	dataUrl: 'api/blog/view.jsp'
};

var add = {
	templateUrl: 'tpl/blog/add.html',
	dataUrl: 'api/blog/add.jsp',
	success: function(ret) {
		location.href = '#/list';
	}
};

var del = {
	templateUrl: 'tpl/blog/delete.html',
	dataUrl: 'api/blog/delete.jsp',
	success: function(ret) {
		location.href = '#/list';
	}
};

var logout = {
	dataUrl: 'api/logout.jsp',
	after: function(ret) {
		location.href = 'login.html';
	}
};

$(document).ready(function() {
	$('#main').router({
		routes: {
			'/': list,
			'/blog/list': list,
			'/blog/edit': edit,
			'/blog/view': view,
			'/blog/add': add,
			'/blog/del': del,
			'/logout': logout,
			'/menu': menu,
			'/user': user

		},
		error: function(ret) {
			if(ret.error == 100) {
				location.href = 'login.html';
			} else {
				alert(ret.message);
			}
		}
	});
});