package com.example.nrhouserentalsystem;

import java.util.Date;

public class HouseDetails  implements java.io.Serializable {
    public Integer hID;
    public String hName;
    public Double hMP;
    public String hAddress;
    public Date hPublishDate; //TO_DATE(SYSDATE,'dd-MM-yyyy') bila insert//
    public Boolean hAvailability; //boolean hasCreatePermission= Boolean.parseBoolean(request.getParameter("hasCreatePermission"));
    public Integer hNoTenants; //studentId = Integer.parseInt(request.getParameter("StudentId"));
    public Integer hNoRoom;
    public Integer hNoToilet;
    public Integer hNoAC;
    public Boolean hWifi;
    public Integer hFurniture;
    public Integer hWM;
    public String desc;
    public String hPicName;
    public String hAgreeName;

    public HouseDetails() {

    }

    public HouseDetails(Integer hID, String hName, Double hMP, String hAddress, Date hPublishDate, Boolean hAvailability, Integer hNoTenants, Integer hNoRoom, Integer hNoToilet, Integer hNoAC, Boolean hWifi, Integer hFurniture, Integer hWM, String desc, String hPicName, String hAgreeName) {
        this.hID = hID;
        this.hName = hName;
        this.hMP = hMP;
        this.hAddress = hAddress;
        this.hPublishDate = hPublishDate;
        this.hAvailability = hAvailability;
        this.hNoTenants = hNoTenants;
        this.hNoRoom = hNoRoom;
        this.hNoToilet = hNoToilet;
        this.hNoAC = hNoAC;
        this.hWifi = hWifi;
        this.hFurniture = hFurniture;
        this.hWM = hWM;
        this.desc = desc;
        this.hPicName = hPicName;
        this.hAgreeName = hAgreeName;
    }

    public Integer gethID() {
        return hID;
    }

    public String gethName() {
        return hName;
    }

    public Double gethMP() {
        return hMP;
    }

    public String gethAddress() {
        return hAddress;
    }

    public Date gethPublishDate() {
        return hPublishDate;
    }

    public Boolean gethAvailability() {
        return hAvailability;
    }

    public Integer gethNoTenants() {
        return hNoTenants;
    }

    public Integer gethNoRoom() {
        return hNoRoom;
    }

    public Integer gethNoToilet() {
        return hNoToilet;
    }

    public Integer gethNoAC() {
        return hNoAC;
    }

    public Boolean gethWifi() {
        return hWifi;
    }

    public Integer gethFurniture() {
        return hFurniture;
    }

    public Integer gethWM() {
        return hWM;
    }

    public String getDesc() {
        return desc;
    }


    public String gethPicName() {
        return hPicName;
    }

    public String gethAgreeName() {
        return hAgreeName;
    }

    public void sethID(Integer hID) {
        this.hID = hID;
    }

    public void sethName(String hName) {
        this.hName = hName;
    }

    public void sethMP(Double hMP) {
        this.hMP = hMP;
    }

    public void sethAddress(String hAddress) {
        this.hAddress = hAddress;
    }

    public void sethPublishDate(Date hPublishDate) {
        this.hPublishDate = hPublishDate;
    }

    public void sethAvailability(Boolean hAvailability) {
        this.hAvailability = hAvailability;
    }

    public void sethNoTenants(Integer hNoTenants) {
        this.hNoTenants = hNoTenants;
    }

    public void sethNoRoom(Integer hNoRoom) {
        this.hNoRoom = hNoRoom;
    }

    public void sethNoToilet(Integer hNoToilet) {
        this.hNoToilet = hNoToilet;
    }

    public void sethNoAC(Integer hNoAC) {
        this.hNoAC = hNoAC;
    }

    public void sethWifi(Boolean hWifi) {
        this.hWifi = hWifi;
    }

    public void sethFurniture(Integer hFurniture) {
        this.hFurniture = hFurniture;
    }

    public void sethWM(Integer hWM) {
        this.hWM = hWM;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public void sethPicName(String hPicName) {
        this.hPicName = hPicName;
    }

    public void sethAgreeName(String hAgreeName) {
        this.hAgreeName = hAgreeName;
    }
}

