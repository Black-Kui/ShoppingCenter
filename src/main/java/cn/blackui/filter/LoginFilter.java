package cn.blackui.filter;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginFilter implements HandlerInterceptor {

    /**
     *
     * @param request
     * @param response
     * @param handler 打印出来com.mmm.controller.UserController@6225177c
     * @return
     * @throws Exception
     *
     *
     * HandlerInterceptor接口中的三个方法：
    01.preHandle 如果返回值是false,则不会执行后续的操作！ 一个拦截器
    preHandle如果返回值是true 则会执行下一个拦截器。。
    02.如果有多个拦截器，则之后拦截器中的所有方法都不会执行！
     */

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("执行了 拦截器1111中的 ===》preHandle");

        return true;
    }

    /**
     * 之后指定了对应Handler中的方法之后 才执行！
     * @param modelAndView 打印出来 ModelAndView: reference to view with name 'success'; model is {welcome=恭喜您登录成功}
     * @throws Exception
     */

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("执行了 拦截器1111中的===》postHandle");

    }

    /**
     * 只要是当前拦截器中的preHandle返回true则此方法必须执行！
     * @param handler 打印出来com.mmm.controller.UserController@6225177c
     * @param ex
     * @throws Exception
     */

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("执行了 拦截器1111的 ===》afterCompletion");
    }
}
