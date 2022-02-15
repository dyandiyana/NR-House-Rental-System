package com.example.nrhouserentalsystem;

import java.io.Serializable;

public class Tenant implements Serializable {
    public int tenantId;
    public String tenantUsername;
    public String tenantPassword;
    public String tenantName;
    public String tenantEmail;
    public int tenantAge;
    public String tenantPhoneNo;
    public String tenantGender;

    public Tenant(){
    }

    public Tenant(int tenantId, String tenantUsername, String tenantPassword, String tenantName, String tenantEmail, int tenantAge, String tenantPhoneNo, String tenantGender) {
        this.tenantId = tenantId;
        this.tenantUsername = tenantUsername;
        this.tenantPassword = tenantPassword;
        this.tenantName = tenantName;
        this.tenantEmail = tenantEmail;
        this.tenantAge = tenantAge;
        this.tenantPhoneNo = tenantPhoneNo;
        this.tenantGender = tenantGender;
    }

    public int getTenantId() {
        return tenantId;
    }

    public void setTenantId(int tenantId) {
        this.tenantId = tenantId;
    }

    public String getTenantUsername() {
        return tenantUsername;
    }

    public void setTenantUsername(String tenantUsername) {
        this.tenantUsername = tenantUsername;
    }

    public String getTenantPassword() {
        return tenantPassword;
    }

    public void setTenantPassword(String tenantPassword) {
        this.tenantPassword = tenantPassword;
    }

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    public String getTenantEmail() {
        return tenantEmail;
    }

    public void setTenantEmail(String tenantEmail) {
        this.tenantEmail = tenantEmail;
    }

    public int getTenantAge() {
        return tenantAge;
    }

    public void setTenantAge(int tenantAge) {
        this.tenantAge = tenantAge;
    }

    public String getTenantPhoneNo() {
        return tenantPhoneNo;
    }

    public void setTenantPhoneNo(String tenantPhoneNo) {
        this.tenantPhoneNo = tenantPhoneNo;
    }

    public String getTenantGender() {
        return tenantGender;
    }

    public void setTenantGender(String tenantGender) {
        this.tenantGender = tenantGender;
    }

    @Override
    public String toString() {
        return "Tenant{" +
                "tenantId='" + tenantId + '\'' +
                ", tenantUserName='" + tenantUsername + '\'' +
                ", tenantPassword='" + tenantPassword + '\'' +
                ", tenantName='" + tenantName + '\'' +
                ", tenantEmail='" + tenantEmail + '\'' +
                ", tenantAge='" + tenantAge + '\'' +
                ", tenantPhoneNO='" + tenantPhoneNo + '\'' +
                ", tenantGender='" + tenantGender + '\'' +
                '}';
    }
}


