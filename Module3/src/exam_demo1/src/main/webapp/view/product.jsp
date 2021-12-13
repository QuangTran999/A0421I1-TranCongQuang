<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 14/11/2021
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <link rel="stylesheet" href="/css/css-footer.css">
    <link rel="stylesheet" href="/static/bootstrap-4.6.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="/static/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="/static/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="/css/positon-booster-footer.css">
</head>
<body>
<div id="header" style="margin-bottom: 0; clear: none; position: relative">
    <div style="background-color: #1e7e34">
        <div class="row color-rect-border" style="height: 130px ; width: 100%" >
            <div class="col-6" style="text-align: left">
                <img src="../../img/booster-furama.png" style="width: 100px; height: 100px ; margin-left: 20px; margin-top: 10px">
            </div>
            <div class="col-6" style="text-align: right">Nguyen Van A</div>
        </div>
        <div style="position: -webkit-sticky; position: sticky; top: 0px">
            <nav class="navbar navbar-expand-lg navbar-light bg-light" >
                <div class="container-fluid">
                    <div class="collapse navbar-collapse row" id="navbarSupportedContent">
                        <div class="col-9">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/patients">Case record</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="#">Patient</a>
                                </li>
                            </ul>
                        </div>

                        <div class="col-3">
                            <form class="d-flex">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success" type="submit">Search</button>
                            </form>
                        </div>

                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>


<div  class="row" style="position: relative;margin-top: 90px; margin-right: 0px">
    <div  class="col-lg-3" style="border: #7abaff 1px solid; height: 1000px; background-color: #f8f9fa">
        <%--        <h5 style="text-align: center">Excellent staff</h5></br>--%>
        <div class="card" style="width: 18rem; position: absolute; margin-left: 5%">
            <img src="/img/quang.jpg" class="card-img-top" alt="..." style="height: 250px">
            <div class="card-body">
                <h5 class="card-title">Java Junior</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Information</a>
            </div>
        </div>
    </div>
    <div class="col-lg-9" style="border: #7abaff 1px solid; height: 1000px">
        </br><h2 style="text-align: center">LIST OF CASE RECORD</h2></br>

        <button><a href="/patients?action=create">Create new case record</a></button>
        <table class="table table-sm">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Mã bệnh án</th>
                <th scope="col">Mã bệnh nhân</th>
                <th scope="col">Tên bệnh nhân</th>
                <th scope="col">Ngày nhập viện</th>
                <th scope="col">Ngày ra viện</th>
                <th scope="col">Lý do nhập viện</th>
                <th scope="col">-</th>
                <th scope="col">-</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listCustomer}" var="customer" >
                <tr></tr>
                <td><c:out value="${customer.customer_id}"/></td>
                <td><c:out value="${customer.customer_name}"/></td>
                <td><c:out value="${customer.customer_birthday}"/></td>
                <td>
                    <c:if test="${customer.customer_gender==true}">Male</c:if>
                    <c:if test="${customer.customer_gender==false}">Female</c:if>
                </td>
                <td><c:out value="${customer.customer_id_card}"/></td>
                <td><c:out value="${customer.customer_phone}"/></td>
                <td><c:out value="${customer.customer_email}"/></td>
                <td><c:out value="${customer.customer_address}"/></td>
                <td>
                    <a type="button" href="/products?action=edit&id=${customer.customer_id}">Edit</a>
                </td>
                <td>
                    <button type="button" data-toggle="modal" data-target="#modalDelete" onclick="deleteCustomer('${customer.customer_id}')">Delete</button>
                </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="/products?action=delete">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Notification</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input name="id" id="id" hidden>
                            Do you want to delete?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-danger" >Delete</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<div style="background: #222;
    border-top: 5px solid #333;
    color: #ccc;
    font-weight: bold;
    height: 50px;
    line-height: 50px;
    position: relative;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    width: 100%;
    text-align: center;">
    <footer class="site-footer" >
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <h6>About</h6>
                    <p class="text-justify">Scanfcode.com <i>CODE WANTS TO BE SIMPLE </i> is an initiative  to help the upcoming programmers with the code. Scanfcode focuses on providing the most efficient code or snippets as the code wants to be simple. We will help programmers build up concepts in different programming languages that include C, C++, Java, HTML, CSS, Bootstrap, JavaScript, PHP, Android, SQL and Algorithm.</p>
                </div>
                <div class="col-xs-6 col-md-3">
                    <h6>Categories</h6>
                    <ul class="footer-links">
                        <li><a href="http://scanfcode.com/category/c-language/">C</a></li>
                        <li><a href="http://scanfcode.com/category/front-end-development/">UI Design</a></li>
                        <li><a href="http://scanfcode.com/category/back-end-development/">PHP</a></li>
                        <li><a href="http://scanfcode.com/category/java-programming-language/">Java</a></li>
                        <li><a href="http://scanfcode.com/category/android/">Android</a></li>
                        <li><a href="http://scanfcode.com/category/templates/">Templates</a></li>
                    </ul>
                </div>
                <div class="col-xs-6 col-md-3">
                    <h6>Quick Links</h6>
                    <ul class="footer-links">
                        <li><a href="http://scanfcode.com/about/">About Us</a></li>
                        <li><a href="http://scanfcode.com/contact/">Contact Us</a></li>
                        <li><a href="http://scanfcode.com/contribute-at-scanfcode/">Contribute</a></li>
                        <li><a href="http://scanfcode.com/privacy-policy/">Privacy Policy</a></li>
                        <li><a href="http://scanfcode.com/sitemap/">Sitemap</a></li>
                    </ul>
                </div>
            </div>
            <hr>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <p class="copyright-text">Copyright &copy; 2017 All Rights Reserved by
                        <a href="#">Scanfcode</a>.
                    </p>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <ul class="social-icons">
                        <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                        <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
    function deleteCustomer(id){
        document.getElementById('id').value = id;
    }
</script>
</body>
</html>

