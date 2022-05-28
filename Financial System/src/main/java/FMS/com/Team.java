/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FMS.com;

/**
 *
 * @author HP 840G
 */
public class Team {
    

    private String staffid;
    private String fullname;
    private String ic;
    private String email;
    private String phone;
    private String roles;
    
     public String getstaffid() {
        return staffid;
    }

    public void setstaffid(String staffid) {
        this.staffid = staffid;
    }

    public String getfullname() {
        return fullname;
    }

    public void setfullname(String fullname) {
        this.fullname = fullname;
    }

    public String getic() {
        return ic;
    }

    public void setic(String ic) {
        this.ic = ic;
    }

    public String getemail() {
        return email;
    }

    public void setemail(String email) {
        this.email = email;
    }

    public String getphone() {
        return phone;
    }

    public void setphone(String phone) {
        this.phone = phone;
    }

    public String getroles() {
        return roles;
    }

    public void setroles(String roles) {
        this.roles= roles;
    }

   
}

