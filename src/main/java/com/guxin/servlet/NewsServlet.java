package com.guxin.servlet;


import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import javafx.beans.binding.ObjectExpression;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/news")
public class NewsServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//       实例化模板
        Configuration configuration = new Configuration();
//        设置加载模板的上下文，以及加载模板的路径 模板存放路径
        configuration.setServletContextForTemplateLoading(getServletContext(),"/template");
//        设置模板的编码格式
        configuration.setDefaultEncoding("utf-8");
//        加载模板文件 获取模板对象
        Template template = configuration.getTemplate("news.ftl");
//        准备数据模型
        Map<String, Object> map=new HashMap<>();
        map.put("title","2022年法国总统大选候选人佩克雷斯新冠病毒检测结果呈阳性");
        map.put("source","央视新闻");
        map.put("putTime","2022年03月25日 11:21:23");
        map.put("content","当地时间3月24日，2022年法国总统大选右翼共和党候选人瓦莱丽·佩克雷斯(Valérie Pécresse)表示，其新冠病毒检测结果为阳性，将继续远程参加竞选活动，并遵守卫生规定。她也将因此缺席原定于25日在波尔多举行的竞选集会。(总台记者 马瑾瑾）");
//获取项目根目录
        String basePath=req.getServletContext().getRealPath("/");
//设置html的存放路径
        File htmlFile=new File(basePath+"/html");
//        判断目录是否存在
        if (!htmlFile.exists()){
//            如果不存在则新建目录
            htmlFile.mkdir();

        }
//        得到生成的文件名 生成随机补充都的文件名
        String fileName=System.currentTimeMillis()+".html";
//        创建html文件
        File file=new File(htmlFile,fileName);
//        获取文件输出流
        FileWriter writer=new FileWriter(file);




        //        生成html（将数据模型填充到模板中）

        try {
            template.process(map,writer);
        } catch (TemplateException e) {
            e.printStackTrace();
        }finally {
//            关闭资源
            writer.flush();
            writer.close();


        }
    }
}
