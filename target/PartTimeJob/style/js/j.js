function checkCity(a){
var b;
return $.ajax({
type:"POST",async:!1,
url:ctx+"/jobs/checkCity.json",
data:{city:a}}).done(function(a){b=a.success}),b}

function getStrLen(a){
var c,d,b=0;for(c=0;c<a.length;c++)d=a.charCodeAt(c),b+=isDbcCase(d)?1:2;return b}

function isDbcCase(a){
return a>=32&&127>=a?!0:a>=65377&&65439>=a?!0:!1}

$(function(){
function a(){
var a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s;
$("#jobForm").valid()&&($("#department").val()==$("#department").attr("placeholder")&&$("#department").val(""),
(""==$("#salaryMin").val()||$("#salaryMin").val()==$("#salaryMin").attr("placeholder"))&&$("#salaryMin").val(""),
(""==$("#salaryMax").val()||$("#salaryMax").val()==$("#salaryMax").attr("placeholder"))&&$("#salaryMax").val(""),
$("#positionAddress").val()==$("#positionAddress").attr("placeholder")&&$("#positionAddress").val(""),
a=$("#positionType").val(),
b=$("#positionName").val(),
c=$("#department").val(),
d=$('#jobForm input[name="jobNature"]:checked').val(),
e=$("#salaryMin").val(),
f=$("#salaryMax").val(),
g=$("#workAddress").val(),
h=$("#experience").val(),
i=$("#education").val(),
j=$("#positionAdvantage").val(),
k=$("#positionDetail").val(),
l=$("#positionAddress").val(),
m=$("#lng").val(),
n=$("#lat").val(),
o=$("#receiveEmail").val(),
p=$("#forwardEmail").val(),
q=$('#jobForm input[name="id"]').val(),
r=$('#jobForm input[name="companyId"]').val(),
s=$("#resubmitToken").val(),
$.ajax({url:ctx+"/corpPosition/savePosition.json",
type:"POST",
data:{positionType:a,positionName:b,
department:c,jobNature:d,salaryMin:e,salaryMax:f,
workAddress:g,workYear:h,education:i,positionAdvantage:j,
positionDetail:k,positionAddress:l,positionLng:m,positionLat:n,
email:o,forwardEmail:p,id:q,companyId:r,resubmitToken:s},
dataType:"json"}).done(function(a){
$("#resubmitToken").val(a.resubmitToken),a.success?window.location.href=ctx+a.content:""!=a.content&&null!=a.content?window.location.href=ctx+a.content:$("#beError").html(a.msg).show()}))}


$("#telForm").validate({
rules:{tel:{required:!0,isTel:!0}},
messages:{tel:{required:"请输入你的手机号码或座机号码",isTel:"请输入正确的手机号或座机号，座机格式如010-62555255或010-6255255-分机号，多个电话用英文逗号隔开"}},
submitHandler:function(a){
var b=$('input[type="text"]',a).val();
$(a).find(":submit").attr("disabled",!0),
$.ajax({
type:"POST",
data:{tel:b},
url:ctx+"/user/addTel.json"}).done(function(b){
b.success?$.colorbox.close():$("#telError").text(b.msg).show(),
$(a).find(":submit").attr("disabled",!1)})}}),


$('#telTip input[type="text"]').focus(function(){$("#telError").hide()}),


$(".profile_radio li input").click(function(){
$(this).parent("li").siblings("li").removeClass("current"),
$(this).parent("li").addClass("current"),
$("#jobForm").validate().element($(this))}),


$("#salaryMin").focus(function(){
""==$.trim($(this).val())&&$(this).prev().text("最低月薪").css({color:"#dddee0"})}).blur(function(){
""==$.trim($(this).val())&&$(this).prev().text("最低月薪").css({color:"#777"})}).keyup(function(){
$(this).prev().text("")}),


$("#salaryMax").focus(function(){
""==$.trim($(this).val())&&$(this).prev().text("最高月薪").css({color:"#dddee0"})}).blur(function(){
""==$.trim($(this).val())&&$(this).prev().text("最高月薪").css({color:"#777"})}).keyup(function(){
$(this).prev().text("")}),$(document).click(function(){$("#box_job").hide(),$(".boxUpDown").hide(),$(".selectr").removeClass("selectrFocus")}),


$("#box_job").bind("click",function(a){a.stopPropagation()}),


$("#box_job").on("mouseenter",".job_main li",function(){
$(this).children("ul").show();
var a="";
$("#box_job .job_main").each(function(){
$(this).children("li").each(function(){
a=$("#box_job").height()-($(this).offset().top-$(this).parents("#box_job").offset().top+32),a<$(this).children(".job_sub").height()&&(navigator.userAgent.indexOf("MSIE")>0&&"7."==navigator.appVersion.match(/7./i)?$(this).children(".job_sub").css({marginTop:"-30"-$(this).children(".job_sub").height()+"px"}):$(this).children(".job_sub").css({marginTop:"-44"-$(this).children(".job_sub").height()+"px"}))})})}),



$("#box_job").on("mouseleave",".job_main li",function(){$(this).children("ul").hide()}),


$("#select_category").bind("click",function(a){
a.stopPropagation(),
$(".boxUpDown").hide(),
$(".selectr").removeClass("selectrFocus"),
$(this).addClass("selectrFocus"),
$("#box_job").show()}),


$("#box_job").on("click",".job_sub li",function(a){
var b,c;a.stopPropagation(),
b=$(this).parent("ul.job_sub").siblings("span").text(),
c=$(this).text(),
$("#select_category").css("color","#333").val(b).removeClass("selectrFocus"),
$("#positionType").val(b),
$("#positionName").val(c),
$(this).parents(".job_sub").hide(),
$("#box_job").hide(),
$("#jobForm").validate().element("#positionType"),
$("#jobForm").validate().element("#positionName")}),


$("#box_job").on("click","ul.job_main > li",function(a){
a.stopPropagation();
var b=$(this).children("span").text();
$("#select_category").css("color","#333").val(b).removeClass("selectrFocus"),
$("#positionType").val(b),
$("#positionName").val(""),
$("#box_job").hide(),placeholderFn(),
$("#jobForm").validate().element("#positionType")}),


$("#box_job .job_main").each(function(){
$(this).children("li").each(function(a){
1==a%3?$(this).children(".job_sub").css({marginLeft:"-160px"}):2==a%3&&$(this).children(".job_sub").css({marginLeft:"-310px"})})}),


$("#select_experience").bind("click",function(a){
a.stopPropagation(),
$(".selectr").removeClass("selectrFocus"),
$("#box_job").hide(),
$(".boxUpDown").hide(),
$(this).addClass("selectrFocus"),
$(this).siblings(".boxUpDown").show()}),


$("#box_experience").on("click","ul li",function(a){
a.stopPropagation();
var b=$.trim($(this).text());
$(this).parents("#box_experience").hide().siblings("#select_experience").val(b).css("color","#333").removeClass("selectrFocus"),
$(this).parents("#box_experience").hide().siblings("#experience").val(b),
$("#jobForm").validate().element($("#experience"))}),


$("#select_education").bind("click",function(a){
a.stopPropagation(),
$(".selectr").removeClass("selectrFocus"),$("#box_job").hide(),
$(".boxUpDown").hide(),
$(this).addClass("selectrFocus"),
$(this).siblings(".boxUpDown").show()}),


$("#box_education").on("click","ul li",function(a){
a.stopPropagation();
var b=$.trim($(this).text());
$(this).parents("#box_education").hide().siblings("#select_education").val(b).css("color","#333").removeClass("selectrFocus"),
$(this).parents("#box_education").hide().siblings("#education").val(b),
$("#jobForm").validate().element($("#education"))}),


$("#jobForm").submit(function(){tinyMCE.triggerSave(!0)}).validate({groups:{salary:"salaryMin salaryMax"},
onkeyup:!1,focusCleanup:!0,
rules:{
positionName:{required:!0,specialchar:!0,rangelength:[1,40]},
positionType:{required:!0},
department:{required:!1,specialchar:!0,maxlenStr:20},
jobNature:{required:!0},
workAddress:{required:!0,cityAvailable:!0,maxlenStr:20},
salaryMin:{required:function(){
return!(""!=$("#salaryMin").val()&&$("#salaryMin").val()!=$("#salaryMin").attr("placeholder")||""!=$("#salaryMax").val()&&$("#salaryMax").val()!=$("#salaryMax").attr("placeholder"))},
digits:!0,range:[1,100],salaryRange:!0,Dvalue:!0},
salaryMax:{required:function(){
return!(""!=$("#salaryMin").val()&&$("#salaryMin").val()!=$("#salaryMin").attr("placeholder")||""!=$("#salaryMax").val()&&$("#salaryMax").val()!=$("#salaryMax").attr("placeholder"))},
digits:!0,range:[1,100],salaryRange:!0,Dvalue:!0},
workYear:{required:!0},
education:{required:!0},
positionAdvantage:{required:!0,specialchar:!0,checkNum:!0,rangelength:[2,20]},
positionDetail:{required:!0,textInMce:!0,hasEmail:!0},
positionAddress:{required:!0,maxlength:150},
email:{required:!1},
forwardEmail:{required:!1,email:!0,forwardEmailFormat:!0,forwardSame:!0}},messages:{
positionName:{required:"请输入职位名称，如：产品经理",specialchar:"请输入有效的职位名称",rangelength:"请输入1-40字的职位名称"},
positionType:{required:"请选择职位类别"},
department:{specialchar:"请输入有效的所属部门",maxlenStr:"请输入20字以内的所属部门"},
jobNature:{required:"请选择工作性质"},
workAddress:{required:"请输入工作城市，如：北京",maxlenStr:"请输入有效的工作城市"},
salaryMin:{required:"请输入月薪范围，如：4",digits:"请输入有效的月薪范围，如：4",range:"请输入有效的月薪范围，1k-100k",salaryRange:"最高月薪不能大于最低月薪的2倍",Dvalue:"最高月薪需大于最低月薪"},salaryMax:{required:"请输入月薪范围，如：4",digits:"请输入有效的月薪范围，如：4",range:"请输入有效的月薪范围，1k-100k",salaryRange:"最高月薪不能大于最低月薪的2倍",Dvalue:"最高月薪需大于最低月薪"},workYear:{required:"请选择工作经验要求"},
education:{required:"请选择学历要求"},
positionAdvantage:{required:"一句话描述该职位的吸引力，如：负责领域、福利待遇等，限20字",specialchar:"请输入有效的职位诱惑信息",checkNum:"请输入有效的职位诱惑信息",rangelength:"请输入2-20字的职位诱惑"},positionDetail:{required:"请输入岗位职责、任职要求等，建议尽量使用短句并分条列出",textInMce:"请输入20-2000字的职位描述",hasEmail:"职位描述不能包含邮箱，请去掉"},
positionAddress:{required:"请输入工作地点",maxlength:"请输入150字以内的工作地点"},
forwardEmail:{email:"请输入正确的邮箱格式",forwardEmailFormat:"请输入与当前接收简历邮箱后缀一致的邮箱地址",forwardSame:"请输入与当前接收简历邮箱不同的邮箱地址"}},
errorPlacement:function(a,b){
"hidden"==b.attr("type")?a.appendTo($(b).parent()):"radio"==b.attr("type")?a.insertAfter($(b).parents("ul.profile_radio")):"salaryMin"==b.attr("name")||"salaryMax"==b.attr("name")?a.insertAfter($(b).parents(".salary_range")):b.is("textarea")?a.appendTo($(b).parent()):a.insertAfter($(b))},

invalidHandler:function(a,b){
if(b.numberOfInvalids()){
var c=$(b.errorList[0].element).offset().top;"positionType"==b.errorList[0].element.name?c=150:"workYear"==b.errorList[0].element.name?c=650:"education"==b.errorList[0].element.name&&(c=700),$("html, body").animate({scrollTop:c},400)}}}),


jQuery.validator.addMethod("cityAvailable",function(a,b){
return this.optional(b)||checkCity(a)},"请输入有效的公司所在城市，如：北京"),


jQuery.validator.addMethod("hasEmail",function(a){
return a.indexOf("@")>0&&(a.indexOf(".com")>0||a.indexOf(".cn")>0)&&(a.indexOf(".com")-a.indexOf("@")<15&&a.indexOf(".com")-a.indexOf("@")>0||a.indexOf(".cn")-a.indexOf("@")<15&&a.indexOf(".cn")-a.indexOf("@")>0)?!1:!0},"职位描述不能包含邮箱，请去掉"),


$.validator.addMethod("textInMce",function(){
var c=tinyMCE.get("positionDetail").getContent().replace(/<.*?>/g,""),d=getStrLen(c);
return d>=40&&4e3>=d?!0:!1},"请输入20-2000字的职位描述"),


$.validator.classRuleSettings.textInMce={textInMce:!0},


$("#workAddress").focus(function(){$("#beError").hide()}),


jQuery.validator.addMethod("forwardEmailFormat",function(a){
var d=$.trim(a).indexOf("@"),
e=$.trim(a).substring(d,$.trim(a).length),
f=$.trim($("#receiveEmailVal").text()),
g=f.indexOf("@"),h=f.substring(g,f.length);
return""!=$.trim(a)&&e!=h?!1:!0},"请输入与当前接收简历邮箱后缀一致的邮箱地址"),


jQuery.validator.addMethod("forwardSame",function(a){
var d=$.trim(a),
e=$.trim($("#receiveEmailVal").text());
return""!=d&&d==e?!1:!0},"请输入与当前接收简历邮箱不同的邮箱地址"),


$("#jobPreview").click(function(){
$("#jobForm").attr({action:ctx+"/corpPosition/preview.html",target:"_blank"}).submit()}),


$("#forwardEmail").focus(function(){$(".error").siblings("span").hide()}),


$("#formSubmit").click(function(){a()})
});