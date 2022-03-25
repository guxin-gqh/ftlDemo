<#--获取我们的数据-->
${msg}
${boolean?c}
${boolean?string}
${boolean?string('yes','no')}
${boolean?string('喜欢','不喜欢')}


<h5>Date Type</h5>
${createDate?date}<br/>
${createDate?datetime}<br/>
<#--设置格式-->
${createDate?string("yyyy/MM/dd HH:mm:ss")}<br/>



<#--数值数据-->
<#--    freemarke中数值可以直接输出
    1.转字符串
       普通字符串 ?c
       货币整型字符串 ?string.currency
       百分比型字符串 ?Srting.percent
     2.保留浮点数的小数位输出 ?Srting["0.##"] #个数表示保留的位数
    -->
${age}
${avg}
<#--将数值转化为字符串类型-->
${avg?c}
<#--将数值转化为货币类型字符串-->
${avg?string.currency}
<#--将数值转换为百分比-->
${avg?string.percent}
<#--保留指定小数 #号的个数等于保留小数的位数-->
${avg?string["0.##"]}

<hr>
<h5>字符串类型</h5>
<#--    字符串类型-->
<#--
    1.截取字符串（左开右闭） ?substring(start,end)
    2.首字母小写输出 ?upcap_first
    3.首字母大写输出 ?cap_first
    4.字母转小写输出 ?lower_case
    5.字母转大写输出 ?uper_case
    6.获取字符串长度 ?length
    7.是否以指定字符开头 （boolean类型）?starts_with("xx")?string
    8.是否已指定字符结尾 （boolean类型）?ends_with("xx")?string
    9.获取指定字符的索引  ?index_of("xx")
    10.去除字符串前后空格 ?trim
    11.替换指定字符串  ?replace("xx","xx")
-->
${msg1}---${msg2}<br/>


<#--freemarker数据类型
    序列类型（数组，list，set）
        通过list指令输出序列
        <#list 序列名 as 元素名>
        ${元素名}
        </# list>

        获取序列的长度    ${序列名?size}
        获取序列的元素下标 ${序列名?index}
        获取第一个元素    ${序列名?first}
        获取最后一个元素  ${序列名?end}


         倒序输出        序列名?reverse
         升序输出        序列名?sort
         降序输出        序列名?sort?reverse
         指定字段名排序   序列名?sort_by("字段名")                    x
-->

<hr/>

<#--
   数据类型：hash类型
      key遍历输出
      获取map的key及key对应的value
      <#list hash?keys as key>
      ${key}---${hash[key]}
      </#list>
      value遍历输出
      获取map的value
      <#list hash?values as value>
      ${value}
      </#value>

-->
<#--    key遍历输出-->
<#list cityMap?keys as key>
    ${key}   ---${cityMap[key]}<br/>
</#list>

<#list cityMap?values as value>
    ${value}
</#list>


<#assign num=1 names=["a","b","c"]>
${num}<br/>
${names?join(",")}
<#--join("") 分割方法-->

<#assign str="hhh">
${str}