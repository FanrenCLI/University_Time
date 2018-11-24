<%--
  Created by IntelliJ IDEA.
  User: FanrenCLI
  Date: 2018/11/16
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <title>MyMemeryPast</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../css/ol.css">
    <script type="text/javascript" src="../js/ol.js"></script>
    <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/bootstrap.min.js" ></script>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../local_css/my.css">
    <link rel="stylesheet" href="../css/bootstrapValidator.css">
    <script type="text/javascript" src="../js/bootstrapValidator.js"></script>
  </head>

  <body>
    <nav class="navbar navbar-inverse" id="local">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">University Time</a>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li data-toggle="modal" data-target="#myModal"><a href="#">Past is Memery <span class="sr-only">(current)</span></a></li>
          <li id="test" data-toggle="modal" data-target="#myModal_1"><a href="#">Today is Glory</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gods List <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  Zh_Tong</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  Tao ~</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#"><span class="glyphicon glyphicon-picture" aria-hidden="true"></span>  View Of Work</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>  Know Us</a></li>

            </ul>
          </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#" title="FanrenCLI">Linking To Me</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Member <span class="caret"></span></a>
            <ul class="dropdown-menu" style="height:300px ;overflow: auto;">
              <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  KangTianLe</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  FanZiLin</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  QianZhen</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  LiuHao</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  ChenPinYu</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  ChenHaoXuan</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  HuYuChen</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  LiuDongHui</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  MaShuaiQi</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  XuZhen</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
    <!--地图模块-->
    <div id="map" class="map">
    </div>
    <!--弹出框模板 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">MemeryPast List</h4>
          </div>
          <div class="modal-body" id="tableScorll">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Time</th>
                  <th>name</th>
                  <th>location</th>
                  <th>people</th>
                  <th>awards</th>
                  <th>Function</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${applicationScope.past_time}" var="past_time">
                  <tr>
                    <th>${past_time.id}</th>
                    <th>${past_time.time}</th>
                    <th>${past_time.name}</th>
                    <th>${past_time.location}</th>
                    <th>${past_time.people}</th>
                    <th>${past_time.awards}</th>
                    <th>
                      <a href="#" onclick="Tolocation(${past_time.lon},${past_time.lat})" data-dismiss="modal"><span class="glyphicon glyphicon-record" ></span>&nbsp;定位</a>
                    </th>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id="refreshTable">Refresh</button>
          </div>
        </div>
      </div>
    </div>
    <!--下传下载模块-->
    <div class="modal fade" id="myModal_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel_1">UpLoading List</h4>
          </div>
          <div class="modal-body" >
            <form id="pictureForm">
              <div class="form-group">
                <label for="detailName">Name</label>
                <input type="text" class="form-control" id="detailName" name="username" placeholder="Name">
              </div>
              <div class="form-group">
                <label for="time">time</label>
                <input type="text" class="form-control" id="time" name="time" placeholder="YYYY-DD-MM">
              </div>
              <div class="form-group">
                <label for="location">location</label>
                <input type="text" class="form-control" id="location" name="location" placeholder="location">
              </div>
              <div class="form-group">
                <label for="people">people</label>
                <input type="text" class="form-control" id="people" name="people" placeholder="people">
              </div>

              <div class="form-group">
                <label for="awards">awards</label>
                <input type="text" class="form-control" id="awards" name="awards" placeholder="awards">
              </div>
              <div class="form-group">
                <label for="Lon">Lon</label>
                <input type="text" class="form-control" id="Lon"  name="Lon" placeholder="可地图定位">
              </div>
              <div class="form-group">
                <label for="Lat">Lat</label>
                <input type="text" class="form-control" id="Lat" name="Lat" placeholder="可地图定位">
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="password">
              </div>

              <div class="input-append">
                <input id="lefile" type="file" multiple="multiple">
                <input id="photoCover" class="input-large" type="text"  placeholder="请选择文件">
                <a class="btn btn-primary" onclick="$('input[id=lefile]').click();">Browse</a>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" id="location_point" class="btn btn-default" data-dismiss="modal">Location</button>
            <button type="submit" class="btn btn-primary" id="submitForm" >Submit</button>
          </div>
        </div>
      </div>
    </div>
  <!--图片加载模块-->

  </body>
  <!--加载openlayer图层-->
  <script type="text/javascript" src="../local_js/LoadMap.js"></script>
  <script type="text/javascript" src="../local_js/aboutFunction.js"></script>
  <!--表单验证-->
  <script type="text/javascript" src="../local_js/CheckFrom.js"></script>
  <c:forEach items="${applicationScope.past_time}" var="past_time">
    <script type="text/javascript" >
      drawPoint(${past_time.lon},${past_time.lat},"${past_time.name}");
    </script>
  </c:forEach>
</html>
