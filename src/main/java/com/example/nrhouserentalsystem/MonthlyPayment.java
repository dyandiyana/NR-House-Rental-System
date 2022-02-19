package com.example.nrhouserentalsystem;

import java.sql.Date;

public class MonthlyPayment implements java.io.Serializable {
    public int payId;
    public Date payDueDate;
    public Date payDate;
    public String payReceipt;
    public String payStatus;
    public Double payPrice;
    public  String month;

    public MonthlyPayment(){

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

    public Double getPayPrice() {
        return payPrice;
    }

    public void setPayPrice(Double payPrice) {
        this.payPrice = payPrice;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }
}
