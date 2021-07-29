package icu.liuwisdom.common.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * 获取验证的Servlet
 *
 * */
@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
    private static int WIDTH = 60;// 宽
    private static int HEIGHT = 30;// 高

    /**
     * The doGet method of the servlet. <br>
     * <p>
     * This method is called when a form has its tag value method equals to get.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();//通过session存储验证码
        response.setContentType("image/jpeg");//设置响应方式为图片形式
        ServletOutputStream sos = response.getOutputStream();
        // 设置响应头
        response.setHeader("Pragma", "No-cache");//不开启缓存
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);//立即刷新
        // 定义图像对像
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT,
                BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();//画布
        // 生成验证码
        char[] rands = generateCheckCode();
        // 绘制
        drawBackground(g);
        drawRands(g, rands);
        //关闭
        g.dispose();
        // 输出图形
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ImageIO.write(image, "JPEG", bos);
        byte[] buf = bos.toByteArray();//缓冲输出
        response.setContentLength(buf.length);//设置缓冲
        // 输出
        sos.write(buf);
        bos.close();
        sos.close();
        // 保存验证码
        session.setAttribute("check_code", new String(rands));
    }

    // 随机生成验证码
    private char[] generateCheckCode() {
        // 定义数据
        String chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUEWXYZ";
        char[] rands = new char[4];
        for (int i = 0; i < 4; i++) {
            int rand = (int) (Math.random() * 60);
            rands[i] = chars.charAt(rand);
        }
        return rands;
    }

    //绘制图形
    private void drawRands(Graphics g, char[] rands) {
        g.setColor(Color.BLACK);
        g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 18));
        // 绘制验证码
        g.drawString("" + rands[0], 1, 17);//?????????
        g.drawString("" + rands[1], 16, 15);
        g.drawString("" + rands[2], 31, 18);
        g.drawString("" + rands[3], 46, 16);
        //System.out.println(rands);
    }

    private void drawBackground(Graphics g) {
        // 绘制背景
        g.setColor(new Color(0xDCDCDC));
        g.fillRect(0, 0, WIDTH, HEIGHT);
        // 绘制干扰线
        for (int i = 0; i < 50; i++) {
            int x = (int) (Math.random() * WIDTH);
            int y = (int) (Math.random() * HEIGHT);
            int red = (int) (Math.random() * 255);
            int green = (int) (Math.random() * 255);
            int blue = (int) (Math.random() * 255);
            g.setColor(new Color(red, green, blue));
            g.drawOval(x, y, 5, 0);
        }
    }
}
