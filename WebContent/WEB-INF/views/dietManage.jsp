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
   <title>식단관리</title>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

//       male: { calorie:2600,
//           carbohydrate:360,
//           protein:55,
//           fat:100,
//           salt:1500 
//        },
      function drawChart(male,female,user) {
        var data = google.visualization.arrayToDataTable([
          ['권장 섭취량', '남성', '여성', '나의 식단'],
          ['calorie', male.calorie, female.calorie, user.calorie],
          ['carbohydrate', male.carbohydrate, female.carbohydrate, user.carbohydrate],
          ['protein', male.protein, female.protein, user.protein],
          ['fat', male.fat, female.fat, user.fat],
          ['salt', male.salt*0.1, female.salt*0.1, user.salt*0.1],
        ]);

         var options = {
          chart: {

          }
        }; 

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
  

</head>

<body class="is-preload">
   <div id="wrapper">
       <jsp:include page="./share/header.jsp" /> 
      
      <div id="mainPage">
            <div class="inner">
               <section>   
                     <div >
                        <br/>
                        <div >
                           <input type="radio" id="male" name ="radiobutton" value="남성" v-model="gender" @click="showinfo_M(${sessionScope.login.user_code})">
                           <label for="male">남성</label>
                        </div>
                        <div >
                           <input type="radio" id="female" name ="radiobutton" value="여성" v-model="gender" @click="showinfo_F(${sessionScope.login.user_code})">
                           <label for="female">여성</label>
                        </div>
                     </div>
                              
                     <table class='list_table'>
   
                        <tr>
                           <th></th><th>kcal</th><th>탄수화물</th><th>단백질</th><th>지방</th><th>나트륨</th>
                        </tr>
                        <tr v-if="gender==='남성'" >
                           <td>{{gender}} 권장 섭취량</td>
                           <td v-html="male.calorie" id="_mcal"></td>
                           <td v-html="male.carbohydrate"></td>
                           <td v-html="male.protein"></td>
                           <td v-html="male.fat"></td>
                           <td v-html="male.salt"></td>
                        </tr>
                        
                        <tr v-if="gender==='여성'" >
                           <td>{{gender}} 권장 섭취량</td>
                           <td v-html="female.calorie"></td>
                           <td v-html="female.carbohydrate"></td>
                           <td v-html="female.protein"></td>
                           <td v-html="female.fat"></td>
                           <td v-html="female.salt"></td>
                        </tr>
                        
                        <tr v-if="gender!=''">
                           <td>현재 식단</td>
                           <td v-html="user.calorie"></td>
                           <td v-html="user.carbohydrate"></td>
                           <td v-html="user.protein"></td>
                           <td v-html="user.fat"></td>
                           <td v-html="user.salt"></td>
                        </tr>
                        
                        <tr v-if="gender!=''">
                           <td>비교</td>
                           <td v-html='show(diff.calorie)'></td>
                           <td v-html='show(diff.carbohydrate)'></td>
                           <td v-html='show(diff.protein)'></td>
                           <td v-html='show(diff.fat)'></td>
                           <td v-html='show(diff.salt)'></td>
                        </tr>
                     
                     </table>
                     </br>
                     </br>
                     </br>
                        <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
                      </br>
                     </br>
                     </br>
                     <form action="">
                     <table>
                        <tr>
                           <th>상품</th>
                           <th>상품명</th>
                           <th>제조사</th>
                           <th>수량</th>
                           <th>수정</th>
                           <th>삭제</th>
                        </tr>
                        <tr v-for="food in foods">
                           <td>
                           <img :alt="food.food_img" :src="food.food_img" width="50" height="50">
                           </td>
                           <td>
                           {{food.food_name}}
                           </td>
                           <td>
                           {{food.food_maker}}
                           </td>
                           <td>
	                      <input class="inputQ" type="number" v-model="food.quantity" id = "_quantity" min=1 style="width: 100px">
	                      </td>
	                      <td>
	                      <input type="button" value="수정" id = "_foodupdate" @click="updatefood(food.food_code,${sessionScope.login.user_code},food.quantity)">
	                      </td>
	                      <td>
	                      <input type="button" value="삭제" id = "_fooddelete" @click ="deletefood(food.food_code,${sessionScope.login.user_code})">
	                      </td>
                       </tr>
                     </table>
                     </form>
               </section>
            </div>
         </div>
      
 <jsp:include page="./share/footer.jsp" /> 

      
<script type="text/javascript">
     var allergenes1 = new Vue({
         el : '#mainPage', 
         data() {
             return {
                gender : [],
                 male: { calorie:2600,
                       carbohydrate:360,
                       protein:55,
                       fat:100,
                       salt:1500 
                    },
                 female: { calorie:2100,
                       carbohydrate:290,
                       protein:50,
                       fat:80,
                       salt:1500
                    },
                 user : { calorie:0,
                        carbohydrate:0,
                        protein:0,
                        fat:0,
                        salt:0
                     }, 
                 diff : { calorie:0,
                     carbohydrate:0,
                     protein:0,
                     fat:0,
                     salt:0
                 },
                 foods : [],
                 foodsnu : []
             }
           },
          mounted(){
             axios
                .get('getEatInfo.do?user_code='+"${sessionScope.login.user_code}")
                //.get('./emp.json')
                .then(response => (this.foods = response.data))
                .catch(error => {
                  console.log(error)
                  this.errored = true
                })
                .finally(() => this.loading = false)
          },
          filters:{
             deco(value) {
                if(value < 0) {
                   return value;
                }
                if(value > 0) {
                   return value;
                }
             }
          },
          methods:{
             show(val){
                if(val > 0) {
                   return "<span style='color:red'>" +val+"</span>"
                }
                if(val < 0) {
                   return "<span style='color:blue'>" +val+"</span>"
                }
             },
             showinfo_M(user_code){
                 axios
                 .get('eatcal.do?user_code='+user_code)
                 .then(response => (this.user.calorie = response.data.calorie.toFixed(1),
                          this.user.carbohydrate = response.data.carbohydrate.toFixed(1),
                          this.user.protein = response.data.protein.toFixed(1),
                          this.user.fat = response.data.fat.toFixed(1),
                          this.user.salt = response.data.salt.toFixed(1),
                          this.diff.calorie = (response.data.calorie-this.male.calorie).toFixed(1),
                           this.diff.carbohydrate = (response.data.carbohydrate-this.male.carbohydrate).toFixed(1),
                          this.diff.protein = (response.data.protein-this.male.protein).toFixed(1),
                          this.diff.fat = (response.data.fat-this.male.fat).toFixed(1),
                        this.diff.salt = (response.data.salt-this.male.salt).toFixed(1),
                        google.charts.setOnLoadCallback(drawChart(this.male, this.female, response.data)) ))
             
                       
             },
             showinfo_F(user_code){
                   axios
                   .get('eatcal.do?user_code='+user_code)
                   .then(response => (this.user.calorie = response.data.calorie.toFixed(1),
                          this.user.carbohydrate = response.data.carbohydrate.toFixed(1),
                          this.user.protein = response.data.protein.toFixed(1),
                          this.user.fat = response.data.fat.toFixed(1),
                          this.user.salt = response.data.salt.toFixed(1),
                          this.diff.calorie = (response.data.calorie-this.female.calorie).toFixed(1),
                           this.diff.carbohydrate = (response.data.carbohydrate-this.female.carbohydrate).toFixed(1),
                          this.diff.protein = (response.data.protein-this.female.protein).toFixed(1),
                          this.diff.fat = (response.data.fat-this.female.fat).toFixed(1),
                        this.diff.salt = (response.data.salt-this.female.salt).toFixed(1),
                        google.charts.setOnLoadCallback(drawChart(this.male, this.female, response.data))))
               },
              updatefood(food_code, user_code, quantity) {
                   axios.get('updateEatInfo.do?food_code='+food_code+"&user_code="+user_code+"&quantity="+quantity)
                    .then(function(response){
                       location.reload();
                    });
                 },
                 deletefood(food_code,user_code) {
                    alert(food_code +" "+ user_code);
                     axios.post('deleteEatInfo.do?food_code='+food_code+"&user_code="+user_code)
                      .then(function(response){
                         location.reload();
                      });
                   }}
     });
Vue.config.devtools = true;
 </script>
   </div>
</body>
</html>