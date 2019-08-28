<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
</head>
<style>
    .inline {
        display: inline;
    }
</style>

<body>
uname, pfnum, pfname, pfdate, pfthumb, pfread, pfurl, pffile, pfposition, tagname
    <div class="container">

        <img src="http://placehold.it/200" class="rounded-circle" style="width:20%; display:inline;">
        <p class="inline">
            닉네임: ${list.uname }<br>
            포지션: ${list.pfposition }<br>
            태그: ${list.tagname }
        </p>

        [스크린샷]<br>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100"
                        src="" alt="
                        First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100"
                        src="" alt="
                        Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100"
                        src="" alt="
                        Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        좋아요수: <br>
        조회수: <br>

        <a href="${list.pfurl }" class="btn btn-primary">
		 포트폴리오 링크
        </a><br>

        <a href="update?pfnum=${list.pfnum }">수정</a><br>
        <a href="delete?pfnum=${list.pfnum }">삭제</a><br>
        <hr>

        [댓글]



    </div>



</body>

</html>