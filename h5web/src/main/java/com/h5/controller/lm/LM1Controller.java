package com.h5.controller.lm;

import com.h5.service.lm.LM1Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lm1")
@Controller
public class LM1Controller {

    @Autowired
    private LM1Service lm1Service;
}
