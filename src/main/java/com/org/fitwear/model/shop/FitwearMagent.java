package com.org.fitwear.model.shop;

public class FitwearMagent {
    private Long magId;

    private String magName;

    private String prudId;

    private String prudName;

    private String createName;

    private String createTime;

    private String magCode;

    public Long getMagId() {
        return magId;
    }

    public void setMagId(Long magId) {
        this.magId = magId;
    }

    public String getMagName() {
        return magName;
    }

    public void setMagName(String magName) {
        this.magName = magName == null ? null : magName.trim();
    }

    public String getPrudId() {
        return prudId;
    }

    public void setPrudId(String prudId) {
        this.prudId = prudId == null ? null : prudId.trim();
    }

    public String getPrudName() {
        return prudName;
    }

    public void setPrudName(String prudName) {
        this.prudName = prudName == null ? null : prudName.trim();
    }

    public String getCreateName() {
        return createName;
    }

    public void setCreateName(String createName) {
        this.createName = createName == null ? null : createName.trim();
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public String getMagCode() {
        return magCode;
    }

    public void setMagCode(String magCode) {
        this.magCode = magCode == null ? null : magCode.trim();
    }
}