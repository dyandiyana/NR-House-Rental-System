package com.example.nrhouserentalsystem;

import java.io.Serializable;
import java.util.Date;

public class House implements Serializable {
    public int houseid;
    public String housename;
    public String housemonthlyprice;
    public String houseadress;
    public String houselocation;
    public Date housepublishdate;
    public String houseavailability;
    public int housenotenants;
    public int housenoroom;
    public int housenotoilet;
    public int housenoac;
    public String housewifi;
    public int housefurniture;
    public int housewm;
    public String housedescription;
    public String housepicname;
    public String houseagreement;

    public House() {
    }

    public int getHouseid() {
        return houseid;
    }

    public void setHouseid(int houseid) {
        this.houseid = houseid;
    }

    public String getHousename() {
        return housename;
    }

    public void setHousename(String housename) {
        this.housename = housename;
    }

    public String getHousemonthlyprice() {
        return housemonthlyprice;
    }

    public void setHousemonthlyprice(String housemonthlyprice) {
        this.housemonthlyprice = housemonthlyprice;
    }

    public String getHouseadress() {
        return houseadress;
    }

    public void setHouseadress(String houseadress) {
        this.houseadress = houseadress;
    }

    public String getHouselocation() {
        return houselocation;
    }

    public void setHouselocation(String houselocation) {
        this.houselocation = houselocation;
    }

    public Date getHousepublishdate() {
        return housepublishdate;
    }

    public void setHousepublishdate(Date housepublishdate) {
        this.housepublishdate = housepublishdate;
    }

    public String getHouseavailability() {
        return houseavailability;
    }

    public void setHouseavailability(String houseavailability) {
        this.houseavailability = houseavailability;
    }

    public int getHousenotenants() {
        return housenotenants;
    }

    public void setHousenotenants(int housenotenants) {
        this.housenotenants = housenotenants;
    }

    public int getHousenoroom() {
        return housenoroom;
    }

    public void setHousenoroom(int housenoroom) {
        this.housenoroom = housenoroom;
    }

    public int getHousenotoilet() {
        return housenotoilet;
    }

    public void setHousenotoilet(int housenotoilet) {
        this.housenotoilet = housenotoilet;
    }

    public int getHousenoac() {
        return housenoac;
    }

    public void setHousenoac(int housenoac) {
        this.housenoac = housenoac;
    }

    public String getHousewifi() {
        return housewifi;
    }

    public void setHousewifi(String housewifi) {
        this.housewifi = housewifi;
    }

    public int getHousefurniture() {
        return housefurniture;
    }

    public void setHousefurniture(int housefurniture) {
        this.housefurniture = housefurniture;
    }

    public int getHousewm() {
        return housewm;
    }

    public void setHousewm(int housewm) {
        this.housewm = housewm;
    }

    public String getHousedescription() {
        return housedescription;
    }

    public void setHousedescription(String housedescription) {
        this.housedescription = housedescription;
    }

    public String getHousepicname() {
        return housepicname;
    }

    public void setHousepicname(String housepicname) {
        this.housepicname = housepicname;
    }

    public String getHouseagreement() {
        return houseagreement;
    }

    public void setHouseagreement(String houseagreement) {
        this.houseagreement = houseagreement;
    }
}
