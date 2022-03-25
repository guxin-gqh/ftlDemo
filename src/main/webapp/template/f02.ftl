<#--
    if,else,elseif逻辑判断指令
    格式
        <#if codition>
        ...
        <#elseif condition2>
        ...
        <#else>
        ...
        <#if>

        注意  1.condition，condition2等，将被计算成布尔值的表达式
             2.elseif和else指令，是可选的
-->
<#assign score=58>
<#if score gt 80>
    <h6>smart</h6>
    <#elseif  score == 60>
    及格了
    <#elseif  score < 60>
    没及格
</#if>

<#--判断数据是否存在-->
<#assign list="">
<#if list??>
    data is exist
    <#else>
    data is not exist
</#if>
<hr/>

<#if list2??>
    data is exist
<#else>
    data is not exist
</#if>


<hr/>

<#--
   list指令
   格式1：<#list sequence as item>
          </#list>
   格式2
         <#list sequence as item>
          <#else>
         </#list>
   注意：
   1.else部分是可选的
   2.sequence：想要迭代的项，可以是序列或集合的表达式
   3.item：循环变量的名称
   4.当没有迭代项时，才使用else指令可以输出一些特殊的内容在里面而不是空在那里
-->
<h5>list迭代</h5>
<#assign users=["z","l","w"]>
<#list users as user>
    ${user}
</#list>



<#--判断数据不为空，在执行遍历（如果序列不存在，直接遍历会报错）-->
<#if users2??>
    <#list users2 as user>
        ${user}
    </#list>
</#if>
<br/>
<#--当序列没有数据项时，使用默认值-->
<#assign users3=[]>
<#list users3 as user>
    ${user}
    <#else >
    <h1>hahhaha</h1>
</#list>




<#--
    macro自定义指令
    1.基本使用
       格式：
        <macro 指令名>
        指令内容
        <#macro>
       使用
         <@指令名></@指令名>

    2.有些参数的自定义指令
      格式：
       <macro 指令名 参数名1 参数名2>
        指令内容
        <#macro>
       使用
         <@指令名 参数名1=参数值1 参数名2=参数值2></@指令名>
     注意：
        1）指令可被多次使用
        2）自定义指令中可以包含字符串也可以包含指令
-->

<hr/>
<h4>自定义macro</h4>

<#macro address>
    freemarkder插件的下载地址为 ：https://sourceforge.net/projects/freemarker-ide/files/freemarker-ide/
</#macro>
<#-- 使用自定义指令-->
<@address></@address>

<br/>
<#macro queryUsername username>
    通过用户名查询对象-${username}
</#macro>
<@queryUsername username="admin"></@queryUsername>


<#--自定义包含内置指令-->
<hr/>
<#macro cfb>
    <#list 1..9 as i>
        <#list 1..i as j>
            ${j}*${i}=${j*i} &nbsp;
        </#list>
        <br/>
    </#list>
</#macro>
<@cfb></@cfb>

<hr/>
<#macro cfb2 num>
    <#list 1..num as i>
        <#list 1..i as j>
            ${j}*${i}=${j*i} &nbsp;
        </#list>
        <br/>
    </#list>
</#macro>
<@cfb2 num=4></@cfb2>
<hr/>
<#macro test>
    这是一段文本
    <#nested >
</#macro>
<@test>xxxxx</@test>