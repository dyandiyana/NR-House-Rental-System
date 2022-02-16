package com.example.nrhouserentalsystem;

import javax.servlet.http.Part;
import java.io.Serializable;
import java.sql.Blob;


public class HouseImages  implements Serializable {

    public Part housepic;
    public String housepicname;

    public HouseImages () {

    }

    public HouseImages(Part housepic, String housepicname) {
        this.housepic = housepic;
        this.housepicname = housepicname;
    }

    public Part getHousepic() {
        return housepic;
    }

    public void setHousepic(Part housepic) {
        this.housepic = housepic;
    }

    public String getHousepicname() {
        return housepicname;
    }

    public void setHousepicname(String housepicname) {
        this.housepicname = housepicname;
    }
}
