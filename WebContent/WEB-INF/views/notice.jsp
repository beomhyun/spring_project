<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
   <title>공지사항</title>
   <script src="https://unpkg.com/vue"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/vue"></script>
   <link rel="stylesheet" href="assets/css/main.css" />
   <noscript>
      <link rel="stylesheet" href="assets/css/noscript.css" />
   </noscript>
</head>

<body class="is-preload">
   <div id="wrapper">
      <jsp:include page="./share/header.jsp" />
      
      <div id='app'>
         <div class="inner">
            <div class='headtitle'>
               <h2 v-html='currenttitle'></h2>
            </div>
            <div class='search_box'>
               <a href='#' @click='showlist(0)'>공지사항 목록</a> |
               <c:if test="${sessionScope.login.user_isadmin==0}">
                  <a href='#' @click='showlist(2)'>공지사항 등록</a>|
               </c:if>
            </div>
         </div>
         <component v-bind:is="currentview"></component>

      </div>
      <jsp:include page="./share/footer.jsp" />

<script type="text/x-template" id="Noticelisttemplate">
<div class="inner">
<div>
<table class='list_table'>
<tr>
  <th>제목</th>
  <th>작성자</th>
  <th>작성일</th>
  <th>조회수</th>

</tr>
<tr v-for="(board,index) in info" class = "nicecolor" >
  <td v-html="board.board_title" @click="show_detail(board.board_code)" ></td>
  <td v-html="board.user_name" @click="show_detail(board.board_code)"></td>
  <td v-html="board.board_writedate" @click="show_detail(board.board_code)"></td>
  <td v-html="board.board_readcount" @click="show_detail(board.board_code)"></td>


</tr>
</table>
</div>
<div>
<form action="" method="post" name = "frmForm" @submit.prevent="search">
<div class="row aln-center gtr-uniform">
<div class="col-3 col-12-small">
<select v-model="s_category">
  <option disabled value="">Please select one</option>
  <option value="title">제목</option>
  <option value="content">내용</option>
  <option value="titleORcontent">제목,내용</option>
  <option value="writer">작성자</option>
</select>
</div>
<div class="col-3 col-12-small">
<input type="text" v-model="s_keyword">
</div>
<div class="col-3 col-12-small">
<input type="submit" value="검색"/>
</div>
</div>
</form>
</script>

      <script type="text/x-template" id="detailtemplate">
<div class="inner">
<div>
<table class='list_table'>
<col width="10%"><col width="20%">
<col width="20%"><col width="20%"><col width="10%">
<tr>
  <th>제목</th>
<td v-html="cboard.board_title"></td>
</tr>  
<tr>
<th>작성자</th>
<td v-html="cboard.user_name"></td>
</tr>  
<tr>
<th>작성일</th>
  <td v-html="cboard.board_writedate"></td>

</tr>
<tr>
  <th>내용</th>
  <td v-html="cboard.board_content"></td>  

</tr>
<tr>
  <th>조회수</th>
  <td v-html="cboard.board_readcount+1"></td>
</tr>
<tr>
<c:if test="${not empty sessionScope.login}">
<div v-if="${sessionScope.login.user_code} === cboard.user_code">
<td  @click="update(cboard.board_code)"><input type="button" class='blue' value='수정'></button> </td>
<td @click="delete_board(cboard.board_code)"><input type="button" class='blue' value='삭제'></button> </td>
</div>
</c:if>
</tr>

</table>
<div v-if="cboard.board_code == cboard.board_groupcode">
   <form action="" method="post" name = "frmForm" @submit.prevent="Answer(cboard.board_groupcode)" v-if="cboard.board_code === cboard.board_groupcode ">
   <input type="submit" class='blue' value='답변달기'/></form>
</div>
</div>
</div>
</script>
      <script type="text/x-template" id="Noticeaddtemplate">
<div class="inner">
<div>
<form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="addNoticeBoard(${sessionScope.login.user_code})">
<table class="content_table">
<colgroup>
      <col style="width:30%;" />
      <col style="width:70%;" />                     
</colgroup>   
<tr>
<th>작성자</th>
<td><input data-msg="작성자" type="text" name="user_name" id="_writer" size="20" value="${sessionScope.login.user_name}" readonly="readonly" />
</td>
</tr>
<tr>
<th>제목</th>
<td><input data-msg="제목" type="text" name="board_title"  id="_title" size="20" v-model="ctitle" /></td>
</tr>
<tr>
<th>내용</th>
<td><textarea data-msg="내용" type="text" name="board_content"  id="_content" width="50" height="40" v-model="ccontent" /></td>
</tr>
<tr>

<tr>
<td colspan="2" style="height:50px; text-align:center;">
<button type="submit" name="button">Notice 작성</button></td>
</tr>
</table>
</form>
</div>
</div>
</script>

      <script type="text/x-template" id="Noticeupdatetemplate">
<div class="inner">
<div>
<form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="updateNoticeBoard()">
<table class="content_table">
<colgroup>
      <col style="width:30%;" />
      <col style="width:70%;" />                     
</colgroup>   
<tr>
<th>작성자</th>
<td><input data-msg="작성자" type="text" name="user_name" id="_writer" size="20" value="${sessionScope.login.user_name}" readonly="readonly" />
</td></tr>
<tr>
<th>제목</th>
<td><input data-msg="제목" type="text" name="board_title"  id="_title" size="20" v-model="ctitle" /></td>
</tr>
<tr>
<th>내용</th>
<td><textarea data-msg="내용" type="text" name="board_content"  id="_content" width="50" height="40" v-model="ccontent" /></td>
</tr>
<tr>
<tr>
<td colspan="2" style="height:50px; text-align:center;">
<button type="submit" name="button">Notice 작성</button></td>
</tr>
</table>
</form>
</div>
</div>
</script>
      <script type="text/javascript">
var Noticeupdate = Vue.component('Noticeupdate',{
    template: '#Noticeupdatetemplate',
    data () {
       return {
         loading: true,
         errored: false,
         cwriter:'',
          ctitle:'',
          ccontent:'',
          cgroupid: 0
       }
     },
    mounted () {
        axios
        .get('http://localhost:8197/ssafyvue/api/detailNoticeBoard/' + App.boardid)
        .then(response =>
                  (this.cwriter = response.data.board_writer, 
                   this.ctitle = response.data.board_title,
                this.ccontent = response.data.board_content,
                this.cgroupid = response.data.board_groupid)
        )
        .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false);
     },
     methods: {
       updateNoticeBoard() {
         if(this.ctitle==''){ alert('제목을 입력하세요.'); return ;}
         if(this.ccontent==''){ alert('내용을 입력하세요.'); return ;}
    
        axios.post('http://localhost:8197/ssafyvue/api/updateNoticeBoard', {
           board_title: this.ctitle,
           board_content: this.ccontent,
           board_code: App.boardid
          } 
         ).then(function(response){
             location.href='./goqna.do';
         });
      }}
   });


var Noticeadd = Vue.component('Noticeadd',{
    template: '#Noticeaddtemplate',
    data () {
       return {
         loading: true,
         errored: false,
         cwriter:'',
          ctitle:'',
          ccontent:''
       }
     },
     methods: {
       addNoticeBoard:function(code) {
         if(this.ctitle==''){ alert('제목을 입력하세요.'); return ;}
         if(this.ccontent==''){ alert('내용을 입력하세요.'); return ;}
        if(App.groupid==''){
           App.groupid = 0;
       }else{
//           alert("App"+App.groupid);
           this.ctitle = 'Re_'+this.ctitle;
       }
        axios.post('http://localhost:8197/ssafyvue/api/addNoticeBoard', {
           board_title: this.ctitle,
           user_code: code,
           board_content: this.ccontent,
           board_groupcode: App.groupid
          } 
         ).then(function(response){
             location.href='./gonotice.do';
         });
      }}
   });
var detailboard = Vue.component('detailboard',{
    template: '#detailtemplate',
    data () {
        return {
          loading: true,
          errored: false ,
          cboard:{},
          writer:'',
          answer:false
        }
      },
      filters: {
          salarydecimal (value) {
          return value.toFixed(2)
        }
      },
      methods:{
         Answer:function(){
//             alert(this.cboard.board_code);
            App.groupid=this.cboard.board_code;
            App.currentview = 'add';
            App.showlist(2);
         },
         update:function(bid){
             App.boardid=bid;
             App.currentview = 'Noticeupdate';
             App.showlist(4);
           },
           delete_board:function(boardid){
               App.boardid=boardid;
               axios
                 .post('http://localhost:8197/ssafyvue/api/deleteNoticeBoard/'+App.boardid)
                 .then(function(response){
                    location.href='./gonotice.do';
                   })
                 .catch(error => {
                   console.log(error)
                   this.errored = true
                 })
                 .finally(() => this.loading = false);
             }
      },
      mounted () {
         cid = App.boardid;
         axios
          .get('http://localhost:8197/ssafyvue/api/detailNoticeBoard/'+App.boardid)
          .then(response => (this.cboard = response.data))
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false);
      }
});

var Noticelist = Vue.component('Noticelist',{
    template: '#Noticelisttemplate',
    data(){
        return {
          upHere : false,
          info: [],
          loading: true,
          errored: false,
          s_category:'',
          s_keyword:''
        }
      },
      methods:{
         search:function(){
            axios
              .post('http://localhost:8197/ssafyvue/api/searchNoticeBoards',{
                 s_category : this.s_category,
                 s_keyword : this.s_keyword
              })
              //.get('./emp.json')
              .then(response => (this.info = response.data))
              .catch(error => {
                console.log(error)
                this.errored = true
              })
              .finally(() => this.loading = false);
          },
         
         show_detail:function(bid){
            App.boardid=bid;
            axios
              .get('http://localhost:8197/ssafyvue/api/readcount2/'+bid)
              //.get('./emp.json')
              .then(response => (this.info = response.data))
              .catch(error => {
                console.log(error)
                this.errored = true
              })
              .finally(() => this.loading = false);
            App.currentview = 'detailboard';
            App.showlist(1);
          }

          },
      filters: {
          salarydecimal (value) {
          return value.toFixed(2)
        }
      }, 
      mounted () {
        axios
          .get('http://localhost:8197/ssafyvue/api/findAllNoticeBoards')
          //.get('./emp.json')
          .then(response => (this.info = response.data))
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false);
      }
});

var App=new Vue({
  el: '#app',
  data: {
     currenttitle:'Notice',
     currentview: 'Noticelist',
      boardid :'',
      allviews:['Noticelist','detailboard','Noticeadd','namehrm','Noticeupdate'],
      cutt:['Notice','detail','add','search','Noticeupdate'],
      groupid:''
      },
   components: {
      Noticelist: Noticelist,
      detailboard: detailboard,
      Noticeadd:Noticeadd,
      Noticeupdate:Noticeupdate,
     },
     methods:{
        search:function () {
//             alert(this.s_category);
            this.currentview=this.allviews[5];
           this.currenttitle=this.cutt[5];
          
         },
        showlist: function (val) {
           if(val!=2){
              this.groupid = '';
           }
          this.currentview=this.allviews[val];
           this.currenttitle=this.cutt[val];
           //listhrm
           
         }
     }
});
Vue.config.devtools = true;
 </script>
   </div>
</body>
</html>