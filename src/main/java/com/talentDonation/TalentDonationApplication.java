package com.talentDonation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@SpringBootApplication
@ComponentScan
@Configuration

public class TalentDonationApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(TalentDonationApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(TalentDonationApplication.class);
	}



	@Bean public ViewResolver myCustomViewResolver() {
	  InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();

	  viewResolver.setPrefix("/WEB-INF/jsp/");
	  viewResolver.setSuffix(".jsp");

	  return viewResolver;

	}



}
