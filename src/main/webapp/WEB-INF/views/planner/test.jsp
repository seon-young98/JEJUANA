<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=806e918783759197bca10fffa91fc3e5"></script>

<style>
    #aaa{
        background: #51b4ff;
    }
    #bbb{
        background: red;
    }
    .header{
        display: none;
    }
</style>
<script>
    $(function(){
        $("#bbb").click(function(){
            $("#aaa").remove();
        });
        $("#ccc>div:eq(2)").css("background", "black");
        $("div").click(function (){
            console.log($(this).attr("id"));
        })
    });


    function clicked_id(id){
        console.log(id);
    }

</script>

<div class="place" id="aaa">2</div>
<div id="bbb">2</div>

<div id="ccc">
    <div id="ccc-ddd">3</div>
    <div>4</div>
    <div>5</div>
    <div>6</div>
    <div>7</div>
</div>
