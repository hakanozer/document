<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<style>
	.sonuc {
		width: 150px;
		background-color: red;
		color: white;
	}
</style>
<script type="text/javascript" src='<s:url value="/resources/js/jquery-3.2.1.min.js"></s:url>'></script>
<script>
	$(document).ready(function(){
		// dokuman yüklendikten sonra
		// seçici oluşturuluyor
		$('#btn').click(function(){
			var dAdi = $('#adi').val();
			var yazdir = $('#cevap');
			
			// ajax yöntemi çalışmaya başlat
			$.ajax({
				url : '<s:url value="/dataAl"></s:url>',
				type : 'post',
				data : {"adi":dAdi},
				success : function(gelen) {
					var html = '<div class="sonuc">'+gelen+'</div>';
					yazdir.append(html);
				},
		        error: function(jqXHR, textStatus, errorThrown) {
		           console.log(textStatus, errorThrown);
		        }
			});
		});
	});
</script>
<body>

<input type="text" name="adi" id="adi" placeholder="Adınız" />
<input type="button" value="Gönder" id="btn" />

<div id="cevap"></div>



</body>
</html>
