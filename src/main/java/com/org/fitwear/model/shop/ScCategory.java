package com.org.fitwear.model.shop;

public class ScCategory {
    private Long id;

    private String catename;

    private String cateflag;

    private String parantid;

    private Integer isdel;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename == null ? null : catename.trim();
    }

    public String getCateflag() {
        return cateflag;
    }

    public void setCateflag(String cateflag) {
        this.cateflag = cateflag == null ? null : cateflag.trim();
    }

    public String getParantid() {
        return parantid;
    }

    public void setParantid(String parantid) {
        this.parantid = parantid == null ? null : parantid.trim();
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }
}