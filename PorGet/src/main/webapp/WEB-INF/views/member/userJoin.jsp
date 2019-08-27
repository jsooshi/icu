<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Membership Join</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


</head>

<body>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h3>
                    Membership Join
                </h3>
                <hr>
                <form role="form">
                    <div class="form-group">

                        <label for="mName">
                            닉네임
                        </label>
                        <input type="text" class="form-control" id="userName">
                    </div>
                    <div class="form-group">

                        <label for="mEmail">
                            이메일
                        </label>
                        <input type="email" class="form-control" id="userEmail">
                    </div>
                    <div class="form-group">

                        <label for="mPass">
                            비밀번호
                        </label>
                        <input type="password" class="form-control" id="userPass">
                    </div>

                    <div class="form-group">

                        <label for="mFile">
                            프로필사진
                        </label>


                        <input type="file" class="form-control-file" id="memberPhoto">


                    </div>

                    <button type="submit" class="btn btn-primary">
                        Submit
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
</body>

</html>