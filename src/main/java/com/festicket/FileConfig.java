package com.festicket;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class FileConfig implements WebMvcConfigurer {

   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) {
      // TODO Auto-generated method stub
      registry.addResourceHandler("/upload/**")
        .addResourceLocations("file:///var/lib/tomcat9/webapps/upload/");
   }

}
