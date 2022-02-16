package com.example.nrhouserentalsystem;

import java.util.Date;

public class HouseDetails  implements java.io.Serializable {
    public Integer hID;
    public String hName;
    public Double hMP;
    public String hAddress;
    public Date hPublishDate; //TO_DATE(SYSDATE,'dd-MM-yyyy') bila insert//
    public String hAvailability; //boolean hasCreatePermission= Boolean.parseBoolean(request.getParameter("hasCreatePermission"));
    public Integer hNoTenants; //studentId = Integer.parseInt(request.getParameter("StudentId"));
    public Integer hNoRoom;
    public Integer hNoToilet;
    public Integer hNoAC;
    public String hWifi;
    public Integer hFurniture;
    public Integer hWM;
    public String desc;
    public String hlocation;
    public Integer LandlordID;

    public HouseDetails() {

    }

    public HouseDetails(Integer hID, String hName, Double hMP, String hAddress, Date hPublishDate, String hAvailability, Integer hNoTenants, Integer hNoRoom, Integer hNoToilet, Integer hNoAC, String hWifi, Integer hFurniture, Integer hWM, String desc, String hlocation, Integer landlordID) {
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
        this.hlocation = hlocation;
        LandlordID = landlordID;
    }

    public Integer gethID() {
        return hID;
    }

    public void sethID(Integer hID) {
        this.hID = hID;
    }

    public String gethName() {
        return hName;
    }

    public void sethName(String hName) {
        this.hName = hName;
    }

    public Double gethMP() {
        return hMP;
    }

    public void sethMP(Double hMP) {
        this.hMP = hMP;
    }

    public String gethAddress() {
        return hAddress;
    }

    public void sethAddress(String hAddress) {
        this.hAddress = hAddress;
    }

    public Date gethPublishDate() {
        return hPublishDate;
    }

    public void sethPublishDate(Date hPublishDate) {
        this.hPublishDate = hPublishDate;
    }

    public String gethAvailability() {
        return hAvailability;
    }

    public void sethAvailability(String hAvailability) {
        this.hAvailability = hAvailability;
    }

    public Integer gethNoTenants() {
        return hNoTenants;
    }

    public void sethNoTenants(Integer hNoTenants) {
        this.hNoTenants = hNoTenants;
    }

    public Integer gethNoRoom() {
        return hNoRoom;
    }

    public void sethNoRoom(Integer hNoRoom) {
        this.hNoRoom = hNoRoom;
    }

    public Integer gethNoToilet() {
        return hNoToilet;
    }

    public void sethNoToilet(Integer hNoToilet) {
        this.hNoToilet = hNoToilet;
    }

    public Integer gethNoAC() {
        return hNoAC;
    }

    public void sethNoAC(Integer hNoAC) {
        this.hNoAC = hNoAC;
    }

    public String gethWifi() {
        return hWifi;
    }

    public void sethWifi(String hWifi) {
        this.hWifi = hWifi;
    }

    public Integer gethFurniture() {
        return hFurniture;
    }

    public void sethFurniture(Integer hFurniture) {
        this.hFurniture = hFurniture;
    }

    public Integer gethWM() {
        return hWM;
    }

    public void sethWM(Integer hWM) {
        this.hWM = hWM;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getHlocation() {
        return hlocation;
    }

    public void setHlocation(String hlocation) {
        this.hlocation = hlocation;
    }

    public Integer getLandlordID() {
        return LandlordID;
    }

    public void setLandlordID(Integer landlordID) {
        LandlordID = landlordID;
    }
}

