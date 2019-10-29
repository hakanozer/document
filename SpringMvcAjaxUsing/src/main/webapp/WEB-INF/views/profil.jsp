<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<script type="text/javascript" src='<s:url value="/resources/js/jquery-3.2.1.min.js"></s:url>'></script>

<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			
			var adi = $('#adi').val();
			var soyadi = $('#soyadi').val();
			var mail = $('#mail').val();
			var sifre = $('#sifre').val();
			
			$.ajax({
				url : '<s:url value="/kayitYap"></s:url>',
				type : 'post',
				data : { "adi":adi,"soyadi":soyadi,"mail":mail,"sifre":sifre},
				success : function(gelen) {
					if(gelen == "basarisiz") {
						alert("Ekleme işlemi başarısız");
					}else {
						// satıra eklemeyi yap
						$('#yeni').append(gelen);
					}
				},
		        error: function(jqXHR, textStatus, errorThrown) {
		           console.log(textStatus, errorThrown);
		        }
			});
			
		});
	});
</script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<div class="container">

<div class="row">
	
	<div class="col-md-6">
	<h1>Kayıt Formu</h1>
		
		<input type="text" id="adi" placeholder="Adı" class="form-control" />
		<input type="text" id="soyadi" placeholder="Soyadı" class="form-control" />
		<input type="text" id="mail" placeholder="Mail" class="form-control" />
		<input type="text" id="sifre" placeholder="Şifre" class="form-control" />
		<button id="btn" class="form-control" >Gönder</button>
		
	</div>
	
	<div class="col-md-6">
	<h1>Kullanıcı Listesi</h1>
	<c:if test="${ not empty ls }">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Id</th>
                <th>Adı</th>
                <th>Soyadı</th>
                <th>Mail</th>
                <th>Şifre</th>
              </tr>
            </thead>
            <tbody id="yeni">
            <c:forEach items="${ ls }" var="item">
              <tr>
                <td><c:out value="${ item.getId() }"></c:out></td>
                <td><c:out value="${ item.getAdi() }"></c:out></td>
                <td><c:out value="${ item.getSoyadi() }"></c:out></td>
                <td><c:out value="${ item.getMail() }"></c:out></td>
                <td><c:out value="${ item.getSifre() }"></c:out></td>
              </tr>
              
              </c:forEach>
            </tbody>
          </table>
          </c:if>
        </div>

</div>

	
</div>


</body>
</html>