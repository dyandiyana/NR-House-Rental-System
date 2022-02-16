package com.example.nrhouserentalsystem;

import java.util.Date;

public class MonthlyPayment {
    public int payId;
    public Date payDueDate;
    public Date payDate;
    public String payReceipt;
    public String payStatus;
    public Float payPrice;

    public MonthlyPayment(){

    }

    public MonthlyPayment(int payId, Date payDueDate, Date payDate, String payReceipt, String payStatus, Float payPrice) {
        this.payId = payId;
        this.payDueDate = payDueDate;
        this.payDate = payDate;
        this.payReceipt = payReceipt;
        this.payStatus = payStatus;
        this.payPrice = payPrice;
    }

    public int getPayId() {
        return payId;
    }

    public void setPayId(int payId) {
        this.payId = payId;
    }

    public Date getPayDueDate() {
        return payDueDate;
    }

    public void setPayDueDate(Date payDueDate) {
        this.payDueDate = payDueDate;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public String getPayReceipt() {
        return payReceipt;
    }

    public void setPayReceipt(String payReceipt) {
        this.payReceipt = payReceipt;
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    public Float getPayPrice() {
        return payPrice;
    }

    public void setPayPrice(Float payPrice) {
        this.payPrice = payPrice;
    }
}
