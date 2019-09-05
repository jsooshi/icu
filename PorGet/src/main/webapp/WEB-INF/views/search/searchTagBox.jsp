<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet"> google font -->
  <style>
   .ding > .btn{  
      text-decoration: none;
      font-size:1.5rem;
      color:white;
      padding:10px 20px 10px 20px;
      margin:20px;
      display:inline-block;
      border-radius: 10px;
       transition:all 0.1s; 
      text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
    }
    .ding > .btn:active{
      transform: translateY(3px); 
    }
    .ding > .btn.tag{
      background-color: #1f75d9;
      border-bottom:5px solid #165195;
    }
    .ding > .btn.tag:active{
      border-bottom:2px solid #165195;
    } 
  </style>
<div>
   <%
  		List<String> list = (List<String>) request.getAttribute("list");
   		Set<String> saveList = new HashSet<>();
   		String[] arr=null;
  		for(int i=0;i<list.size();i++){//["#ruby#aa#bb", "#cc#dd#ee"]
  			arr = list.get(i).split("#");
  		    for(int j=1;j<arr.length;j++){
  		    	saveList.add(arr[j]);
  		    }
  		}
  		String []printArr = new String[saveList.size()];
  		saveList.toArray(printArr);
  		String keyword = (String)request.getAttribute("keyword");
  		for(int i=0;i<printArr.length;i++){ 
  			if(printArr[i].contains(keyword)){
  					%>
  					<div class="ding">
  			<a href="javascript:select('#<%=printArr[i] %>')" class="btn tag"><%=printArr[i] %></a></div>		
  			<%	
  		}}
  %> 
</div>  
