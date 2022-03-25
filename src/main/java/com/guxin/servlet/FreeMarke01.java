package com.guxin.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet("/f01")
public class FreeMarke01 extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置数据（给模板设置数据)
        System.out.println("hhhh");
        req.setAttribute("msg","Hello FreeMarker!");
        req.setAttribute("boolean",true);
        req.setAttribute("createDate",new Date());
//        数值型
        req.setAttribute("age",19);
//      浮点型
        req.setAttribute("avg",0.545);

/*字符串类型*/
        req.setAttribute("msg1","hello");
        req.setAttribute("msg2","freemarke");


/*sequence类型*/
        String[] starts=new String[]{"周杰伦","esson","jack","tom"};
        req.setAttribute("stars","starts");
        List<String> citys= Arrays.asList("shagnhai","hangzhou","sichuan");
        req.setAttribute("citys","citys");
/*hash类型*/

        Map<String,String> cityMap=new HashMap<>();
        cityMap.put("sh","上海");
        cityMap.put("bj","北京");
        cityMap.put("hz","杭州");
        req.setAttribute("cityMap",cityMap);

        //请求转发
        req.getRequestDispatcher("template/f01.ftl").forward(req,resp);
    }
}
