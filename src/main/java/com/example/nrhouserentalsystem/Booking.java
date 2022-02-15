package com.example.nrhouserentalsystem;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class Booking implements Serializable{
    public int bookingid;
    public String bookingStatus;
    public Timestamp bookingTime;
    public Date bookingDate;
    public String bookingDepo;
    public String bookingAgreement;
    public Date bookingApprovalDate;

    public Booking(){

    }

    public Booking(int bookingid, String bookingStatus, Timestamp bookingTime, Date bookingDate, String bookingDepo, String bookingAgreement, Date bookingApprovalDate) {
        this.bookingid = bookingid;
        this.bookingStatus = bookingStatus;
        this.bookingTime = bookingTime;
        this.bookingDate = bookingDate;
        this.bookingDepo = bookingDepo;
        this.bookingAgreement = bookingAgreement;
        this.bookingApprovalDate = bookingApprovalDate;
    }

    public int getBookingid() {
        return bookingid;
    }

    public void setBookingid(int bookingid) {
        this.bookingid = bookingid;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public Timestamp getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(Timestamp bookingTime) {
        this.bookingTime = bookingTime;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getBookingDepo() {
        return bookingDepo;
    }

    public void setBookingDepo(String bookingDepo) {
        this.bookingDepo = bookingDepo;
    }

    public String getBookingAgreement() {
        return bookingAgreement;
    }

    public void setBookingAgreement(String bookingAgreement) {
        this.bookingAgreement = bookingAgreement;
    }

    public Date getBookingApprovalDate() {
        return bookingApprovalDate;
    }

    public void setBookingApprovalDate(Date bookingApprovalDate) {
        this.bookingApprovalDate = bookingApprovalDate;
    }
}
