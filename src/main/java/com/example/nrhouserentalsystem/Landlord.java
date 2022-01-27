package com.example.nrhouserentalsystem;

public class Landlord implements java.io.Serializable {

    public Integer landlordId;
    public String landlordUsername;
    public String landlordPassword;
    public String landlordName;
    public String landlordEmail;
    public String landlordAge;
    public String landlordPhoneNo;
    public String landlordGender;

    public Landlord(){

    }
    public Landlord(Integer landlordId, String landlordUsername, String landlordPassword, String landlordName, String landlordEmail, String landlordAge, String landlordPhoneNo, String landlordGender) {
        this.landlordId = landlordId;
        this.landlordUsername = landlordUsername;
        this.landlordPassword = landlordPassword;
        this.landlordName = landlordName;
        this.landlordEmail = landlordEmail;
        this.landlordAge = landlordAge;
        this.landlordPhoneNo = landlordPhoneNo;
        this.landlordGender = landlordGender;
    }

    public Integer getLandlordId() {
        return landlordId;
    }

    public void setLandlordId(Integer landlordId) {
        this.landlordId = landlordId;
    }

    public String getLandlordUsername() {
        return landlordUsername;
    }

    public void setLandlordUsername(String landlordUsername) {
        this.landlordUsername = landlordUsername;
    }

    public String getLandlordPassword() {
        return landlordPassword;
    }

    public void setLandlordPassword(String landlordPassword) {
        this.landlordPassword = landlordPassword;
    }

    public String getLandlordName() {
        return landlordName;
    }

    public void setLandlordName(String landlordName) {
        this.landlordName = landlordName;
    }

    public String getLandlordEmail() {
        return landlordEmail;
    }

    public void setLandlordEmail(String landlordEmail) {
        this.landlordEmail = landlordEmail;
    }

    public String getLandlordAge() {
        return landlordAge;
    }

    public void setLandlordAge(String landlordAge) {
        this.landlordAge = landlordAge;
    }

    public String getLandlordPhoneNo() {
        return landlordPhoneNo;
    }

    public void setLandlordPhoneNo(String landlordPhoneNo) {
        this.landlordPhoneNo = landlordPhoneNo;
    }

    public String getLandlordGender() {
        return landlordGender;
    }

    public void setLandlordGender(String landlordGender) {
        this.landlordGender = landlordGender;
    }
}
