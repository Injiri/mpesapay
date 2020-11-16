package org.openmrs.module.mpesapay.page.controller;


import org.openmrs.api.context.Context;
import org.openmrs.module.mpesapay.api.MpesapayService;

import javax.servlet.http.HttpServletRequest;

public class LipanampesaPageController {
    public LipanampesaPageController() {
    }

    public String processC2BPayment(HttpServletRequest request) {
        MpesapayService mpesaPayService = (MpesapayService) Context.getService(MpesapayService.class);
        String billCode = request.getParameter("billCode");
        String accountNumber = request.getParameter("accountNumber");
        Double paymentAmount = Double.valueOf(request.getParameter("paymentAmount"));

        return null;    /*TODO */
    }

}