<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PorGet</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<style>
    #bannerimage {
        width: 100%;
        background-image: url(https://assets.awwwards.com/awards/sites_of_the_day/2019/07/humpback-whale-1.jpg);
        height: 405px;
        background-position: center;
    }
</style>
<script src="./js/jquery-3.4.1.min.js"></script>
<script>
    $(function () {

        $.ajax({
            url: "main.html",
            success: function (result) {
                $('#porgetBody').html(result);
            }
        })
    });
</script>

<body>

    <!-- Navigation 임시-->
    <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
        <div class="container-fluid">
            <a href="" class="navbar-brand">PorGet</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="">Portfolio</a></li>
                    <li class="nav-item"><a class="nav-link" href="">Popular</a></li>
                </ul>
            </div>
        </div>
    </nav>


    <!-- body -->

    <div id="porgetBody"></div>

    <!-- footer -->
    <footer>
        <div class="container-fluid padding">
            <div class="row text-center">
                <div class="col-sm-6">
                    footer
                </div>
                <div class="col-sm-6">
                    footer
                </div>
            </div>
            <div class="col-12">
                <hr class="light">
                <h5 class="text-center">&copy; PorGet</h5>
            </div>
        </div>
    </footer>




    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>
</body>

</html>