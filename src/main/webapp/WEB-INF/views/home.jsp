<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<style>
      #topMenu {            
              height: 500px; 
              width: 100%; 
      }
      #topMenu ul li {                       
              list-style: none;           
              color: white;               
              background-color: #2d2d2d; 
              float: left;              
              line-height: 30px;          
              vertical-align: middle;    
              text-align: center;        
      }
      #topMenu .menuLink {                           
              text-decoration:none;                  
              color: white;                          
              display: block;                        
              width: 300px;  
              height:100px;                        
              font-size: 40px;                       
              font-weight: bold;                         
              font-family: "Trebuchet MS", Dotum, Arial; 
              text-align:center;
      }
      #topMenu .menuLink:hover {            
              color: red;                   
              background-color: #4d4d4d;    
      }
</style>
<nav id="topMenu" >
        <ul>
                <li><a  class="menuLink" href="map_list">map_list</a></li>
                <li><a  class="menuLink" href="<%=request.getContextPath() %>/manager/reviewmanager">게시글 관리</a></li>
				<li><a  class="menuLink" href="<%=request.getContextPath() %>/manager/commonmanager1">유저관리 메인</a></li>

        </ul>
</nav>

