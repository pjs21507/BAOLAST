package spring.bao.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.jar.Attributes.Name;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import spring.bao.beans.MemberBean;
import spring.bao.mapper.AuthenticationIf;
import spring.bao.utils.Encryption;
import spring.bao.utils.ProjectUtils;


@Service
public class Authentication {
   
   public Authentication() {}
   @Autowired
   HttpServletResponse response;
   @Autowired
   private AuthenticationIf mapper;
   @Autowired
   private PlatformTransactionManager tran;
   @Autowired
   private Gson gson;
   @Autowired
   private Encryption enc;
   @Autowired
   private ProjectUtils pu;
   @Autowired
   private HttpServletRequest request;
   
   

      public ModelAndView entrance(MemberBean memberbean) throws Exception {
         
         ModelAndView mav = new ModelAndView();
         
         switch(request.getRequestURI().substring(1)) {

            case "LogInForm":
               mav = this.loginFormCtl(memberbean);
               break;
            case "Login":
               mav = this.loginCtl(memberbean);
               break;
            case "JoinForm":
               mav = this.joinFormCtl(memberbean);
               break;
            case "Join":
               mav =this.joinCtl(memberbean);
               break;
            case "Logout":
               mav =this.logoutCtl(memberbean);
               break;
         }
         return mav;
      }
   
      private ModelAndView loginCtl(MemberBean member) throws Exception {
          TransactionStatus status =tran.getTransaction(new DefaultTransactionDefinition());
          //????????? ???????????? /????????? ????????? 
          //????????? ?????????????????? ???????????????  ????????????  ? 
             System.out.println(member.getMId()); 
           ModelAndView mav = new ModelAndView();
             if(this.isMember(member)) {
                if(this.isAccess(member)) {
                   member.setMStCode("1");
                   if(this.insAccess(member)) {
                   pu.setAttribute("mId",member.getMId());
                   
                   
                   member.setMId(pu.getSessionId());
                   
                   mav.setViewName("Authentication/goMain");
                   tran.commit(status);
                   }
                }else {
                   System.out.println("????????? ??????");
                   response.setContentType("text/html; charset=UTF-8");
                    
                   PrintWriter out = response.getWriter();
                    
                   out.println("<script>alert('????????? ??????');</script>");
                    
                   out.flush();
                   mav.setViewName("Authentication/login");
                   tran.rollback(status);
                }
             }
          return mav;         
       }

      private ModelAndView logoutCtl(MemberBean member) throws Exception {
         TransactionStatus status =tran.getTransaction(new DefaultTransactionDefinition());
         
         ModelAndView mav = new ModelAndView();


          member.setMId((String) pu.getAttribute("mId")); 
           

         if(pu.getAttribute("mId") != "") {
            member.setMStCode("-1");
            if(this.insAccess(member)) { 
            pu.removeAttribute("mId");

            mav.setViewName("Authentication/goMain");
            tran.commit(status);
         }
         }
            return mav;         
      }
      
      
      private ModelAndView joinCtl(MemberBean member) throws Exception {
         TransactionStatus status =tran.getTransaction(new DefaultTransactionDefinition());
         
         ModelAndView mav = new ModelAndView();
         System.out.println("id"+member.getMId());
         if(this.isMember(member)) {//?????????????????????
            response.setContentType("text/html; charset=UTF-8");
             
             PrintWriter out = response.getWriter();
              
             out.println("<script>alert('???????????????');</script>");
              
             out.flush();
            
            mav.setViewName("Authentication/login"); //???????????? ?????? 
            
         }else{
            
            //
            member.setMPw(enc.encode(member.getMPw()));
            if(this.insMember(member)) {
               response.setContentType("text/html; charset=UTF-8");
                
                PrintWriter out = response.getWriter();
                 
                out.println("<script>alert('???????????? ???????????????');</script>");
                 
                out.flush();
                tran.commit(status);  
                mav.setViewName("Authentication/login");// ?????????????????????????????? 

            }
            
         } 
         
         return mav;         
      }
   
    
   


      private boolean convetToBoolean(int data) {
         return data ==1 ? true : false;
      }
      private boolean insMember(MemberBean member) {
         
         return this.convetToBoolean(mapper.insMember(member));
      }


      private boolean isMember(MemberBean member) {
         
         return this.convetToBoolean(mapper.isMember(member));
      }


      private ModelAndView joinFormCtl(MemberBean member) throws Exception {
         ModelAndView mav = new ModelAndView();
         mav.setViewName("Authentication/join");
         return mav;         
      }
  

      private boolean insAccess(MemberBean member) {
         return this.convetToBoolean(mapper.insAccess(member));
         
      }


      private boolean isAccess(MemberBean member) {
         return enc.matches(member.getMPw(), mapper.isAccess(member).getMPw());
         
      }


      private ModelAndView loginFormCtl(MemberBean member) {
         ModelAndView mav = new ModelAndView();
         //System.out.println("loginFormCtl");
         mav.setViewName("Authentication/login");
         return mav;         
      }

}